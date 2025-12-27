START TRANSACTION;

ALTER TABLE "DriverSummaries" ADD "BeginOnline" timestamp with time zone;

ALTER TABLE "DriverSummaries" ADD "EndOnline" timestamp with time zone;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251216184908_add_begin_and_end_online', '8.0.6');

COMMIT;

START TRANSACTION;

ALTER TABLE "Users" ADD "ElectricStationTagId" text;

ALTER TABLE "Companies" ADD "FullName" text;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251220134853_add_ElectricStationTagId', '8.0.6');

COMMIT;

