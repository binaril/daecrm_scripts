--unhandled
select count(*) from "Transactions" where "CompanyId" = 2 and "IsHandled" = false;

select * from "Transactions" where "CompanyId" = 2 and "IsHandled" = false
order by "DateTime" desc;

--Yango
select * from "Transactions" where "AggregatorId" = 0 and "CompanyId" = 2
order by "DateTime" desc;

select * from "Orders" where "AggregatorId" = 0 and "CompanyId" = 2
order by "DateTime" desc;


--Uber
select * from "Transactions" where "AggregatorId" = 5 and "CompanyId" = 2
order by "DateTime" desc;

select * from "Orders" where "AggregatorId" = 5 and "CompanyId" = 2
order by "DateTime" desc;


--Zed
select * from "Transactions" where "AggregatorId" = 5 and "CompanyId" = 2
order by "DateTime" desc;

select * from "Orders" where "AggregatorId" = 5 and "CompanyId" = 2
order by "DateTime" desc;


--2025-09-25 14:26:05.756000 +00:00



select * from "Transactions" where "DriverId" = 49
order by "DateTime" desc;


select * from "ZedDrivers" where "Name" like '%Elhassan%'

select * from "DriverActivityStatuses"

select * from "UserSessions"


select * from "Transactions" where "DriverId" = 1121

select * from "Transactions" where "CompanyId" = 9
order by "DateTime" desc;

select * from "AggrSummaries" s
inner join "Users" u on u."Id" = s."UserId"
where u."CompanyId" = 9

select * from "AggrSummaries" where "UserId" = 1121

select * from "DriverSummaries" s inner join "Users" u on u."Id" = s."UserId"
where u."CompanyId" = 9

select * from "CashBoxSummaries" s inner join "CashBoxes" c on c."Id" = s."CashBoxId" where c."CompanyId" = 9

select * from "OfficeOrders" where "DriverId"=1121

select * from "Users" where "Id" = 36 or "Id" = 1120

select * from "Transactions" where "CompanyId"=2 and
                                   "AggregatorId"=1 and
                        "AggregatorCategory" like '%little_fare%' and
"DateTime" between '2026-01-28 18:00:00' and '2026-01-29 22:00:00'
order by "DateTime";

/*insert into "Transactions"
("DateTime", "CompanyId", "TransactionTypeId", "Description", "Amount", "DriverId", "CarId", "AggregatorId", "AggregatorDriverId",
 "OrderId", "AddingCashBoxId", "CreatedTime", "IsHandled", "AggregatorTransactionId", "AggregatorCategory", "IsCorrection", "IsCancelled")
 (select
       "DateTime", "CompanyId", "TransactionTypeId", "Description", -"Amount", "DriverId", "CarId", "AggregatorId", "AggregatorDriverId",
 "OrderId", "AddingCashBoxId", "CreatedTime", false, "AggregatorTransactionId", 'fare / correction_fare', "IsCorrection", "IsCancelled"
 from "Transactions" where "CompanyId"=2 and
                                   "AggregatorId"=1 and
                        "AggregatorCategory" like '%little_fare%' and
"DateTime" between '2026-01-28 18:00:00' and '2026-01-29 22:00:00'     );*/


select * from "Transactions" t where
    exists(select * from "Transactions" t2
                    where t."AggregatorTransactionId"=t2."AggregatorTransactionId"
                    and "AggregatorId"=1
                        and t."Amount" =t2."Amount"
                        and "AggregatorCategory" like '%fare / little_fare%' and
"DateTime" between '2026-01-28 18:00:00' and '2026-01-29 22:00:00') and
                                   "AggregatorId"=1 and
                        "AggregatorCategory" like '%fare / fare%' and
"DateTime" between '2026-01-28 18:00:00' and '2026-01-29 22:00:00'
order by "DateTime";

select * from "AggrSummaries"

select * from "Transactions" where Ag





select * from "Transactions" where
"AggregatorTransactionId" = '384802ca-6503-3886-8ac8-a7369aafacc8';

select count(*) from "Transactions" where "IsHandled" = false and "CompanyId"=2 and "Id"<2573825

select max("Id") from "Transactions" where "IsHandled" = false and "CompanyId"=2


select * from "Users" where "Phone" like '%87654%'

--delete from "Transactions" where "AggregatorId"=1 and "CompanyId"=2 and "DateTime">'2026-01-28'

2026-01-28 18:04:22.870000 +00:00
Fare,107.67
Tax on Service Fee,-1.35
Service fee,-26.92
Toll,8

