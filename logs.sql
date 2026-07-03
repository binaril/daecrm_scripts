

select * from "Logs"
         where "CompanyId"=2
         order by "Time" desc;

--aggregators
select * from "Aggregators";

--yandex
select * from "Logs"
         where "CompanyId"=2 and "EntityTypeCode" = 0 and "EntityId" = 0 --and "Topic" = 'SaveDriverStatus'
         order by "Time" desc;

--uber
select * from "Logs"
         where "CompanyId"=9 and "EntityTypeCode" = 0 and "EntityId" = 1 --and "Topic" = 'SaveCommonTransactions'
         --and "Success" = false
         order by "Time" desc;

select count(*), max("Time") from "Logs" where "CompanyId" = 2 and "EntityTypeCode" = 0 and "EntityId" = 1 and "Success" = true
                                           and "Time">'2026-01-01'
and "DurationMilliseconds" > 30000

select * from "Logs" where "CompanyId" = 2 and "EntityTypeCode" = 0 and "EntityId" = 1 and "Success" = true
and "DurationMilliseconds" > 30000
 order by "Time" desc;

select "Id", "DriverTypeId" from "Users" where "CompanyId" = 10

select *
from "Companies" where "Id" = 10;

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

select count(*) from "Transactions" where "IsHandled" = false and "CompanyId" =2

select count(*) from "Transactions" where "DateTime" between '2026-05-01' and '2026-06-01'

select *
from "Companies";

select * from "CabmanCompanies"

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

select * from "Companies" where "Id" = 9

select *
from "CompanyExternalServiceConfigs";



CREATE ROLE backup_role LOGIN PASSWORD 'strong_password';
GRANT CONNECT ON DATABASE daecrm TO backup_role;
GRANT CONNECT ON DATABASE wiki TO backup_role;
GRANT CONNECT ON DATABASE taximeter TO backup_role;
GRANT USAGE ON SCHEMA public TO backup_role;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO backup_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT SELECT ON TABLES TO backup_role;

