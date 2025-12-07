START TRANSACTION;

ALTER TABLE "Companies" ADD "OpenAiToken" text;

INSERT INTO "EventTriggers" ("Id", "Name")
VALUES (7, 'Mileage without orders (AI)');

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251115191350_add_aitoken', '8.0.6');

COMMIT;

START TRANSACTION;

INSERT INTO "EventTriggers" ("Id", "Name")
VALUES (8, 'Mileage without orders for day');

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251116071302_add_daily_mileage_trugger', '8.0.6');

COMMIT;

