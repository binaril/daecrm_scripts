--определяем авто

select cc."Id" "CabmanCarId", cc."VehicleID", u."Id" "UserId", u."UserName" from "Users" u
                  inner join "CabmanCars" cc on u."CarId" = cc."CarId"
         where "IsBlocked" = false and "Role"=0 and u."CompanyId"=2
           and "UserName" like '%Salman  Invest%';



select * from "CabmanCarStatuses" ccs where ccs."CabmanCarId" = 183
and "Time" between '2026-05-05 00:00:00.000000 +04:00' and '2026-05-06 00:00:00.000000 +04:00'
order by "Time";

select * from "Orders" o where "DriverId" = 19
and "DateTime" between '2025-10-05 22:00:00.000000 +05:00' and '2025-10-06 04:00:00.000000 +05:00'
order by "DateTime";


select "Time"+interval '1 hour'*4 as time, "Status", "SeatSensorStatus", "SeatSensorValue", "Lat", "Lng", "Odometr", "State"
from "CabmanCarStatuses" where "CabmanCarId" = 185
and "Time" between '2025-11-05 22:00:00.000000 +04:00' and '2025-11-05 23:00:00.000000 +04:00'
order by "Time" desc;



select count(*) from "CabmanCarStatuses";

select min("Time")
from "CabmanCarStatuses";

delete from "CabmanCarStatuses" where "Time"<'2025-08-01';

select * from "CabmanCars" where "VehicleID" like 'L10665';


select "Time", "Status", "SeatSensorStatus", "SeatSensorValue", "Lat", "Lng", "Odometr", "State"
from "CabmanCarStatuses" where "CabmanCarId" = 236
and "Time" between '2026-05-16 17:13:05.163000 +05:00' and '2026-05-16 19:11:40.257000 +05:00'
order by "Time" desc;

select * from "Cars" where "Id" = 22
select * from "Users" where "CarId" = 22


select * from "CabmanCars" where "CarId" =814


select *
from "AggrDriverStatuses" where "DriverId" = 18 and "AggregatorId" = 0 order by  "Id" desc;


select * from "UploadedFiles"

select * from "CabmanCarStatuses" s
inner join "CabmanCars" c on c."Id" = s."CabmanCarId"
where c."CompanyId" = 9 --and "SeatSensorStatus" != 0
order by s."Id" desc

select *
from "CabmanCarStatuses" where "CabmanCarId" = 241
                         and "Time" between '2026-05-20 05:57:00.000000 +00:00' and '2026-05-20 06:50:00.000000 +00:00'
order by "Id";


select *
from "CabmanCars" where "VehicleID" = 'L93211';

select "Id", "Name", "TrackerId", *
from "Companies" where "Id" = 9;

select * from "CabmanCompanies"


select *
from "TriggerRules" where "CompanyId" = 2;


select * from "UserLogins" where "Id" = 118

select *
from "Users" where "Id" = 1013;

select *
from;


select * from "CabmanTrips" t
inner join "CabmanCars" c on c."Id" = t."CabmanCarId"
where c."CompanyId" = 9
order by t."Id" desc