START TRANSACTION;
DROP TABLE "CareemDriverCoordinates";

DROP TABLE "CareemDriverStatuses";

DROP TABLE "CareemTokens";

DROP TABLE "CareemTransactions";

DROP TABLE "CareemCars";

DROP TABLE "CareemDrivers";

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260720183114_RetireCareemTables', '10.0.1');

COMMIT;

