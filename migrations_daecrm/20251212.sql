START TRANSACTION;

DROP INDEX "IX_CabmanTrips_CabmanCarId";

CREATE INDEX "IX_CabmanTrips_CabmanCarId_EndTime" ON "CabmanTrips" ("CabmanCarId", "EndTime");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251211191330_add_cabman_trip_indexes', '8.0.6');

COMMIT;



START TRANSACTION;

ALTER TABLE "CabmanCars" DROP CONSTRAINT "FK_CabmanCars_CabmanCarStatuses_CurrentCabmanStatusId";

ALTER TABLE "CabmanCars" ADD CONSTRAINT "FK_CabmanCars_CabmanCarStatuses_CurrentCabmanStatusId" FOREIGN KEY ("CurrentCabmanStatusId") REFERENCES "CabmanCarStatuses" ("Id") ON DELETE SET NULL;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251212155658_CarStatusOnDeleteBehavior', '8.0.6');

COMMIT;

