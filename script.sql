select * from "Companies"

select * from "Users"
where lower("FirstName" || ' ' || "LastName") like '%arba%'
and lower("FirstName" || ' ' || "LastName") like '%%'
and "Role"=0
and "IsBlocked" = false
and "CompanyId" =2


select "Id", "FirstName", "LastName", "ElectricStationTagId" from "Users"
where "CompanyId" = 2

select * from "DriverSummaries" order by "Id" desc

select "Id", "AcquiringTerminalName" from "Cars" where "CompanyId" =2

select "Id", "Te" from "Users" where "CompanyId" =2