START TRANSACTION;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260922173108_AddIllegalTripNotify') THEN
    DROP INDEX "IX_DriverWhatsappMessages_Kind_RefId";
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260922173108_AddIllegalTripNotify') THEN
    ALTER TABLE "DriverNotificationSettings" ADD "IllegalTripNotifyEnabledAtUtc" timestamp with time zone;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260922173108_AddIllegalTripNotify') THEN
    CREATE UNIQUE INDEX "IX_DriverWhatsappMessages_Kind_RefId" ON "DriverWhatsappMessages" ("Kind", "RefId") WHERE "Kind" IN (2, 3);
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260922173108_AddIllegalTripNotify') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20260922173108_AddIllegalTripNotify', '10.0.1');
    END IF;
END $EF$;
COMMIT;

START TRANSACTION;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260923191129_CabmanTripSignal') THEN
    ALTER TABLE "CabmanTrips" ADD "FreeSince" timestamp with time zone;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260923191129_CabmanTripSignal') THEN
    ALTER TABLE "CabmanTrips" ADD "IllegalReason" integer;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260923191129_CabmanTripSignal') THEN
    ALTER TABLE "CabmanTrips" ADD "SuggestedUserId" bigint;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260923191129_CabmanTripSignal') THEN
    ALTER TABLE "CabmanCompanies" ADD "TripSignal" integer NOT NULL DEFAULT 0;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260923191129_CabmanTripSignal') THEN
    ALTER TABLE "CabmanCarStatuses" ADD "Occupied" boolean NOT NULL DEFAULT FALSE;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260923191129_CabmanTripSignal') THEN
    CREATE INDEX "IX_CabmanTrips_SuggestedUserId" ON "CabmanTrips" ("SuggestedUserId");
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260923191129_CabmanTripSignal') THEN
    ALTER TABLE "CabmanTrips" ADD CONSTRAINT "FK_CabmanTrips_Users_SuggestedUserId" FOREIGN KEY ("SuggestedUserId") REFERENCES "Users" ("Id") ON DELETE RESTRICT;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260923191129_CabmanTripSignal') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20260923191129_CabmanTripSignal', '10.0.1');
    END IF;
END $EF$;
COMMIT;

