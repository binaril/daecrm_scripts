START TRANSACTION;
ALTER TABLE "Companies" ADD "LogoPath" text NOT NULL DEFAULT '';

INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (138, '', 'Company settings / read', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (139, '', 'Company settings / write', 0);

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260606083619_AddCompanyLogoPath', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "Users" ADD "VisaAdminFeeMonthly" numeric(10,2) NOT NULL DEFAULT 0.0;

ALTER TABLE "Users" ADD "VisaAdminFeeTotal" numeric(10,2) NOT NULL DEFAULT 0.0;

ALTER TABLE "SalaryDocuments" ADD "MotivationRuleId" bigint;

ALTER TABLE "Companies" ADD "VisaAdminFeeDayOfMonth" integer NOT NULL DEFAULT 1;

ALTER TABLE "Cars" ADD "MobileAllowance" numeric;

ALTER TABLE "Cars" ADD "WashAllowance" numeric;

INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (140, '', 'Driver / add company bonus', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (141, '', 'Driver / manage visa admin fee', 0);

INSERT INTO "TransactionTypes" ("Id", "Description", "IsAggrTransaction", "IsDebtPayment", "IsFine", "Name", "ShortName")
VALUES (48, '', FALSE, FALSE, FALSE, 'Company bonus', NULL);
INSERT INTO "TransactionTypes" ("Id", "Description", "IsAggrTransaction", "IsDebtPayment", "IsFine", "Name", "ShortName")
VALUES (49, '', FALSE, FALSE, FALSE, 'Admin fee', NULL);

CREATE INDEX "IX_SalaryDocuments_MotivationRuleId" ON "SalaryDocuments" ("MotivationRuleId");

ALTER TABLE "SalaryDocuments" ADD CONSTRAINT "FK_SalaryDocuments_MotivationRules_MotivationRuleId" FOREIGN KEY ("MotivationRuleId") REFERENCES "MotivationRules" ("Id");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260606210536_AddSalaryPayslipsFields', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "Companies" DROP COLUMN "LogoPath";

ALTER TABLE "Companies" ADD "LogoFileId" uuid;

CREATE UNIQUE INDEX "IX_Companies_LogoFileId" ON "Companies" ("LogoFileId");

ALTER TABLE "Companies" ADD CONSTRAINT "FK_Companies_UploadedFiles_LogoFileId" FOREIGN KEY ("LogoFileId") REFERENCES "UploadedFiles" ("Id");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260607094439_ReplaceCompanyLogoPathWithFileId', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "SalaryDocuments" ADD "AdminFees" numeric NOT NULL DEFAULT 0.0;

ALTER TABLE "SalaryDocuments" ADD "AdvancesLoans" numeric NOT NULL DEFAULT 0.0;

ALTER TABLE "SalaryDocuments" ADD "Bonus" numeric NOT NULL DEFAULT 0.0;

ALTER TABLE "SalaryDocuments" ADD "CashIncome" numeric NOT NULL DEFAULT 0.0;

ALTER TABLE "SalaryDocuments" ADD "CompanyBonus" numeric NOT NULL DEFAULT 0.0;

ALTER TABLE "SalaryDocuments" ADD "DamageCharges" numeric NOT NULL DEFAULT 0.0;

ALTER TABLE "SalaryDocuments" ADD "OfficeFines" numeric NOT NULL DEFAULT 0.0;

ALTER TABLE "SalaryDocuments" ADD "Petrol" numeric NOT NULL DEFAULT 0.0;

ALTER TABLE "SalaryDocuments" ADD "Salik" numeric NOT NULL DEFAULT 0.0;

ALTER TABLE "SalaryDocuments" ADD "TrafficFines" numeric NOT NULL DEFAULT 0.0;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260607134955_AddSalaryDocumentDetailFields', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "SalaryDocuments" ADD "ElectricCharge" numeric NOT NULL DEFAULT 0.0;

ALTER TABLE "SalaryDocuments" ADD "Pos" numeric NOT NULL DEFAULT 0.0;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260607201027_AddElectricChargeAndPosToSalaryDocument', '10.0.1');

COMMIT;

