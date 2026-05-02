

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
         where "CompanyId"=2 and "EntityTypeCode" = 0 and "EntityId" = 1 and "Topic" = 'SaveCommonTransactions'
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
         where "CompanyId"=2 and "EntityTypeCode" = 3 --and "Success" is false
         order by "Time" desc;


select * from "Logs"
         where "Success" is false
         order by "Time" desc;


truncate "Logs"

delete from "Logs" where "Time" < '2026-04-01'

select count(*) from "Users"

--reports
select * from "Reports";

select * from "Logs"
         where "CompanyId"=2 and "EntityTypeCode" = 4 --and "EntityId" = 11
         order by "Time" desc;


select * from "Transactions"
         where "AggregatorId" is not null
         and "DateTime" > '2026-03-14 15:27:34.401304 +00:00'
         order by "Id" desc

select * from "Transactions" where "DateTime" > '2025-12-11 09:47:38.931678 +00:00'


select min("Time")
from "Logs";



CREATE ROLE backup_role LOGIN PASSWORD 'strong_password';
GRANT CONNECT ON DATABASE daecrm TO backup_role;
GRANT CONNECT ON DATABASE wiki TO backup_role;
GRANT CONNECT ON DATABASE taximeter TO backup_role;
GRANT USAGE ON SCHEMA public TO backup_role;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO backup_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT SELECT ON TABLES TO backup_role;

