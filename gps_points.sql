--определяем авто

select cc."Id", cc."VehicleID", u."UserName" from "Users" u
                  inner join "CabmanCars" cc on u."CarId" = cc."CarId"
         where "IsBlocked" = false and "Role"=0 and u."CompanyId"=2
           and "UserName" like '%Khan%';



select * from "CabmanCarStatuses" ccs where ccs."CabmanCarId" = 238
and "Time" between '2025-06-26 12:00:00.000000 +00:00' and '2025-06-27 12:00:00.000000 +00:00'