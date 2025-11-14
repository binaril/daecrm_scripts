--определяем авто

select cc."Id" "CabmanCarId", cc."VehicleID", u."Id" "UserId", u."UserName" from "Users" u
                  inner join "CabmanCars" cc on u."CarId" = cc."CarId"
         where "IsBlocked" = false and "Role"=0 and u."CompanyId"=2
           and "UserName" like '%Salman  Invest%';



select * from "CabmanCarStatuses" ccs where ccs."CabmanCarId" = 192
and "Time" between '2025-10-05 22:00:00.000000 +05:00' and '2025-10-06 04:00:00.000000 +05:00'
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

select * from "CabmanCars" where "VehicleID" like 'L42696';

select * from "Cars" where "Id" = 30;

update "CabmanCars" set
"CurrentCabmanStatusId" = null


select * from "Users" where "CarId" = 30



                                                                                                                                                                                                 185