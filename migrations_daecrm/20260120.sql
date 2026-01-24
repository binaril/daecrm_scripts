START TRANSACTION;
INSERT INTO "TransactionTypes" ("Id", "Description", "IsAggrTransaction", "IsDebtPayment", "IsFine", "Name", "ShortName")
VALUES (42, '', FALSE, FALSE, FALSE, 'Company fee', NULL);

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260117142809_add_company_fee_transaction', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "CompanyEventTriggers" ADD "AllowPortalSend" boolean NOT NULL DEFAULT FALSE;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260118171338_add_allowPortalSendEvent', '10.0.1');

COMMIT;

