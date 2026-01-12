START TRANSACTION;
ALTER TABLE "Companies" ADD "PaymobApiKey" text;

ALTER TABLE "Companies" ADD "PaymobUrl" text;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260109173529_add_paymob_config', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "Companies" ADD "GeideaEnabled" boolean NOT NULL DEFAULT FALSE;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260111091015_add_geaidea_config', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "Companies" ADD "GeideaStoreId" text;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260111111952_add_geidea_storeId', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "CashBoxes" ADD "TransactionSourceId" integer;

CREATE TABLE "TransactionSources" (
    "Id" integer NOT NULL,
    "Name" text,
    CONSTRAINT "PK_TransactionSources" PRIMARY KEY ("Id")
);

INSERT INTO "TransactionSources" ("Id", "Name")
VALUES (0, 'YANGO');
INSERT INTO "TransactionSources" ("Id", "Name")
VALUES (1, 'UBER');
INSERT INTO "TransactionSources" ("Id", "Name")
VALUES (2, 'CAREEM');
INSERT INTO "TransactionSources" ("Id", "Name")
VALUES (3, 'OFFICE');
INSERT INTO "TransactionSources" ("Id", "Name")
VALUES (4, 'BOLT');
INSERT INTO "TransactionSources" ("Id", "Name")
VALUES (5, 'ZED');
INSERT INTO "TransactionSources" ("Id", "Name")
VALUES (6, 'ACQUIRING');

CREATE INDEX "IX_CashBoxes_TransactionSourceId" ON "CashBoxes" ("TransactionSourceId");

ALTER TABLE "CashBoxes" ADD CONSTRAINT "FK_CashBoxes_TransactionSources_TransactionSourceId" FOREIGN KEY ("TransactionSourceId") REFERENCES "TransactionSources" ("Id");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260111135826_add_transactionsource', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "Companies" RENAME COLUMN "GeideaEnabled" TO "GeideaFirstForceSend";

ALTER TABLE "Companies" ADD "GeideaFirstDaysDepth" integer NOT NULL DEFAULT 0;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260111161959_add_additional_guidea_config', '10.0.1');

COMMIT;


GRANT SELECT, INSERT, DELETE, UPDATE ON "TransactionSources" TO limousine;