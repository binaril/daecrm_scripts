START TRANSACTION;

ALTER TABLE "Users" ADD "DriverTypeId" integer;

CREATE TABLE "DriverTypes" (
    "Id" integer NOT NULL,
    "Name" text,
    CONSTRAINT "PK_DriverTypes" PRIMARY KEY ("Id")
);

INSERT INTO "DriverTypes" ("Id", "Name")
VALUES (1, 'Investor');
INSERT INTO "DriverTypes" ("Id", "Name")
VALUES (2, 'Rental');
INSERT INTO "DriverTypes" ("Id", "Name")
VALUES (3, 'Commission');
INSERT INTO "DriverTypes" ("Id", "Name")
VALUES (4, 'Fixed salary');

CREATE INDEX "IX_Users_DriverTypeId" ON "Users" ("DriverTypeId");

ALTER TABLE "Users" ADD CONSTRAINT "FK_Users_DriverTypes_DriverTypeId" FOREIGN KEY ("DriverTypeId") REFERENCES "DriverTypes" ("Id");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20251027174348_add_driver_type', '8.0.6');

COMMIT;


GRANT SELECT, INSERT, DELETE, UPDATE ON "DriverTypes" TO limousine;

