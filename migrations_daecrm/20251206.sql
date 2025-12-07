START TRANSACTION;

INSERT INTO "UserRoles" ("Id", "IsPorlalRole", "Name")
VALUES (6, TRUE, 'Technic');

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251206151315_add_technic_role', '8.0.6');

COMMIT;

