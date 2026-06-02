select * from "__EFMigrationsHistory" order by "MigrationId" desc


GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO limousine;



select *
from "OfficeOrders" where "DriverId" = 1123 and "Cost" = 2300
                    order by "Id";

select *
from "Orders" where "AggregatorOrderId" = '2701';

select *
from "Transactions" where "OrderId" = 721582;