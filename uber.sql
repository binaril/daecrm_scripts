select * from "UberDrivers" where "CompanyId"=2 and "LastName" like '%Elsamn%';


select * from "UberDrivers" where --"FirstName" like '%ilal%' or "LastName" like '%ilal%'
--or "FirstName" like '%arooq%' or "LastName" like '%arooq%'
--or
--"FirstName" like '%eqab%' or "LastName" like '%eqab%'
--or
                                "FirstName" like '%ohammad%' or "LastName" like '%ohammad%'
;


select * from "Users" where "IsBlocked" "Id"=57


select * from "UberDrivers" ud inner join "Users" u on ud."UserId" = u."Id"
where u."IsBlocked"


select * from "UberDrivers" ud where  "Id"  in (493, 452)