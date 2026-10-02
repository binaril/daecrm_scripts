-- Миграции релиза 2026-09-07 (idempotent, сгенерирован `dotnet ef migrations script
-- 20260829162009_AddAggregatorPollHeartbeat --idempotent --project DaeTaxi.DAL.Migrations`).
--
-- ПРАВКА РУКАМИ, не переген: четыре команды миграции 20260903154226 EF положил внутрь
-- `DO $EF$ … $EF$` — там `CREATE INDEX CONCURRENTLY` падает с «cannot be executed from a
-- function» (проверено). Они вынесены на верхний уровень; идемпотентность у них своя —
-- IF NOT EXISTS / IF EXISTS. Отметка в __EFMigrationsHistory осталась в DO-блоке.
--
-- psql -h <host> -p 8432 -U limousine -d daecrm -f 01-migrations.sql
-- Файл без BOM: с ним прод-прокси рвёт соединение на первом запросе.

START TRANSACTION;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260902185316_AuditFoldCardIntoAction') THEN
    ALTER TABLE "LogDbActions" DROP CONSTRAINT "FK_LogDbActions_LogDbEntries_LogDbEntryId";
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260902185316_AuditFoldCardIntoAction') THEN
    ALTER TABLE "LogDbActions" ALTER COLUMN "LogDbEntryId" DROP NOT NULL;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260902185316_AuditFoldCardIntoAction') THEN
    ALTER TABLE "LogDbActions" ADD "AuthorName" text;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260902185316_AuditFoldCardIntoAction') THEN
    ALTER TABLE "LogDbActions" ADD "CompanyId" bigint;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260902185316_AuditFoldCardIntoAction') THEN
    ALTER TABLE "LogDbActions" ADD "DisplayName" text;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260902185316_AuditFoldCardIntoAction') THEN
    ALTER TABLE "LogDbActions" ADD "EntityId" text;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260902185316_AuditFoldCardIntoAction') THEN
    ALTER TABLE "LogDbActions" ADD "EntityName" text;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260902185316_AuditFoldCardIntoAction') THEN
    ALTER TABLE "LogDbActions" ADD "ParentEntityId" text;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260902185316_AuditFoldCardIntoAction') THEN
    ALTER TABLE "LogDbActions" ADD "ParentEntityName" text;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260902185316_AuditFoldCardIntoAction') THEN
    ALTER TABLE "LogDbActions" ADD CONSTRAINT "FK_LogDbActions_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id");
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260902185316_AuditFoldCardIntoAction') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20260902185316_AuditFoldCardIntoAction', '10.0.1');
    END IF;
END $EF$;
COMMIT;

START TRANSACTION;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260902190910_AuditParentDisplayName') THEN
    ALTER TABLE "LogDbActions" ADD "ParentDisplayName" text;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260902190910_AuditParentDisplayName') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20260902190910_AuditParentDisplayName', '10.0.1');
    END IF;
END $EF$;
COMMIT;


CREATE INDEX CONCURRENTLY IF NOT EXISTS "IX_LogDbActions_CompanyId_Time" ON "LogDbActions" ("CompanyId", "Time");

CREATE INDEX CONCURRENTLY IF NOT EXISTS "IX_LogDbActions_UserId_Time" ON "LogDbActions" ("UserId", "Time");

CREATE INDEX CONCURRENTLY IF NOT EXISTS "IX_LogDbActions_EntityName_EntityId_Time" ON "LogDbActions" ("EntityName", "EntityId", "Time");

DROP INDEX CONCURRENTLY IF EXISTS "IX_LogDbActions_UserId";

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260903154226_AuditActionIndexesConcurrently') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20260903154226_AuditActionIndexesConcurrently', '10.0.1');
    END IF;
END $EF$;
START TRANSACTION;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260904183024_AddCarliftLegacyCustomerCardFlag') THEN
    ALTER TABLE "Users" ADD "CarliftLegacyCustomerCard" boolean NOT NULL DEFAULT FALSE;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260904183024_AddCarliftLegacyCustomerCardFlag') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20260904183024_AddCarliftLegacyCustomerCardFlag', '10.0.1');
    END IF;
END $EF$;
COMMIT;

