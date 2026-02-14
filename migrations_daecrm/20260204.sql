START TRANSACTION;
INSERT INTO "PurposeReportType" ("Id", "Name")
VALUES (4, 'Electric charge');

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260204163915_add_purpose_type_electric', '10.0.1');

COMMIT;

