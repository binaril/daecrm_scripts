select * from "LogDbItems";

select * from "LogDbEntries";

select * from "LogDbActions" order by "Id" desc;

select * from "YoocaOrders"


select * from "LogDbEntries" e
inner join "LogDbActions" a on a."LogDbEntryId"=e."Id"
inner join "LogDbItems" i on i."LogDbActionId" = a."Id"
order by i."Id"


select * from "YoocaUsers"



select * from