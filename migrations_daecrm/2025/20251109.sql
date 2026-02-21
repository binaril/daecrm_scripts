START TRANSACTION;

DROP INDEX "IX_UserSummaryStatuses_UpdatedAt";

ALTER TABLE "UserSummaryStatuses" ADD "CarId" bigint NOT NULL DEFAULT 0;

ALTER TABLE "UserSummaryStatuses" ADD "EndTime" timestamp with time zone;

ALTER TABLE "UserSummaryStatuses" ADD "StartTime" timestamp with time zone NOT NULL DEFAULT TIMESTAMPTZ '-infinity';

INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (59, '', 'Driver events / read', 0);

CREATE INDEX "IX_UserSummaryStatuses_CarId" ON "UserSummaryStatuses" ("CarId");

CREATE INDEX "IX_UserSummaryStatuses_EndTime" ON "UserSummaryStatuses" ("EndTime");

CREATE INDEX "IX_UserSummaryStatuses_StartTime" ON "UserSummaryStatuses" ("StartTime");

ALTER TABLE "UserSummaryStatuses" ADD CONSTRAINT "FK_UserSummaryStatuses_Cars_CarId" FOREIGN KEY ("CarId") REFERENCES "Cars" ("Id") ON DELETE CASCADE;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251109163802_modify_summary_driver_status', '8.0.6');

COMMIT;

START TRANSACTION;

ALTER TABLE "UserSummaryStatuses" DROP CONSTRAINT "FK_UserSummaryStatuses_Cars_CarId";

ALTER TABLE "UserSummaryStatuses" ALTER COLUMN "CarId" DROP NOT NULL;

ALTER TABLE "UserSummaryStatuses" ADD "EndOdometer" numeric;

ALTER TABLE "UserSummaryStatuses" ADD "StartOdometer" numeric;

ALTER TABLE "UserSummaryStatuses" ADD CONSTRAINT "FK_UserSummaryStatuses_Cars_CarId" FOREIGN KEY ("CarId") REFERENCES "Cars" ("Id");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251109165139_add_UserSummaryStatus_odometer', '8.0.6');

COMMIT;

START TRANSACTION;

DROP INDEX "IX_CabmanCarStatuses_CabmanCarId";

CREATE INDEX "IX_CabmanCarStatuses_CabmanCarId_Time" ON "CabmanCarStatuses" ("CabmanCarId", "Time");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251109184234_add_cabman_index', '8.0.6');

COMMIT;

