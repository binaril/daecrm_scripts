START TRANSACTION;

ALTER TABLE "ZedOrders" DROP COLUMN "PickupLatitude";

ALTER TABLE "ZedOrders" ADD "PickupLatitude" numeric NOT NULL DEFAULT 0.0;

ALTER TABLE "ZedOrders" DROP COLUMN "PickupLongitude";

ALTER TABLE "ZedOrders" ADD "PickupLongitude" numeric NOT NULL DEFAULT 0.0;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251017174005_change_columns_zedorder', '8.0.6');

COMMIT;

