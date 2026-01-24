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

select * from