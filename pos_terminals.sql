select * from "PosTerminalUsages"

select *
from "AggrDriverStatuses" order by "Id" desc
;


select *
from "UserSummaryStatuses"  order by "Id" desc;

select *
from "Reports";

select *
from "CabmanSummaries" where "UserId" in (21,22) order by "Date" desc


select * from "PosTerminalUsages"

select *
from "UserSummaryStatuses" order by "Id" desc;

select *
from "PosTerminals" where "Name" ='10015278';

39

select *
from "Users" where "PosTerminalId" = 39;


select * from "UserSummaryStatuses" where "UserId" in (974,1072,896)
and "StartTime" <= '2026-04-16 08:52'
and ("EndTime" > '2026-04-16 08:52' or "EndTime" is null)



select *
from "Transactions" where "Id" = 2879089;