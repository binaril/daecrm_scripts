START TRANSACTION;
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (105, '', 'Admin / finance recalculation', 0);

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260514164638_add_recalc_security', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "Users" ADD "CanRecalculate" boolean NOT NULL DEFAULT FALSE;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260514204902_add_cancalc_useraccess', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "Users" ADD "IsSystem" boolean NOT NULL DEFAULT FALSE;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260520200151_add_issystem_user', '10.0.1');

COMMIT;

