select * from "Companies"

select * from "Users"
where lower("FirstName" || ' ' || "LastName") like '%arba%'
and lower("FirstName" || ' ' || "LastName") like '%%'
and "Role"=0
and "IsBlocked" = false
and "CompanyId" =2;

select * from "Transactions" where "DriverId" = 897
    order by "DateTime" desc;

select * from "Transactions" where "TransactionTypeId" = 27
    order by "DateTime" desc;



select * from "Transactions" where "DriverId" = 948
                             and "DateTime">'2026-01-17 11:37:54.039955 +00:00'
    order by "DateTime" desc;


select "Id", "FirstName", "LastName", "ElectricStationTagId" from "Users"
where "CompanyId" = 2

select * from "DriverSummaries" order by "Id" desc

select "Id", "AcquiringTerminalName" from "Cars" where "CompanyId" =2

select "Id", "Te" from "Users" where "CompanyId" =2

select * from "CashBoxes"