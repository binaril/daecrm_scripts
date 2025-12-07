select * from "AggrDriverStatuses" where "IsHandled" = false
         order by "Id" desc;


select * from "UserSummaryStatuses" order by "StartTime" desc;




select * from "DriverStatuses";

/*
 1,Online
0,Unknown
2,Offline
3,Busy
4,In order
45906 22:12
 */

 select count(*) from "AggrDriverStatuses" where "DateTime" > '2025-11-14' and "IsHandled" = false  and "DriverId" = 49

select * from "AggrDriverStatuses";

 /*update "AggrDriverStatuses" set "IsHandled" = false
  where "DateTime" >'2025-11-14'  and "DriverId" in (897, 19, 21, 905, 49)

insert into "AggrDriverStatuses"("DateTime", "CompanyId", "DriverStatusId", "DriverId", "CarId", "AggregatorId", "AggregatorDriverId", "IsHandled")
values ('2025-10-01', 2, 2, 897, null, 2, (select "Id" from "CareemDrivers" where "UserId" = 897), true );*/

 select "DateTime", "CarId", ag."Name" as aggregator, s."Name" as status, a."IsHandled"  from "AggrDriverStatuses" a
          inner join "DriverStatuses" s on s."Id" = a."DriverStatusId"
          inner join "Aggregators" ag on ag."Id" = a."AggregatorId"
          where "DriverId"=49 and "AggregatorId" = 0
          order by "DateTime" desc;

  select "DateTime", "CarId", ag."Name" as aggregator, s."Name" as status, a."IsHandled"  from "AggrDriverStatuses" a
          inner join "DriverStatuses" s on s."Id" = a."DriverStatusId"
          inner join "Aggregators" ag on ag."Id" = a."AggregatorId"
          where "DriverId"=49 and "AggregatorId" = 1
          order by "DateTime" desc;


  select "DateTime", "CarId", ag."Name" as aggregator, s."Name" as status, a."IsHandled"  from "AggrDriverStatuses" a
          inner join "DriverStatuses" s on s."Id" = a."DriverStatusId"
          inner join "Aggregators" ag on ag."Id" = a."AggregatorId"
          where "DriverId"=49 and "AggregatorId" = 2
          order by "DateTime" desc;

select * from "AggrDriverStatuses" where "DriverId"=49 and "AggregatorId" = 2
          order by "DateTime" desc;


  select "DateTime", "CarId", ag."Name" as aggregator, s."Name" as status, a."IsHandled"  from "AggrDriverStatuses" a
          inner join "DriverStatuses" s on s."Id" = a."DriverStatusId"
          inner join "Aggregators" ag on ag."Id" = a."AggregatorId"
          where "DriverId"=49 and "AggregatorId" = 3
          order by "DateTime" desc;

  select "DateTime", "CarId", ag."Name" as aggregator, s."Name" as status, a."IsHandled"  from "AggrDriverStatuses" a
          inner join "DriverStatuses" s on s."Id" = a."DriverStatusId"
          inner join "Aggregators" ag on ag."Id" = a."AggregatorId"
          where "DriverId"=49 and "AggregatorId" = 4
          order by "DateTime" desc;


select *, (select "DriverStatusId" from "AggrDriverStatuses" a where a."AggregatorId" = 2 and "DriverId"=u."Id" and "DateTime" =
                    (select max("DateTime") from "AggrDriverStatuses" a where a."AggregatorId" = 2 and "DriverId"=u."Id" ))
from "Users" u where "CompanyId"=2 and u."Role"=0 and u."IsBlocked" = false;

