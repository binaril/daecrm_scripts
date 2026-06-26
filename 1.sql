select * from public."Companies"

select * from "CabmanCars" where "Id" = 172

select *
from "CabmanCarStatuses" where "CabmanCarId" = 172
                         and "Time" < '2026-05-02 20:00'
order by "Id" desc;

select * from "CashBoxes"

select * from "Purposes"

select * from "ImportTransactionItems"

select * from "Transactions" where --"TransactionTypeId" = 21 and
                                   "CompanyId"=2
                             order by "DateTime" desc

select *
from "CabmanTrips" order by "Id" desc;

select * from "CashBoxes";

select * from "ImportTransactionCompanyPurposes"

select * from "Users" where "CompanyId"=2 and "UserName" like '%Mosta%'

select *
from "Companies";

select * from "LogDbItems";

select * from "CompanyEventTriggers"

select * from "EventTriggers"

select * from "__EFMigrationsHistory"

select * from "Logs"



select * from "OfficeOrders" where "CompanyId"=9


select * from "Users" where "CompanyId" = 2 and "UserName" like '%Zulfiqar%'


GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO wiki

select *
from "Counterparties" where "CompanyId" =9


select * from "DriverSummaries" where "UserId"=1123 order by "Id" desc


select *
from "Transactions" where "DriverId" = 1133 and "DateTime">'2026-02-27 20:00' and "DateTime"<'2026-02-28 20:00';

select * from "CarUsages"
         where "CarId"=9
         order by "Time" desc

L73526
10005531

select *
from "Cars";

Arslan Talib
Несколько транзакций (до 14.02.2026) попали через авто L73526 (использовался Arslan Talib до 18.02.2026). Потом терминал привязали к L10674 и транзакции стали уже туда поступать. То есть здесь поздно поменяли терминал у автомобиля. Нам нужно подумать как в CRM сделать так, чтоб была возможность исправить это. Например возможность пересчета транзакций при смене терминала

Adil Liaqat похожая ситуация


Итак после разбора можно

select * from "CabmanSummaries" order by "Date" Desc

select *
from "CabmanCarStatuses" s
inner join "CabmanCars" c on s."CabmanCarId"=c."Id"
where c."CarId"=790 order by "Time" desc;

select * from "CabmanCarStatuses" where "Speed">10  and "Time"> '2026-04-15' and "CabmanCarId" = 209

select "CarId"
from "CabmanCars" where "Id" = 209;

select * from "Users" where "CarId" = 610



select *
from "Transactions" where
                        "CompanyId" =2 and
                        "TransactionTypeId" in (17, 29, 30, 31, 32, 33) and
                        "DateTime"
    between '2026-05-04 00:00:00.000000 +04:00' and '2026-05-05 00:00:00.000000 +04:00';

select *
from "Companies" where "Id" = 2;

select  * from "CompanyExternalServiceConfigs"

  SELECT
      u."UserName"                                AS driver,
      c."VehicleID"                               AS car,
      dcl."Time"                                  AS changed_at,
      LAG(c."VehicleID") OVER (
          PARTITION BY dcl."UserId"
          ORDER BY dcl."Time"
      )                                           AS prev_car
  FROM "DriverCarLogs" dcl
  JOIN "Users"  u ON u."Id" = dcl."UserId"
  LEFT JOIN "Cars" c ON c."Id" = dcl."CarId"
 -- WHERE dcl."AggregatorType" = 1   -- 1 = UBER
  ORDER BY dcl."Time" DESC;



select distinct "Model" from "BoltCars"

select *
from "YandexCars";