START TRANSACTION;

ALTER TABLE "Reports" ADD "UserId" bigint;

INSERT INTO "ReportReceiversTypes" ("Id", "Name")
VALUES (4, 'Single user');

CREATE INDEX "IX_Reports_UserId" ON "Reports" ("UserId");

ALTER TABLE "Reports" ADD CONSTRAINT "FK_Reports_Users_UserId" FOREIGN KEY ("UserId") REFERENCES "Users" ("Id");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251019171829_add_totalcars_report_job', '8.0.6');

COMMIT;

START TRANSACTION;

INSERT INTO "ReportTypes" ("Id", "Name")
VALUES (2, 'Total cars report');

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251019175651_add_total_cars_report_record', '8.0.6');

COMMIT;

