START TRANSACTION;
DROP INDEX "IX_AutoWithdrawalSettings_CompanyId";

ALTER TABLE "AutoWithdrawalSettings" ADD "WithdrawalCashboxId" bigint;

CREATE UNIQUE INDEX "IX_AutoWithdrawalSettings_CompanyId_CashBoxId" ON "AutoWithdrawalSettings" ("CompanyId", "CashBoxId") WHERE "Deleted" = false;

CREATE INDEX "IX_AutoWithdrawalSettings_WithdrawalCashboxId" ON "AutoWithdrawalSettings" ("WithdrawalCashboxId");

ALTER TABLE "AutoWithdrawalSettings" ADD CONSTRAINT "FK_AutoWithdrawalSettings_CashBoxes_WithdrawalCashboxId" FOREIGN KEY ("WithdrawalCashboxId") REFERENCES "CashBoxes" ("Id") ON DELETE RESTRICT;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260616143552_AddAutoWithdrawalTarget', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "Transactions" ADD "Origin" integer NOT NULL DEFAULT 0;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260616144231_AddTransactionOrigin', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "AutoWithdrawalSettings" ADD "AmountSource" integer NOT NULL DEFAULT 0;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260616205708_AddAutoWithdrawalAmountSource', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "AutoWithdrawalSettings" RENAME COLUMN "StartHourUtc" TO "StartHour";

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260616210225_RenameAutoWithdrawalStartHour', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "Transactions" ADD "DriverBinding" integer NOT NULL DEFAULT 0;

ALTER TABLE "Transactions" ADD "DriverReviewReason" text;

ALTER TABLE "Transactions" ADD "NeedsDriverReview" boolean NOT NULL DEFAULT FALSE;

ALTER TABLE "SalaryDocuments" ADD "NeedsRecalculation" boolean NOT NULL DEFAULT FALSE;

ALTER TABLE "SalaryDocuments" ADD "RecalculationFlaggedAt" timestamp with time zone;

ALTER TABLE "SalaryDocuments" ADD "RecalculationReason" text;

CREATE INDEX "IX_Transactions_NeedsDriverReview" ON "Transactions" ("NeedsDriverReview");

CREATE INDEX "IX_SalaryDocuments_NeedsRecalculation" ON "SalaryDocuments" ("NeedsRecalculation");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260617113627_AddTransactionDriverBindingAndRecalcFlags', '10.0.1');

COMMIT;

START TRANSACTION;
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (157, '', 'Purposes / read', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (158, '', 'Purposes / create', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (159, '', 'Purposes / update', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (160, '', 'Purposes / delete', 0);

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260617210100_AddPurposeAccessCodes', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "SalaryDocumentLineItems" ADD "RawAmount" numeric NOT NULL DEFAULT 0.0;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260617220114_AddRawAmountToSalaryDocumentLineItem', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "Transactions" ADD "AggregatorOrderId" text;

CREATE INDEX "IX_Transactions_Company_Aggregator_AggregatorOrderId" ON "Transactions" ("CompanyId", "AggregatorId", "AggregatorOrderId");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260619135912_AddTransactionAggregatorOrderId', '10.0.1');

COMMIT;

