

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