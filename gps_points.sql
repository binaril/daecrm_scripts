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