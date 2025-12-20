

select * from "Logs"
         where "CompanyId"=2
         order by "Time" desc;

--aggregators
select * from "Aggregators";

--yandex
select * from "Logs"
         where "CompanyId"=2 and "EntityTypeCode" = 0 and "EntityId" = 0
         order by "Time" desc;

--uber
select * from "Logs"
         where "CompanyId"=2 and "EntityTypeCode" = 0 and "EntityId" = 1
         order by "Time" desc;

--office
select * from "Logs"
         where "CompanyId"=2 and "EntityTypeCode" = 0 and "EntityId" = 3
         order by "Time" desc;

--bolt
select * from "Logs"
         where "CompanyId"=2 and "EntityTypeCode" = 0 and "EntityId" = 4
         order by "Time" desc;

--zed
select * from "Logs"
         where "CompanyId"=2 and "EntityTypeCode" = 0 and "EntityId" = 5
         order by "Time" desc;


--GPS tracker
select * from "Logs"
         where "CompanyId"=2 and "EntityTypeCode" = 1
         order by "Time" desc;

--Bot (reserved)
select * from "Logs"
         where "CompanyId"=2 and "EntityTypeCode" = 2
         order by "Time" desc;

--summary
select * from "Logs"
         where "CompanyId"=2 and "EntityTypeCode" = 3
         order by "Time" desc;


select * from "Logs"
         where "CompanyId"=2 and "EntityTypeCode" = 3 and "Topic" like 'DetectTrips'
         order by "Time" desc;


select count(*) from "Users"

--reports
select * from "Reports";

select * from "Logs"
         where "CompanyId"=2 and "EntityTypeCode" = 4 --and "EntityId" = 11
         order by "Time" desc;


select * from "Transactions" where "IsHandled" = false

select * from "Transactions" where "DateTime" > '2025-12-11 09:47:38.931678 +00:00'