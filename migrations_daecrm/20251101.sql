START TRANSACTION;

ALTER TABLE "Reports" ADD "MessengerTypeId" integer;

CREATE TABLE "MessengerTypes" (
    "Id" integer NOT NULL,
    "Name" text,
    CONSTRAINT "PK_MessengerTypes" PRIMARY KEY ("Id")
);

INSERT INTO "MessengerTypes" ("Id", "Name")
VALUES (1, 'Whatsapp');
INSERT INTO "MessengerTypes" ("Id", "Name")
VALUES (2, 'Telegram');

CREATE INDEX "IX_Reports_MessengerTypeId" ON "Reports" ("MessengerTypeId");

ALTER TABLE "Reports" ADD CONSTRAINT "FK_Reports_MessengerTypes_MessengerTypeId" FOREIGN KEY ("MessengerTypeId") REFERENCES "MessengerTypes" ("Id");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251101164524_add_reportMessengerType', '8.0.6');

COMMIT;

GRANT SELECT, INSERT, DELETE, UPDATE ON "MessengerTypes" TO limousine;