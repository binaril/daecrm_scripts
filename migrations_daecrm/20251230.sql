START TRANSACTION;
ALTER TABLE "ImportTransactionOperations" RENAME COLUMN "PreparedRecordCount" TO "SkippedRecordCount";

ALTER TABLE "ImportTransactionOperations" ADD "AppliedRecordCount" integer NOT NULL DEFAULT 0;

ALTER TABLE "ImportTransactionOperations" ADD "FailRecordCount" integer NOT NULL DEFAULT 0;

ALTER TABLE "ImportTransactionOperations" ADD "ParsedTime" timestamp with time zone;

ALTER TABLE "ImportTransactionOperations" ADD "StartProcessingTime" timestamp with time zone;

ALTER TABLE "ImportTransactionOperations" ADD "TotalParsedAmount" numeric NOT NULL DEFAULT 0.0;

ALTER TABLE "ImportTransactionOperations" ADD "TotalProcessedAmount" numeric NOT NULL DEFAULT 0.0;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251227125052_add_import_transactions_fields', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "ImportTransactionOperations" ADD "Error" text;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251227133237_add_import_error_field', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "ImportTransactionOperations" ADD "Comment" text;

ALTER TABLE "ImportTransactionOperations" ADD "ParsedRecordCount" integer NOT NULL DEFAULT 0;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251228080850_add_import_transaction_comment', '10.0.1');

COMMIT;

