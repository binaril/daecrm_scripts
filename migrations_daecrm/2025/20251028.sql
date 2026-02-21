
START TRANSACTION;

ALTER TABLE "CompanyDriverTargets" DROP CONSTRAINT "FK_CompanyDriverTargets_ReportIntervals_ReportIntervalId";
DROP INDEX "IX_CompanyDriverTargets_ReportIntervalId";

ALTER TABLE "CompanyDriverTargets" RENAME COLUMN "ReportIntervalId" TO "ReportBaseIntervalId";
ALTER TABLE "CompanyDriverTargets" ALTER COLUMN "TotalIncomeTarget" TYPE numeric;
ALTER TABLE "CompanyDriverTargets" ALTER COLUMN "TotalIncomeMin" TYPE numeric;

ALTER TABLE "ReportIntervals" ADD "ReportBaseIntervalId" integer NOT NULL DEFAULT 0;

CREATE TABLE "ReportBaseIntervals" (
    "Id" integer NOT NULL,
    "Name" text,
    CONSTRAINT "PK_ReportBaseIntervals" PRIMARY KEY ("Id")
);

INSERT INTO "ReportBaseIntervals" ("Id", "Name")
VALUES (1, 'DAY');
INSERT INTO "ReportBaseIntervals" ("Id", "Name")
VALUES (2, 'WEEK');
INSERT INTO "ReportBaseIntervals" ("Id", "Name")
VALUES (3, 'MONTH');

UPDATE "ReportIntervals" SET "ReportBaseIntervalId" = 1
WHERE "Id" = 0;

UPDATE "ReportIntervals" SET "ReportBaseIntervalId" = 2
WHERE "Id" = 1;

UPDATE "ReportIntervals" SET "ReportBaseIntervalId" = 3
WHERE "Id" = 2;

UPDATE "ReportIntervals" SET "ReportBaseIntervalId" = 1
WHERE "Id" = 3;

UPDATE "ReportIntervals" SET "ReportBaseIntervalId" = 2
WHERE "Id" = 4;

UPDATE "ReportIntervals" SET "ReportBaseIntervalId" = 3
WHERE "Id" = 5;

CREATE INDEX "IX_ReportIntervals_ReportBaseIntervalId" ON "ReportIntervals" ("ReportBaseIntervalId");

CREATE INDEX "IX_CompanyDriverTargets_ReportBaseIntervalId" ON "CompanyDriverTargets" ("ReportBaseIntervalId");


update "CompanyDriverTargets" t
set "ReportBaseIntervalId" = (select ri."ReportBaseIntervalId" from "ReportIntervals" ri where ri."Id"=t."ReportBaseIntervalId")
where true;

ALTER TABLE "CompanyDriverTargets" ADD CONSTRAINT "FK_CompanyDriverTargets_ReportBaseIntervals_ReportBaseInterval~" FOREIGN KEY ("ReportBaseIntervalId") REFERENCES "ReportBaseIntervals" ("Id") ON DELETE CASCADE;

ALTER TABLE "ReportIntervals" ADD CONSTRAINT "FK_ReportIntervals_ReportBaseIntervals_ReportBaseIntervalId" FOREIGN KEY ("ReportBaseIntervalId") REFERENCES "ReportBaseIntervals" ("Id") ON DELETE CASCADE;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251027190710_add_carclasses_and_baseinterval', '8.0.6');

COMMIT;

GRANT SELECT, INSERT, DELETE, UPDATE ON "ReportBaseIntervals" TO limousine;


update "CarModels" set
"CarClassId" = 2 where "CarModels"."Id" in (10, 6, 16, 1, 18);

update "CarModels" set
"CarClassId" = 1 where "CarModels"."Id" not in (10, 6, 16, 1, 18);



