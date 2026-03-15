START TRANSACTION;
DROP INDEX "IX_PosTerminals_Name";

ALTER TABLE "Transactions" ADD "ParentId" bigint;

CREATE INDEX "IX_Transactions_ParentId" ON "Transactions" ("ParentId");

ALTER TABLE "Transactions" ADD CONSTRAINT "FK_Transactions_Transactions_ParentId" FOREIGN KEY ("ParentId") REFERENCES "Transactions" ("Id");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260307192435_add_parent_transaction', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "Transactions" ADD "PosTerminalId" bigint;

CREATE INDEX "IX_Transactions_PosTerminalId" ON "Transactions" ("PosTerminalId");

ALTER TABLE "Transactions" ADD CONSTRAINT "FK_Transactions_PosTerminals_PosTerminalId" FOREIGN KEY ("PosTerminalId") REFERENCES "PosTerminals" ("Id");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260312182240_add_transaction_posTerminal', '10.0.1');

COMMIT;

START TRANSACTION;
ALTER TABLE "Companies" ADD "PaymobFirstForceSend" boolean NOT NULL DEFAULT FALSE;

ALTER TABLE "Companies" ADD "PaymobFirstLimit" integer NOT NULL DEFAULT 0;

ALTER TABLE "Companies" ADD "PaymobLimit" integer NOT NULL DEFAULT 0;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260312192944_add_paymob_config_items', '10.0.1');

COMMIT;

