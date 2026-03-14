
select *,  (select o."CompanyId" from "Users" u where u."Id" = o."DriverId") from "OfficeOrders" o
                                                                            -- order by "Id" desc
where o."CompanyId" != (select u."CompanyId" from "Users" u where u."Id" = o."DriverId")

select *
from "Users" where "Id";


update "Orders" o
set "CompanyId" = (select u."CompanyId" from "Users" u where u."Id" = o."DriverId")
where o."CompanyId" != (select u."CompanyId" from "Users" u where u."Id" = o."DriverId")