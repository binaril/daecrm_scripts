select * from "Users" where "Role"=0 and "CompanyId"=2
and "UserName" like '%mone%'


select * from "DriverActivityStatuses"

select * from "Users" where "Role"=0 and "CompanyId"=2 and "DriverActivityStatusId"=4;



select * from "Users" where "Role"=0 and "CompanyId"=2 --and "IsBlocked" = false
                        and "UserName" like '%Yasin%'


select * from "Users" where "ChatId" is not null
         order by "Id"

         where "Role"!=0 and "CompanyId"=2


         select "BotId" from "Companies"



select * from "UserSummaryStatuses" where "UserId"=910
order by "StartTime" desc

SELECT current_setting('TIMEZONE')

select * from "Companies"

select * from "CabmanTrips"


select * from "Orders"
where "AggregatorId" not in (0, 4)
         order by "Id" desc


2025-12-16 18:52:19.970000 +00:00

select "DateTime", "DriverStatuses"."Name" from "AggrDriverStatuses"
         inner join "DriverStatuses" on "DriverStatusId" = "DriverStatuses"."Id"
         where "DriverId" = 1004
         and "AggregatorId" = 1
 order by "AggrDriverStatuses"."Id" desc