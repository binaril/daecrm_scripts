START TRANSACTION;
ALTER TABLE "UserCompanyGrants" DROP CONSTRAINT "FK_UserCompanyGrants_CompanyGrants_CompanyGrantId";

DROP INDEX "IX_UserCompanyGrants_CompanyGrantId";

ALTER TABLE "UserCompanyGrants" DROP COLUMN "CompanyGrantId";

ALTER TABLE "UserCompanyGrants" RENAME COLUMN "CompanyId" TO "AllowCompanyId";

ALTER TABLE "Users" ADD "LogDbEntryId" bigint;

ALTER TABLE "UserCompanyGrants" ADD "LogDbEntryId" bigint;

CREATE INDEX "IX_Users_LogDbEntryId" ON "Users" ("LogDbEntryId");

CREATE INDEX "IX_UserCompanyGrants_LogDbEntryId" ON "UserCompanyGrants" ("LogDbEntryId");

ALTER TABLE "UserCompanyGrants" ADD CONSTRAINT "FK_UserCompanyGrants_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id");

ALTER TABLE "Users" ADD CONSTRAINT "FK_Users_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260506182503_change_company_grants', '10.0.1');

COMMIT;

