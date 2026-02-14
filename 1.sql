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



select * from "CompanyEventTriggers"

select * from "EventTriggers"

select * from "__EFMigrationsHistory"

select * from "Logs"



select * from "OfficeOrders" where "CompanyId"=9


select * from "Users" where "CompanyId" = 2 and "UserName" like '%Matloob%'


GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO wiki