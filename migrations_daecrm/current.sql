select * from "__EFMigrationsHistory" order by "MigrationId" desc


GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO limousine;

select * from "AuthAccesses"

select *
from "Users" where "Id" = 923;

select *
from "DriverSummaries" where "UserId" = 923 order by "Date" desc;

select *
from "MotivationRules" where "Id" = 42;