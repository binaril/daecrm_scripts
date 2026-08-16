-- Backfill Zed driver/car bindings + display snapshot from the existing mirror tables.
--
-- WHEN: after the Phase 2 Task 1 migration is applied, and BEFORE turning ZedPublishToCore=true for a company.
-- SAFETY: idempotent (WHERE NOT EXISTS), insert-only, touches no existing row.
--
-- Enum values are stored as ints: AggregatorType.ZED = 5, TransactionDriverBinding.Auto = 1.
--
-- The snapshot is filled from the mirror's own columns, INCLUDING phone. It mirrors the core resolver's
-- ApplyDriverSnapshot: name = trim("LastName" ' ' "FirstName"), phone = first phone, carSign = '', email = '';
-- and ApplyCarSnapshot: plate = LicensePlate, brand = Brand, model = Model.
--
-- Zed specifics (must match the publish stamp in ZedHandler.cs, so the same row produces the same snapshot
-- in both the backfill and the live publish paths):
--   * Driver name — Zed publishes LastName = "Name", FirstName = "" → snapshot = $"{Name} ".Trim() = trim("Name").
--   * Driver phone — Zed publishes a single phone built as (CountryCode ?? "").Replace("+","") +
--     MobileNumber.ToString("D9"). C# "D9" zero-pads to a MINIMUM width of 9 and NEVER truncates: a >9-digit
--     number keeps all its digits (1234567890 → "1234567890"). Plain lpad(...,9,'0') would left-pad short
--     values fine but does NOT truncate either — HOWEVER, to make the never-truncate contract explicit and
--     bullet-proof, we branch: if the number is already >=9 digits use it verbatim, else zero-pad to 9. For
--     non-negative values this is the exact D9 equivalent (0 → '000000000', 9 digits → unchanged, 10+ → intact).
--     "MobileNumber" is a non-nullable bigint, hence the ::text cast. Negative numbers (a '-' sign inflates the
--     text length) would diverge from D9 — those are flagged as suspicious in VERIFY and must be handled by hand.
--   * Driver carSign / email — Zed publishes both empty, so the snapshot columns stay ''.
--   * Car plate/brand/model — Zed publishes LicensePlate = "LicenseNumber", Brand = "BrandName",
--     Model = "ModelName"; copied verbatim here.
--
-- External ids are plain strings on the mirror (NOT uuids): driver = "ZedId", car = "RefVehicleId". These are
-- the exact AggregatorExternalId values the publisher emits (ZedHandler publishes zedDriver.ZedId for the
-- driver and car.refVehicleId for the car), so no cast is needed and the ids line up across both paths.
--
-- Filling the snapshot here (rather than leaving phone/plate empty for the resolver to re-stamp) keeps a
-- company still on ZedPublishToCore=false intact: it never emits messages, so nothing would ever re-stamp,
-- and the readers fall back to the mirror only when the binding ROW is missing, not when a field is empty.
--
-- BindingMode = Auto (1), not Manual: these are resolver-equivalent links, and Manual would permanently
-- freeze them against re-resolution.

BEGIN;

-- DISTINCT ON collapses duplicate mirror rows sharing a (CompanyId, external_id): the mirror indexes are
-- non-unique, so two ZedDrivers rows can carry the same (CompanyId, "ZedId"). Without this a single
-- INSERT…SELECT would emit two rows with the same binding unique key and abort the whole backfill on a
-- unique violation (NOT EXISTS only guards against already-existing rows, not within-statement dupes).
-- ORDER BY … "Id" DESC makes the newest mirror row win — same "latest wins" rule as the runtime resolver.
INSERT INTO "AggregatorDriverBindings"
  ("AggregatorId","CompanyId","AggregatorExternalId","UserId","BindingMode","CreatedTime","ModifiedTime",
   "AggregatorDriverName","AggregatorPhone","AggregatorCarSign","AggregatorEmail")
SELECT DISTINCT ON (d."CompanyId", d."ZedId")
       5, d."CompanyId", d."ZedId", d."UserId", 1,
       now() AT TIME ZONE 'utc', now() AT TIME ZONE 'utc',
       trim(coalesce(d."Name",'')),
       replace(coalesce(d."CountryCode",''),'+','') ||
         CASE WHEN length(d."MobileNumber"::text) >= 9 THEN d."MobileNumber"::text
              ELSE lpad(d."MobileNumber"::text, 9, '0') END,
       '', ''
FROM "ZedDrivers" d
WHERE d."UserId" IS NOT NULL
  AND d."CompanyId" IS NOT NULL
  AND coalesce(d."ZedId",'') <> ''
  AND NOT EXISTS (
      SELECT 1 FROM "AggregatorDriverBindings" b
      WHERE b."AggregatorId" = 5
        AND b."CompanyId" = d."CompanyId"
        AND b."AggregatorExternalId" = d."ZedId")
ORDER BY d."CompanyId", d."ZedId", d."Id" DESC;

INSERT INTO "AggregatorCarBindings"
  ("AggregatorId","CompanyId","AggregatorExternalId","CarId","BindingMode","CreatedTime","ModifiedTime",
   "AggregatorPlate","AggregatorBrand","AggregatorModel")
SELECT DISTINCT ON (c."CompanyId", c."RefVehicleId")
       5, c."CompanyId", c."RefVehicleId", c."CarId", 1,
       now() AT TIME ZONE 'utc', now() AT TIME ZONE 'utc',
       coalesce(c."LicenseNumber",''), coalesce(c."BrandName",''), coalesce(c."ModelName",'')
FROM "ZedCars" c
WHERE c."CarId" IS NOT NULL
  AND c."CompanyId" IS NOT NULL
  AND coalesce(c."RefVehicleId",'') <> ''
  AND NOT EXISTS (
      SELECT 1 FROM "AggregatorCarBindings" b
      WHERE b."AggregatorId" = 5
        AND b."CompanyId" = c."CompanyId"
        AND b."AggregatorExternalId" = c."RefVehicleId")
ORDER BY c."CompanyId", c."RefVehicleId", c."Id" DESC;

COMMIT;

-- ── VERIFY ───────────────────────────────────────────────────────────────────────────────────────────
-- VERIFY 1 — both queries must return zero rows. A non-empty result means some linked mirror rows did not
-- produce a binding: investigate before flipping ZedPublishToCore, do not proceed on a mismatch.

-- Drivers: linked mirror rows without a binding.
SELECT d."CompanyId", count(*) AS missing_driver_bindings
FROM "ZedDrivers" d
WHERE d."UserId" IS NOT NULL AND d."CompanyId" IS NOT NULL AND coalesce(d."ZedId",'') <> ''
  AND NOT EXISTS (SELECT 1 FROM "AggregatorDriverBindings" b
                  WHERE b."AggregatorId" = 5 AND b."CompanyId" = d."CompanyId"
                    AND b."AggregatorExternalId" = d."ZedId")
GROUP BY d."CompanyId";

-- Cars: linked mirror rows without a binding.
SELECT c."CompanyId", count(*) AS missing_car_bindings
FROM "ZedCars" c
WHERE c."CarId" IS NOT NULL AND c."CompanyId" IS NOT NULL AND coalesce(c."RefVehicleId",'') <> ''
  AND NOT EXISTS (SELECT 1 FROM "AggregatorCarBindings" b
                  WHERE b."AggregatorId" = 5 AND b."CompanyId" = c."CompanyId"
                    AND b."AggregatorExternalId" = c."RefVehicleId")
GROUP BY c."CompanyId";

-- Sanity: mirror rows the backfill SKIPPED (no UserId/CarId) — expected non-zero, listed so the number is
-- known rather than assumed.
SELECT 'drivers_unlinked' AS what, count(*) FROM "ZedDrivers" WHERE "UserId" IS NULL
UNION ALL
SELECT 'cars_unlinked', count(*) FROM "ZedCars" WHERE "CarId" IS NULL;

-- Mirror duplicates: linked mirror rows sharing a (CompanyId, external_id). This need NOT be zero — the
-- DISTINCT ON above survives them (newest "Id" wins) — but the operator should SEE the collapsed rows so a
-- surprising binding count is explained rather than assumed to be a bug.
SELECT d."CompanyId", d."ZedId" AS ext, count(*)
FROM "ZedDrivers" d
WHERE d."UserId" IS NOT NULL AND d."CompanyId" IS NOT NULL AND coalesce(d."ZedId",'') <> ''
GROUP BY 1, 2 HAVING count(*) > 1;

SELECT c."CompanyId", c."RefVehicleId" AS ext, count(*)
FROM "ZedCars" c
WHERE c."CarId" IS NOT NULL AND c."CompanyId" IS NOT NULL AND coalesce(c."RefVehicleId",'') <> ''
GROUP BY 1, 2 HAVING count(*) > 1;

-- VERIFY 2a (phone sanity — RUN BEFORE the backfill): negative MobileNumber. MUST return 0. A negative value
-- produces a leading '-' in ::text, which diverges from C# "D9" (D9 pads the digits, not the sign) — so the
-- backfill and the publish stamp would disagree. A non-zero result is a STOP: investigate/fix those rows by hand.
SELECT count(*) AS suspicious_mobile FROM "ZedDrivers" WHERE "MobileNumber" < 0;

-- VERIFY 2b (informational — NOT a blocker): MobileNumber with >=10 digits. The never-truncate formula keeps
-- these intact (matching D9), so a non-zero count is fine — printed so the number is known, not assumed.
SELECT count(*) AS mobile_ge_10_digits FROM "ZedDrivers" WHERE "MobileNumber" >= 1000000000;

-- VERIFY 2c (phone format): confirm the backfilled phone matches the publish-path formula on 2-3 rows —
-- (CountryCode without '+') concatenated with MobileNumber formatted as C# "D9" (min width 9, never truncated).
SELECT d."ZedId",
       replace(coalesce(d."CountryCode",''),'+','') ||
         CASE WHEN length(d."MobileNumber"::text) >= 9 THEN d."MobileNumber"::text
              ELSE lpad(d."MobileNumber"::text, 9, '0') END AS backfill_phone
FROM "ZedDrivers" d
WHERE d."UserId" IS NOT NULL AND coalesce(d."ZedId",'') <> ''
LIMIT 3;
-- Cross-check backfill_phone against AggregatorPhone on the just-inserted binding row, and (once the flag is
-- enabled) against Phones[0] on a fresh publish message — all three must be identical.
