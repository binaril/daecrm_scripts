select c."Id", "VehicleID", c."Brand", c."Model", c."CarModelId", cm."Brand", cm."Model", cb."Name" from "Cars" c
inner join "CarModels" cm on c."CarModelId" = cm."Id"
inner join public."CarBrands" cb on cm."CarBrandId" = cb."Id"
where "CompanyId"=2
order by cb."Name", cm."Model"

select * from "DriverSummaries"

select * from "CabmanSummaries"
         where "UserId" in (44,19)
         order by "Date" desc


select c."VehicleID", count(*) userscount, string_agg(cast(u."Id" as varchar), ',')
from "Cars" c
inner join "Users" u on c."Id" = u."CarId"
where u."IsBlocked" = false and c."CompanyId"=2
group by c."VehicleID"
having count(*) > 1;