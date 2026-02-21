START TRANSACTION;

ALTER TABLE "CompanyEventTriggers" ADD "AllowSend" boolean NOT NULL DEFAULT FALSE;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251014160923_add_CompanyEventTrigger_AllowSend', '8.0.6');

COMMIT;

