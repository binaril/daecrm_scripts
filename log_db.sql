select * from "YoocaOrders";

select * from "LogDbEntries" where "LogDbParentId" is not null;

delete from "LogDbEntries" where "LogDbParentId" is not null;

delete from "LogDbEntries" where "LogDbParentId" is null;


select * from "LogDbActions"