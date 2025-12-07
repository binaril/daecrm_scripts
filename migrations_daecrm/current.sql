select * from "__EFMigrationsHistory" order by "MigrationId" desc


GRANT SELECT, INSERT, DELETE, UPDATE ON "RepairParts" TO limousine;
GRANT SELECT, INSERT, DELETE, UPDATE ON "RepairOrders" TO limousine;
GRANT SELECT, INSERT, DELETE, UPDATE ON "RepairDocuments" TO limousine;
GRANT SELECT, INSERT, DELETE, UPDATE ON "RepairDocumentTypes" TO limousine;
GRANT SELECT, INSERT, DELETE, UPDATE ON "RepairOperations" TO limousine;
GRANT SELECT, INSERT, DELETE, UPDATE ON "RepairOperationTypes" TO limousine;