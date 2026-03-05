select * from public."Companies"


select * from "CashBoxes"

select * from "Purposes"

select * from "ImportTransactionItems"

select * from "Transactions" where --"TransactionTypeId" = 21 and
                                   "CompanyId"=2
                             order by "DateTime" desc


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

