START TRANSACTION;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260929195424_AddAggregatorDriverBindingAbsentSince') THEN
    ALTER TABLE "AggregatorDriverBindings" ADD "AbsentSince" timestamp with time zone;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20260929195424_AddAggregatorDriverBindingAbsentSince') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20260929195424_AddAggregatorDriverBindingAbsentSince', '10.0.1');
    END IF;
END $EF$;
COMMIT;

