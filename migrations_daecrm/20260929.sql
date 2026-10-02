START TRANSACTION;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260928181051_DropLegacyRbacTables') THEN
    DROP TABLE "CompanyRoleAccesses";
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260928181051_DropLegacyRbacTables') THEN
    DROP TABLE "UserCompanyGrants";
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260928181051_DropLegacyRbacTables') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20260928181051_DropLegacyRbacTables', '10.0.1');
    END IF;
END $EF$;
COMMIT;

