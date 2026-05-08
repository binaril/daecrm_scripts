select * from "Companies"


select * from "CashBoxes" where "CompanyId"=9

select *
from "Aggregators";

select *
from "Transactions" where "CompanyId" = 9
and "TransactionTypeId" = 21

select * from "Companies"
select *
from "Companies";


select *
from "AggrSummaries"
where "AgregatorId" = 3 and "UserId" = 639
and "Date" between '2026-03-31 20:00:00.000000 +00:00' and '2026-04-29 20:00:00.000000 +00:00'
order by "Id" desc;


select * from "OfficeOrders" where "DriverId" = 639 order by "Id" desc

select *
from "UserLogins" where "Login" = 'peter';

select *
from "Users" where "CompanyId" is null;