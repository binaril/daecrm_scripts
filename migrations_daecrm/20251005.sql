START TRANSACTION;

ALTER TABLE "ZedDrivers" ADD "IsBlocked" boolean NOT NULL DEFAULT FALSE;

ALTER TABLE "YandexDrivers" ADD "IsBlocked" boolean NOT NULL DEFAULT FALSE;

ALTER TABLE "UberDrivers" ADD "IsBlocked" boolean NOT NULL DEFAULT FALSE;

ALTER TABLE "BoltDrivers" ADD "IsBlocked" boolean NOT NULL DEFAULT FALSE;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251004172804_add_aggr_IsBlocked', '8.0.6');

COMMIT;

START TRANSACTION;

INSERT INTO "EventTriggers" ("Id", "Name")
VALUES (5, 'Block driver');

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251004210448_add_blocked_trigger', '8.0.6');

COMMIT;

START TRANSACTION;

INSERT INTO "EventTriggers" ("Id", "Name")
VALUES (6, 'Offline/online');

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251005105859_add_online_offline_trigger', '8.0.6');

COMMIT;

START TRANSACTION;

INSERT INTO "ReportTypes" ("Id", "Name")
VALUES (1, 'Cash balance report');

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251005165756_add_cash_report', '8.0.6');

COMMIT;

