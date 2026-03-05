--20251206
--DROP TABLE "CashTransfers";




GRANT SELECT, INSERT, DELETE, UPDATE ON "YoocaOrders" TO limousine;
GRANT SELECT, INSERT, DELETE, UPDATE ON "YoocaCars" TO limousine;
GRANT SELECT, INSERT, DELETE, UPDATE ON "YoocaUsers" TO limousine;
GRANT SELECT, INSERT, DELETE, UPDATE ON "YoocaLocations" TO limousine;
GRANT SELECT, INSERT, DELETE, UPDATE ON "YoocaRouteTypes" TO limousine;
GRANT SELECT, INSERT, DELETE, UPDATE ON "YoocaOrderStatuses" TO limousine;
GRANT SELECT, INSERT, DELETE, UPDATE ON "YoocaServiceTypes" TO limousine;
GRANT SELECT, INSERT, DELETE, UPDATE ON "YoocaTariffTypes" TO limousine;
GRANT SELECT, INSERT, DELETE, UPDATE ON "Currencies" TO limousine;
GRANT SELECT, INSERT, DELETE, UPDATE ON "LogDbItems" TO limousine;
GRANT SELECT, INSERT, DELETE, UPDATE ON "LogDbActions" TO limousine;
GRANT SELECT, INSERT, DELETE, UPDATE ON "LogDbEntries" TO limousine;
GRANT SELECT, INSERT, DELETE, UPDATE ON "LogDbActions" TO limousine;


GRANT SELECT, INSERT, DELETE, UPDATE ON "PosTerminals" TO limousine;
GRANT SELECT, INSERT, DELETE, UPDATE ON "PosTerminalUsages" TO limousine;


select distinct trim("AcquiringTerminalName") from "Cars" where "CompanyId"=2 and "AcquiringTerminalName" is not null and "AcquiringTerminalName" != '';

--создаем терминалы
insert into "PosTerminals" ("Name", "CompanyId", "Deleted")
(select distinct "AcquiringTerminalName", 2, false from "Cars" where "CompanyId"=2 and "AcquiringTerminalName" is not null and "AcquiringTerminalName" != '');

--привязываем терминалы к водителям

update "Users" u
set "PosTerminalId" = (select "Id" from "PosTerminals" p
                                   where p."CompanyId" = u."CompanyId"
                                     and p."Name" = (select trim("AcquiringTerminalName") from "Cars" c where c."Id" = u."CarId")
                                   limit 1)
where "CompanyId" = 2 and "IsBlocked" = false and "Role" = 0;



select * from "PosTerminals";

select * from "Users" where "CompanyId"=2;