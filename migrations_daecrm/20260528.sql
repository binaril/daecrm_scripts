START TRANSACTION;
DELETE FROM "__EFMigrationsHistory"
WHERE "MigrationId" = '20260523213305_SnapshotResync';

COMMIT;

START TRANSACTION;
-----------------ALTER TABLE "CashBoxes" DROP CONSTRAINT "FK_CashBoxes_LogDbEntries_LogDbEntryId";

ALTER TABLE "Counterparties" DROP CONSTRAINT "FK_Counterparties_LogDbEntries_LogDbEntryId";

ALTER TABLE "MotivationExpenses" DROP CONSTRAINT "FK_MotivationExpenses_LogDbEntries_LogDbEntryId";

ALTER TABLE "MotivationPercentages" DROP CONSTRAINT "FK_MotivationPercentages_LogDbEntries_LogDbEntryId";

ALTER TABLE "MotivationPercentCarModels" DROP CONSTRAINT "FK_MotivationPercentCarModels_LogDbEntries_LogDbEntryId";

ALTER TABLE "MotivationPercentGroups" DROP CONSTRAINT "FK_MotivationPercentGroups_LogDbEntries_LogDbEntryId";

ALTER TABLE "MotivationRules" DROP CONSTRAINT "FK_MotivationRules_LogDbEntries_LogDbEntryId";

ALTER TABLE "OfficeOrders" DROP CONSTRAINT "FK_OfficeOrders_LogDbEntries_LogDbEntryId";

ALTER TABLE "OfficePlaces" DROP CONSTRAINT "FK_OfficePlaces_LogDbEntries_LogDbEntryId";

ALTER TABLE "PosTerminals" DROP CONSTRAINT "FK_PosTerminals_LogDbEntries_LogDbEntryId";

ALTER TABLE "Purposes" DROP CONSTRAINT "FK_Purposes_LogDbEntries_LogDbEntryId";

ALTER TABLE "RepairOperations" DROP CONSTRAINT "FK_RepairOperations_LogDbEntries_LogDbEntryId";

ALTER TABLE "RepairOrders" DROP CONSTRAINT "FK_RepairOrders_LogDbEntries_LogDbEntryId";

DROP INDEX "IX_RepairOrders_LogDbEntryId";

DROP INDEX "IX_RepairOperations_LogDbEntryId";

DROP INDEX "IX_Purposes_LogDbEntryId";

DROP INDEX "IX_PosTerminals_LogDbEntryId";

DROP INDEX "IX_OfficePlaces_LogDbEntryId";

DROP INDEX "IX_OfficeOrders_LogDbEntryId";

DROP INDEX "IX_MotivationRules_LogDbEntryId";

DROP INDEX "IX_MotivationPercentGroups_LogDbEntryId";

DROP INDEX "IX_MotivationPercentCarModels_LogDbEntryId";

DROP INDEX "IX_MotivationPercentages_LogDbEntryId";

DROP INDEX "IX_MotivationExpenses_LogDbEntryId";

DROP INDEX "IX_Counterparties_LogDbEntryId";

DROP INDEX "IX_CashBoxes_LogDbEntryId";

ALTER TABLE "RepairOrders" DROP COLUMN "LogDbEntryId";

ALTER TABLE "RepairOperations" DROP COLUMN "LogDbEntryId";

ALTER TABLE "Purposes" DROP COLUMN "LogDbEntryId";

ALTER TABLE "PosTerminals" DROP COLUMN "LogDbEntryId";

ALTER TABLE "OfficePlaces" DROP COLUMN "LogDbEntryId";

ALTER TABLE "OfficeOrders" DROP COLUMN "LogDbEntryId";

ALTER TABLE "MotivationRules" DROP COLUMN "LogDbEntryId";

ALTER TABLE "MotivationPercentGroups" DROP COLUMN "LogDbEntryId";

ALTER TABLE "MotivationPercentCarModels" DROP COLUMN "LogDbEntryId";

ALTER TABLE "MotivationPercentages" DROP COLUMN "LogDbEntryId";

ALTER TABLE "MotivationExpenses" DROP COLUMN "LogDbEntryId";

ALTER TABLE "Counterparties" DROP COLUMN "LogDbEntryId";

ALTER TABLE "CashBoxes" DROP COLUMN "LogDbEntryId";

DELETE FROM "__EFMigrationsHistory"
WHERE "MigrationId" = '20260523170419_add_AuditEntities';

COMMIT;

START TRANSACTION;
DELETE FROM "__EFMigrationsHistory"
WHERE "MigrationId" = '20260523145122_AddDepositCustomerConcurrency';

COMMIT;

START TRANSACTION;
DELETE FROM "__EFMigrationsHistory"
WHERE "MigrationId" = '20260523135856_AddRentalConcurrency';

COMMIT;

START TRANSACTION;
DELETE FROM "AuthAccesses"
WHERE "Id" = 107;

DELETE FROM "AuthAccesses"
WHERE "Id" = 108;

DELETE FROM "__EFMigrationsHistory"
WHERE "MigrationId" = '20260522201629_AddFleetAutomationConfig';

COMMIT;

START TRANSACTION;
DELETE FROM "AuthAccesses"
WHERE "Id" = 110;

DELETE FROM "AuthAccesses"
WHERE "Id" = 111;

DELETE FROM "AuthAccesses"
WHERE "Id" = 112;

DELETE FROM "AuthAccesses"
WHERE "Id" = 113;

DELETE FROM "AuthAccesses"
WHERE "Id" = 114;

DELETE FROM "AuthAccesses"
WHERE "Id" = 115;

DELETE FROM "AuthAccesses"
WHERE "Id" = 116;

DELETE FROM "AuthAccesses"
WHERE "Id" = 117;

DELETE FROM "AuthAccesses"
WHERE "Id" = 118;

DELETE FROM "AuthAccesses"
WHERE "Id" = 119;

DELETE FROM "AuthAccesses"
WHERE "Id" = 120;

DELETE FROM "AuthAccesses"
WHERE "Id" = 121;

DELETE FROM "AuthAccesses"
WHERE "Id" = 122;

DELETE FROM "AuthAccesses"
WHERE "Id" = 123;

DELETE FROM "AuthAccesses"
WHERE "Id" = 124;

DELETE FROM "AuthAccesses"
WHERE "Id" = 125;

DELETE FROM "AuthAccesses"
WHERE "Id" = 126;

DELETE FROM "AuthAccesses"
WHERE "Id" = 127;

DELETE FROM "UserRoles"
WHERE "Id" = 10;

DELETE FROM "UserRoles"
WHERE "Id" = 11;

DELETE FROM "UserRoles"
WHERE "Id" = 12;

DELETE FROM "UserRoles"
WHERE "Id" = 13;

DELETE FROM "__EFMigrationsHistory"
WHERE "MigrationId" = '20260521211925_AddRentokarRBAC';

COMMIT;

START TRANSACTION;
ALTER TABLE "Transactions" DROP CONSTRAINT "FK_Transactions_Customers_CustomerId";

ALTER TABLE "Transactions" DROP CONSTRAINT "FK_Transactions_Rentals_RentalId";

DROP TABLE "CarDocuments";

DROP TABLE "CarPricingRows";

DROP TABLE "DamageUploadedFiles";

DROP TABLE "Deposits";

DROP TABLE "EmergencyContacts";

DROP TABLE "Fines";

DROP TABLE "Damages";

DROP TABLE "Rentals";

DROP TABLE "Customers";

DROP INDEX "IX_Transactions_CustomerId";

DROP INDEX "IX_Transactions_RentalId";

DROP INDEX "IX_Cars_CompanyId_CarSegment";

DELETE FROM "TransactionTypes"
WHERE "Id" = 44;

DELETE FROM "TransactionTypes"
WHERE "Id" = 45;

DELETE FROM "TransactionTypes"
WHERE "Id" = 46;

ALTER TABLE "Transactions" DROP COLUMN "CustomerId";

ALTER TABLE "Transactions" DROP COLUMN "RentalId";

ALTER TABLE "Companies" DROP COLUMN "DepositHoldDays";

ALTER TABLE "Companies" DROP COLUMN "Mode";

ALTER TABLE "Companies" DROP COLUMN "SeasonEnd";

ALTER TABLE "Companies" DROP COLUMN "SeasonStart";

ALTER TABLE "Cars" DROP COLUMN "CarSegment";

CREATE INDEX "IX_Cars_CompanyId" ON "Cars" ("CompanyId");

DELETE FROM "__EFMigrationsHistory"
WHERE "MigrationId" = '20260521205425_AddRentokarV1';

COMMIT;








START TRANSACTION;
DROP INDEX "IX_Cars_CompanyId";

ALTER TABLE "Transactions" ADD "CustomerId" bigint;

ALTER TABLE "Transactions" ADD "RentalId" bigint;

ALTER TABLE "Companies" ADD "DepositHoldDays" integer NOT NULL DEFAULT 21;

ALTER TABLE "Companies" ADD "Mode" integer NOT NULL DEFAULT 1;

ALTER TABLE "Companies" ADD "SeasonEnd" date;

ALTER TABLE "Companies" ADD "SeasonStart" date;

ALTER TABLE "Cars" ADD "CarSegment" integer NOT NULL DEFAULT 1;

CREATE TABLE "CarDocuments" (
    "Id" bigint GENERATED BY DEFAULT AS IDENTITY,
    "CarId" bigint NOT NULL,
    "CompanyId" bigint NOT NULL,
    "DocumentType" integer NOT NULL,
    "UploadedFileId" uuid NOT NULL,
    "ExpiryDate" date NOT NULL,
    "Deleted" boolean NOT NULL,
    "CreatedTime" timestamp with time zone NOT NULL,
    "ModifiedTime" timestamp with time zone NOT NULL,
    "CreatedById" bigint NOT NULL,
    "ModifiedById" bigint NOT NULL,
    "LogDbEntryId" bigint,
    CONSTRAINT "PK_CarDocuments" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_CarDocuments_Cars_CarId" FOREIGN KEY ("CarId") REFERENCES "Cars" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_CarDocuments_Companies_CompanyId" FOREIGN KEY ("CompanyId") REFERENCES "Companies" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_CarDocuments_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id"),
    CONSTRAINT "FK_CarDocuments_UploadedFiles_UploadedFileId" FOREIGN KEY ("UploadedFileId") REFERENCES "UploadedFiles" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_CarDocuments_Users_CreatedById" FOREIGN KEY ("CreatedById") REFERENCES "Users" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_CarDocuments_Users_ModifiedById" FOREIGN KEY ("ModifiedById") REFERENCES "Users" ("Id") ON DELETE RESTRICT
);

CREATE TABLE "CarPricingRows" (
    "Id" bigint GENERATED BY DEFAULT AS IDENTITY,
    "CarId" bigint NOT NULL,
    "TierCode" integer NOT NULL,
    "SeasonPrice" numeric(10,2) NOT NULL,
    "OffSeasonPrice" numeric(10,2) NOT NULL,
    "CreatedTime" timestamp with time zone NOT NULL,
    "ModifiedTime" timestamp with time zone NOT NULL,
    "LogDbEntryId" bigint,
    CONSTRAINT "PK_CarPricingRows" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_CarPricingRows_Cars_CarId" FOREIGN KEY ("CarId") REFERENCES "Cars" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_CarPricingRows_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id")
);

CREATE TABLE "Customers" (
    "Id" bigint GENERATED BY DEFAULT AS IDENTITY,
    "CompanyId" bigint NOT NULL,
    "Name" text NOT NULL,
    "CustomerType" integer NOT NULL,
    "Phone" text NOT NULL,
    "Passport" text,
    "PassportExpiry" date,
    "EmiratesId" text,
    "EmiratesIdExpiry" date,
    "DrivingLicense" text,
    "LicenseExpiry" date,
    "Status" integer NOT NULL,
    "BlacklistReason" text,
    "Comment" text,
    "OutstandingDebt" numeric(10,2) NOT NULL,
    "Deleted" boolean NOT NULL,
    "CreatedTime" timestamp with time zone NOT NULL,
    "ModifiedTime" timestamp with time zone NOT NULL,
    "CreatedById" bigint NOT NULL,
    "ModifiedById" bigint NOT NULL,
    "LogDbEntryId" bigint,
    CONSTRAINT "PK_Customers" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_Customers_Companies_CompanyId" FOREIGN KEY ("CompanyId") REFERENCES "Companies" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Customers_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id"),
    CONSTRAINT "FK_Customers_Users_CreatedById" FOREIGN KEY ("CreatedById") REFERENCES "Users" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Customers_Users_ModifiedById" FOREIGN KEY ("ModifiedById") REFERENCES "Users" ("Id") ON DELETE RESTRICT
);

CREATE TABLE "EmergencyContacts" (
    "Id" bigint GENERATED BY DEFAULT AS IDENTITY,
    "CustomerId" bigint NOT NULL,
    "Name" text NOT NULL,
    "Phone" text NOT NULL,
    "CreatedTime" timestamp with time zone NOT NULL,
    "ModifiedTime" timestamp with time zone NOT NULL,
    "LogDbEntryId" bigint,
    CONSTRAINT "PK_EmergencyContacts" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_EmergencyContacts_Customers_CustomerId" FOREIGN KEY ("CustomerId") REFERENCES "Customers" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_EmergencyContacts_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id")
);

CREATE TABLE "Rentals" (
    "Id" bigint GENERATED BY DEFAULT AS IDENTITY,
    "CompanyId" bigint NOT NULL,
    "CarId" bigint NOT NULL,
    "PrimaryCustomerId" bigint NOT NULL,
    "SecondDriverId" bigint,
    "StartDate" date NOT NULL,
    "EndDate" date NOT NULL,
    "DisplayName" text NOT NULL,
    "RentalPrice" numeric(10,2) NOT NULL,
    "EstimatedPrice" numeric(10,2) NOT NULL,
    "IsPriceManuallyOverridden" boolean NOT NULL,
    "RefundedAmount" numeric(10,2) NOT NULL,
    "DepositAmount" numeric(10,2) NOT NULL,
    "PaymentMethod" integer NOT NULL,
    "DeliveryFee" numeric(10,2) NOT NULL,
    "OdometerStart" integer NOT NULL,
    "OdometerEnd" integer,
    "Status" integer NOT NULL,
    "ContractStatus" integer NOT NULL,
    "IsEarlyReturn" boolean NOT NULL,
    "LastComment" text,
    "LastCommentAt" timestamp with time zone,
    "LastCommentById" bigint,
    "Deleted" boolean NOT NULL,
    "CreatedTime" timestamp with time zone NOT NULL,
    "ModifiedTime" timestamp with time zone NOT NULL,
    "CreatedById" bigint NOT NULL,
    "ModifiedById" bigint NOT NULL,
    "LogDbEntryId" bigint,
    CONSTRAINT "PK_Rentals" PRIMARY KEY ("Id"),
    CONSTRAINT "CK_Rentals_SecondDriver_NotSame" CHECK ("SecondDriverId" IS NULL OR "SecondDriverId" <> "PrimaryCustomerId"),
    CONSTRAINT "FK_Rentals_Cars_CarId" FOREIGN KEY ("CarId") REFERENCES "Cars" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Rentals_Companies_CompanyId" FOREIGN KEY ("CompanyId") REFERENCES "Companies" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Rentals_Customers_PrimaryCustomerId" FOREIGN KEY ("PrimaryCustomerId") REFERENCES "Customers" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Rentals_Customers_SecondDriverId" FOREIGN KEY ("SecondDriverId") REFERENCES "Customers" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Rentals_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id"),
    CONSTRAINT "FK_Rentals_Users_CreatedById" FOREIGN KEY ("CreatedById") REFERENCES "Users" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Rentals_Users_LastCommentById" FOREIGN KEY ("LastCommentById") REFERENCES "Users" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Rentals_Users_ModifiedById" FOREIGN KEY ("ModifiedById") REFERENCES "Users" ("Id") ON DELETE RESTRICT
);

CREATE TABLE "Damages" (
    "Id" bigint GENERATED BY DEFAULT AS IDENTITY,
    "RentalId" bigint NOT NULL,
    "CustomerId" bigint NOT NULL,
    "CarId" bigint NOT NULL,
    "CompanyId" bigint NOT NULL,
    "Amount" numeric(10,2) NOT NULL,
    "Description" text NOT NULL,
    "Status" integer NOT NULL,
    "DeductedFromDeposit" numeric(10,2) NOT NULL,
    "RemainingDebt" numeric(10,2) NOT NULL,
    "TransactionId" bigint,
    "Deleted" boolean NOT NULL,
    "CreatedTime" timestamp with time zone NOT NULL,
    "ModifiedTime" timestamp with time zone NOT NULL,
    "CreatedById" bigint NOT NULL,
    "ModifiedById" bigint NOT NULL,
    "LogDbEntryId" bigint,
    CONSTRAINT "PK_Damages" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_Damages_Cars_CarId" FOREIGN KEY ("CarId") REFERENCES "Cars" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Damages_Companies_CompanyId" FOREIGN KEY ("CompanyId") REFERENCES "Companies" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Damages_Customers_CustomerId" FOREIGN KEY ("CustomerId") REFERENCES "Customers" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Damages_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id"),
    CONSTRAINT "FK_Damages_Rentals_RentalId" FOREIGN KEY ("RentalId") REFERENCES "Rentals" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Damages_Transactions_TransactionId" FOREIGN KEY ("TransactionId") REFERENCES "Transactions" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Damages_Users_CreatedById" FOREIGN KEY ("CreatedById") REFERENCES "Users" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Damages_Users_ModifiedById" FOREIGN KEY ("ModifiedById") REFERENCES "Users" ("Id") ON DELETE RESTRICT
);

CREATE TABLE "Deposits" (
    "Id" bigint GENERATED BY DEFAULT AS IDENTITY,
    "RentalId" bigint NOT NULL,
    "CompanyId" bigint NOT NULL,
    "Amount" numeric(10,2) NOT NULL,
    "Status" integer NOT NULL,
    "ReturnedAmount" numeric(10,2),
    "ReturnMethod" integer,
    "ReturnComment" text,
    "ReturnedAt" timestamp with time zone,
    "ReturnedById" bigint,
    "ReturnCashboxTransactionId" bigint,
    "Deleted" boolean NOT NULL,
    "CreatedTime" timestamp with time zone NOT NULL,
    "ModifiedTime" timestamp with time zone NOT NULL,
    "CreatedById" bigint NOT NULL,
    "ModifiedById" bigint NOT NULL,
    "LogDbEntryId" bigint,
    CONSTRAINT "PK_Deposits" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_Deposits_Companies_CompanyId" FOREIGN KEY ("CompanyId") REFERENCES "Companies" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Deposits_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id"),
    CONSTRAINT "FK_Deposits_Rentals_RentalId" FOREIGN KEY ("RentalId") REFERENCES "Rentals" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Deposits_Transactions_ReturnCashboxTransactionId" FOREIGN KEY ("ReturnCashboxTransactionId") REFERENCES "Transactions" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Deposits_Users_CreatedById" FOREIGN KEY ("CreatedById") REFERENCES "Users" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Deposits_Users_ModifiedById" FOREIGN KEY ("ModifiedById") REFERENCES "Users" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Deposits_Users_ReturnedById" FOREIGN KEY ("ReturnedById") REFERENCES "Users" ("Id") ON DELETE RESTRICT
);

CREATE TABLE "Fines" (
    "Id" bigint GENERATED BY DEFAULT AS IDENTITY,
    "RentalId" bigint NOT NULL,
    "CustomerId" bigint NOT NULL,
    "CarId" bigint NOT NULL,
    "CompanyId" bigint NOT NULL,
    "Amount" numeric(10,2) NOT NULL,
    "FineDate" date NOT NULL,
    "Description" text NOT NULL,
    "PaymentStatus" integer NOT NULL,
    "DeductedFromDeposit" numeric(10,2) NOT NULL,
    "RemainingDebt" numeric(10,2) NOT NULL,
    "TransactionId" bigint,
    "Deleted" boolean NOT NULL,
    "CreatedTime" timestamp with time zone NOT NULL,
    "ModifiedTime" timestamp with time zone NOT NULL,
    "CreatedById" bigint NOT NULL,
    "ModifiedById" bigint NOT NULL,
    "LogDbEntryId" bigint,
    CONSTRAINT "PK_Fines" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_Fines_Cars_CarId" FOREIGN KEY ("CarId") REFERENCES "Cars" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Fines_Companies_CompanyId" FOREIGN KEY ("CompanyId") REFERENCES "Companies" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Fines_Customers_CustomerId" FOREIGN KEY ("CustomerId") REFERENCES "Customers" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Fines_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id"),
    CONSTRAINT "FK_Fines_Rentals_RentalId" FOREIGN KEY ("RentalId") REFERENCES "Rentals" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Fines_Transactions_TransactionId" FOREIGN KEY ("TransactionId") REFERENCES "Transactions" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Fines_Users_CreatedById" FOREIGN KEY ("CreatedById") REFERENCES "Users" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Fines_Users_ModifiedById" FOREIGN KEY ("ModifiedById") REFERENCES "Users" ("Id") ON DELETE RESTRICT
);

CREATE TABLE "DamageUploadedFiles" (
    "Id" bigint GENERATED BY DEFAULT AS IDENTITY,
    "DamageId" bigint NOT NULL,
    "UploadedFileId" uuid NOT NULL,
    "CreatedTime" timestamp with time zone NOT NULL,
    "ModifiedTime" timestamp with time zone NOT NULL,
    "LogDbEntryId" bigint,
    CONSTRAINT "PK_DamageUploadedFiles" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_DamageUploadedFiles_Damages_DamageId" FOREIGN KEY ("DamageId") REFERENCES "Damages" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_DamageUploadedFiles_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id"),
    CONSTRAINT "FK_DamageUploadedFiles_UploadedFiles_UploadedFileId" FOREIGN KEY ("UploadedFileId") REFERENCES "UploadedFiles" ("Id") ON DELETE RESTRICT
);

INSERT INTO "TransactionTypes" ("Id", "Description", "IsAggrTransaction", "IsDebtPayment", "IsFine", "Name", "ShortName")
VALUES (44, 'Rent-a-Car service: car wash', FALSE, FALSE, FALSE, 'Car wash', NULL);
INSERT INTO "TransactionTypes" ("Id", "Description", "IsAggrTransaction", "IsDebtPayment", "IsFine", "Name", "ShortName")
VALUES (45, 'Rent-a-Car service: car delivery', FALSE, FALSE, FALSE, 'Rental delivery fee', NULL);
INSERT INTO "TransactionTypes" ("Id", "Description", "IsAggrTransaction", "IsDebtPayment", "IsFine", "Name", "ShortName")
VALUES (46, 'Rent-a-Car: contract payment', FALSE, FALSE, FALSE, 'Rental payment', NULL);

CREATE INDEX "IX_Transactions_CustomerId" ON "Transactions" ("CustomerId");

CREATE INDEX "IX_Transactions_RentalId" ON "Transactions" ("RentalId");

CREATE INDEX "IX_Cars_CompanyId_CarSegment" ON "Cars" ("CompanyId", "CarSegment");

CREATE INDEX "IX_CarDocuments_CarId" ON "CarDocuments" ("CarId");

CREATE INDEX "IX_CarDocuments_CompanyId" ON "CarDocuments" ("CompanyId");

CREATE INDEX "IX_CarDocuments_CreatedById" ON "CarDocuments" ("CreatedById");

CREATE INDEX "IX_CarDocuments_ExpiryDate" ON "CarDocuments" ("ExpiryDate");

CREATE INDEX "IX_CarDocuments_LogDbEntryId" ON "CarDocuments" ("LogDbEntryId");

CREATE INDEX "IX_CarDocuments_ModifiedById" ON "CarDocuments" ("ModifiedById");

CREATE INDEX "IX_CarDocuments_UploadedFileId" ON "CarDocuments" ("UploadedFileId");

CREATE INDEX "IX_CarPricingRows_LogDbEntryId" ON "CarPricingRows" ("LogDbEntryId");

CREATE UNIQUE INDEX "UQ_CarPricingRows" ON "CarPricingRows" ("CarId", "TierCode");

CREATE INDEX "IX_Customers_CompanyId" ON "Customers" ("CompanyId");

CREATE INDEX "IX_Customers_CreatedById" ON "Customers" ("CreatedById");

CREATE INDEX "IX_Customers_LogDbEntryId" ON "Customers" ("LogDbEntryId");

CREATE INDEX "IX_Customers_ModifiedById" ON "Customers" ("ModifiedById");

CREATE INDEX "IX_Customers_Phone" ON "Customers" ("Phone");

CREATE UNIQUE INDEX "UQ_Customers_Company_Passport" ON "Customers" ("CompanyId", "Passport") WHERE "Deleted" = false AND "Passport" IS NOT NULL;

CREATE UNIQUE INDEX "UQ_Customers_Company_EmiratesId" ON "Customers" ("CompanyId", "EmiratesId") WHERE "Deleted" = false AND "EmiratesId" IS NOT NULL;

CREATE INDEX "IX_Damages_CarId" ON "Damages" ("CarId");

CREATE INDEX "IX_Damages_CompanyId" ON "Damages" ("CompanyId");

CREATE INDEX "IX_Damages_CreatedById" ON "Damages" ("CreatedById");

CREATE INDEX "IX_Damages_CustomerId" ON "Damages" ("CustomerId");

CREATE INDEX "IX_Damages_LogDbEntryId" ON "Damages" ("LogDbEntryId");

CREATE INDEX "IX_Damages_ModifiedById" ON "Damages" ("ModifiedById");

CREATE INDEX "IX_Damages_RentalId" ON "Damages" ("RentalId");

CREATE INDEX "IX_Damages_TransactionId" ON "Damages" ("TransactionId");

CREATE INDEX "IX_DamageUploadedFiles_DamageId" ON "DamageUploadedFiles" ("DamageId");

CREATE INDEX "IX_DamageUploadedFiles_LogDbEntryId" ON "DamageUploadedFiles" ("LogDbEntryId");

CREATE INDEX "IX_DamageUploadedFiles_UploadedFileId" ON "DamageUploadedFiles" ("UploadedFileId");

CREATE INDEX "IX_Deposits_CompanyId_Status" ON "Deposits" ("CompanyId", "Status");

CREATE INDEX "IX_Deposits_CreatedById" ON "Deposits" ("CreatedById");

CREATE INDEX "IX_Deposits_LogDbEntryId" ON "Deposits" ("LogDbEntryId");

CREATE INDEX "IX_Deposits_ModifiedById" ON "Deposits" ("ModifiedById");

CREATE UNIQUE INDEX "IX_Deposits_RentalId" ON "Deposits" ("RentalId");

CREATE INDEX "IX_Deposits_ReturnCashboxTransactionId" ON "Deposits" ("ReturnCashboxTransactionId");

CREATE INDEX "IX_Deposits_ReturnedById" ON "Deposits" ("ReturnedById");

CREATE INDEX "IX_EmergencyContacts_CustomerId" ON "EmergencyContacts" ("CustomerId");

CREATE INDEX "IX_EmergencyContacts_LogDbEntryId" ON "EmergencyContacts" ("LogDbEntryId");

CREATE INDEX "IX_Fines_CarId" ON "Fines" ("CarId");

CREATE INDEX "IX_Fines_CompanyId" ON "Fines" ("CompanyId");

CREATE INDEX "IX_Fines_CreatedById" ON "Fines" ("CreatedById");

CREATE INDEX "IX_Fines_CustomerId" ON "Fines" ("CustomerId");

CREATE INDEX "IX_Fines_LogDbEntryId" ON "Fines" ("LogDbEntryId");

CREATE INDEX "IX_Fines_ModifiedById" ON "Fines" ("ModifiedById");

CREATE INDEX "IX_Fines_RentalId" ON "Fines" ("RentalId");

CREATE INDEX "IX_Fines_TransactionId" ON "Fines" ("TransactionId");

CREATE INDEX "IX_Rentals_CarId_Status_StartDate_EndDate" ON "Rentals" ("CarId", "Status", "StartDate", "EndDate");

CREATE INDEX "IX_Rentals_CompanyId" ON "Rentals" ("CompanyId");

CREATE INDEX "IX_Rentals_CreatedById" ON "Rentals" ("CreatedById");

CREATE INDEX "IX_Rentals_LastCommentById" ON "Rentals" ("LastCommentById");

CREATE INDEX "IX_Rentals_LogDbEntryId" ON "Rentals" ("LogDbEntryId");

CREATE INDEX "IX_Rentals_ModifiedById" ON "Rentals" ("ModifiedById");

CREATE INDEX "IX_Rentals_PrimaryCustomerId" ON "Rentals" ("PrimaryCustomerId");

CREATE INDEX "IX_Rentals_SecondDriverId" ON "Rentals" ("SecondDriverId");

CREATE INDEX "IX_Rentals_Status_EndDate" ON "Rentals" ("Status", "EndDate");

ALTER TABLE "Transactions" ADD CONSTRAINT "FK_Transactions_Customers_CustomerId" FOREIGN KEY ("CustomerId") REFERENCES "Customers" ("Id") ON DELETE RESTRICT;

ALTER TABLE "Transactions" ADD CONSTRAINT "FK_Transactions_Rentals_RentalId" FOREIGN KEY ("RentalId") REFERENCES "Rentals" ("Id") ON DELETE RESTRICT;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260521205425_AddRentokarV1', '10.0.1');

COMMIT;

START TRANSACTION;
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (110, '', 'Rent-a-Car customers / read', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (111, '', 'Rent-a-Car customers / add', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (112, '', 'Rent-a-Car customers / change', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (113, '', 'Rent-a-Car customers / delete', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (114, '', 'Rent-a-Car customers / manage blacklist', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (115, '', 'Rent-a-Car rentals / read', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (116, '', 'Rent-a-Car rentals / add', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (117, '', 'Rent-a-Car rentals / change (extend, early-return, close, sign, comment, override)', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (118, '', 'Rent-a-Car rentals / delete', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (119, '', 'Rent-a-Car deposits / read', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (120, '', 'Rent-a-Car deposits / return', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (121, '', 'Rent-a-Car fines / read', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (122, '', 'Rent-a-Car fines / add', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (123, '', 'Rent-a-Car damages / read', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (124, '', 'Rent-a-Car damages / add (incl. inspection photo upload)', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (125, '', 'Rent-a-Car pricing grid / change', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (126, '', 'Rent-a-Car seasons / change', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (127, '', 'Rent-a-Car service transactions / add (wash, fuel)', 0);

INSERT INTO "UserRoles" ("Id", "IsPorlalRole", "Name")
VALUES (10, TRUE, 'Rental manager');
INSERT INTO "UserRoles" ("Id", "IsPorlalRole", "Name")
VALUES (11, TRUE, 'Rental admin');
INSERT INTO "UserRoles" ("Id", "IsPorlalRole", "Name")
VALUES (12, TRUE, 'Rental accountant');
INSERT INTO "UserRoles" ("Id", "IsPorlalRole", "Name")
VALUES (13, TRUE, 'Rental technician');

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260521211925_AddRentokarRBAC', '10.0.1');

COMMIT;

START TRANSACTION;
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (107, '', 'Fleet automation / read', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (108, '', 'Fleet automation / manage', 0);

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260522201629_AddFleetAutomationConfig', '10.0.1');

COMMIT;

START TRANSACTION;
INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260523135856_AddRentalConcurrency', '10.0.1');

COMMIT;

START TRANSACTION;
INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260523145122_AddDepositCustomerConcurrency', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "RepairOrders" ADD "LogDbEntryId" bigint;

ALTER TABLE "RepairOperations" ADD "LogDbEntryId" bigint;

ALTER TABLE "Purposes" ADD "LogDbEntryId" bigint;

ALTER TABLE "PosTerminals" ADD "LogDbEntryId" bigint;

ALTER TABLE "OfficePlaces" ADD "LogDbEntryId" bigint;

ALTER TABLE "OfficeOrders" ADD "LogDbEntryId" bigint;

ALTER TABLE "MotivationRules" ADD "LogDbEntryId" bigint;

ALTER TABLE "MotivationPercentGroups" ADD "LogDbEntryId" bigint;

ALTER TABLE "MotivationPercentCarModels" ADD "LogDbEntryId" bigint;

ALTER TABLE "MotivationPercentages" ADD "LogDbEntryId" bigint;

ALTER TABLE "MotivationExpenses" ADD "LogDbEntryId" bigint;

ALTER TABLE "Counterparties" ADD "LogDbEntryId" bigint;

ALTER TABLE "CashBoxes" ADD "LogDbEntryId" bigint;

CREATE INDEX "IX_RepairOrders_LogDbEntryId" ON "RepairOrders" ("LogDbEntryId");

CREATE INDEX "IX_RepairOperations_LogDbEntryId" ON "RepairOperations" ("LogDbEntryId");

CREATE INDEX "IX_Purposes_LogDbEntryId" ON "Purposes" ("LogDbEntryId");

CREATE INDEX "IX_PosTerminals_LogDbEntryId" ON "PosTerminals" ("LogDbEntryId");

CREATE INDEX "IX_OfficePlaces_LogDbEntryId" ON "OfficePlaces" ("LogDbEntryId");

CREATE INDEX "IX_OfficeOrders_LogDbEntryId" ON "OfficeOrders" ("LogDbEntryId");

CREATE INDEX "IX_MotivationRules_LogDbEntryId" ON "MotivationRules" ("LogDbEntryId");

CREATE INDEX "IX_MotivationPercentGroups_LogDbEntryId" ON "MotivationPercentGroups" ("LogDbEntryId");

CREATE INDEX "IX_MotivationPercentCarModels_LogDbEntryId" ON "MotivationPercentCarModels" ("LogDbEntryId");

CREATE INDEX "IX_MotivationPercentages_LogDbEntryId" ON "MotivationPercentages" ("LogDbEntryId");

CREATE INDEX "IX_MotivationExpenses_LogDbEntryId" ON "MotivationExpenses" ("LogDbEntryId");

CREATE INDEX "IX_Counterparties_LogDbEntryId" ON "Counterparties" ("LogDbEntryId");

CREATE INDEX "IX_CashBoxes_LogDbEntryId" ON "CashBoxes" ("LogDbEntryId");

ALTER TABLE "CashBoxes" ADD CONSTRAINT "FK_CashBoxes_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id");

ALTER TABLE "Counterparties" ADD CONSTRAINT "FK_Counterparties_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id");

ALTER TABLE "MotivationExpenses" ADD CONSTRAINT "FK_MotivationExpenses_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id");

ALTER TABLE "MotivationPercentages" ADD CONSTRAINT "FK_MotivationPercentages_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id");

ALTER TABLE "MotivationPercentCarModels" ADD CONSTRAINT "FK_MotivationPercentCarModels_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id");

ALTER TABLE "MotivationPercentGroups" ADD CONSTRAINT "FK_MotivationPercentGroups_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id");

ALTER TABLE "MotivationRules" ADD CONSTRAINT "FK_MotivationRules_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id");

ALTER TABLE "OfficeOrders" ADD CONSTRAINT "FK_OfficeOrders_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id");

ALTER TABLE "OfficePlaces" ADD CONSTRAINT "FK_OfficePlaces_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id");

ALTER TABLE "PosTerminals" ADD CONSTRAINT "FK_PosTerminals_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id");

ALTER TABLE "Purposes" ADD CONSTRAINT "FK_Purposes_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id");

ALTER TABLE "RepairOperations" ADD CONSTRAINT "FK_RepairOperations_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id");

ALTER TABLE "RepairOrders" ADD CONSTRAINT "FK_RepairOrders_LogDbEntries_LogDbEntryId" FOREIGN KEY ("LogDbEntryId") REFERENCES "LogDbEntries" ("Id");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260523170419_add_AuditEntities', '10.0.1');

COMMIT;

START TRANSACTION;
INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260523213305_SnapshotResync', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "Customers" ADD CONSTRAINT "CK_Customers_EmiratesId_pair" CHECK (("EmiratesId" IS NULL) = ("EmiratesIdExpiry" IS NULL));

ALTER TABLE "Customers" ADD CONSTRAINT "CK_Customers_Passport_pair" CHECK (("Passport" IS NULL) = ("PassportExpiry" IS NULL));

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260524191025_AddCustomerDocConstraints', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "CarPricingRows" ADD CONSTRAINT "CK_CarPricingRows_NonNegative" CHECK ("SeasonPrice" >= 0 AND "OffSeasonPrice" >= 0);

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260524192318_AddCarPricingRowsNonNegative', '10.0.1');

COMMIT;

START TRANSACTION;
CREATE TABLE "DriverDevices" (
    "Id" bigint GENERATED BY DEFAULT AS IDENTITY,
    "UserId" bigint NOT NULL,
    "DeviceId" text,
    "Platform" text,
    "AppVersion" text,
    "LastSeen" timestamp with time zone NOT NULL,
    "RegisteredAt" timestamp with time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    CONSTRAINT "PK_DriverDevices" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_DriverDevices_Users_UserId" FOREIGN KEY ("UserId") REFERENCES "Users" ("Id") ON DELETE CASCADE
);

CREATE TABLE "MobileApps" (
    "Id" bigint GENERATED BY DEFAULT AS IDENTITY,
    "CompanyId" bigint NOT NULL,
    "AppName" text,
    "PackageName" text,
    "LatestVersion" text,
    "ApkDownloadLink" text,
    "Description" text,
    "IsActive" boolean NOT NULL,
    CONSTRAINT "PK_MobileApps" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_MobileApps_Companies_CompanyId" FOREIGN KEY ("CompanyId") REFERENCES "Companies" ("Id") ON DELETE CASCADE
);

CREATE TABLE "OfficeOrderPhotos" (
    "Id" bigint GENERATED BY DEFAULT AS IDENTITY,
    "OrderId" bigint NOT NULL,
    "UploadedFileId" uuid NOT NULL,
    "DriverId" bigint NOT NULL,
    "UploadedAt" timestamp with time zone NOT NULL,
    CONSTRAINT "PK_OfficeOrderPhotos" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_OfficeOrderPhotos_OfficeOrders_OrderId" FOREIGN KEY ("OrderId") REFERENCES "OfficeOrders" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_OfficeOrderPhotos_UploadedFiles_UploadedFileId" FOREIGN KEY ("UploadedFileId") REFERENCES "UploadedFiles" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_OfficeOrderPhotos_Users_DriverId" FOREIGN KEY ("DriverId") REFERENCES "Users" ("Id") ON DELETE RESTRICT
);

CREATE TABLE "UserAppVersions" (
    "Id" bigint GENERATED BY DEFAULT AS IDENTITY,
    "UserId" bigint NOT NULL,
    "PackageName" text,
    "InstalledVersion" text,
    "ReportedAt" timestamp with time zone NOT NULL,
    CONSTRAINT "PK_UserAppVersions" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_UserAppVersions_Users_UserId" FOREIGN KEY ("UserId") REFERENCES "Users" ("Id") ON DELETE CASCADE
);

INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (131, '', 'Mobile / read cars and drivers', 0);
INSERT INTO "AuthAccesses" ("Id", "Description", "Name", "Priority")
VALUES (132, '', 'Mobile / manage app registry', 0);

CREATE INDEX "IX_DriverDevices_DeviceId" ON "DriverDevices" ("DeviceId");

CREATE INDEX "IX_DriverDevices_UserId" ON "DriverDevices" ("UserId");

CREATE INDEX "IX_MobileApps_CompanyId" ON "MobileApps" ("CompanyId");

CREATE INDEX "IX_OfficeOrderPhotos_DriverId" ON "OfficeOrderPhotos" ("DriverId");

CREATE INDEX "IX_OfficeOrderPhotos_OrderId" ON "OfficeOrderPhotos" ("OrderId");

CREATE INDEX "IX_OfficeOrderPhotos_UploadedFileId" ON "OfficeOrderPhotos" ("UploadedFileId");

CREATE INDEX "IX_UserAppVersions_UserId_PackageName" ON "UserAppVersions" ("UserId", "PackageName");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260528171014_add_mobile_entities', '10.0.1');

COMMIT;

