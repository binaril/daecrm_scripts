select * from "YoocaCars";

select * from "YoocaUsers";


select * from "YoocaOrders";
select * from "YoocaLocations";


delete from "YoocaLocations";
delete from "YoocaOrders";
delete from "YoocaCars";
delete from "YoocaUsers";


select * from "Users" where "CompanyId" = 9

select * from "YoocaOrders"


select *
from "CashBoxes";

select * from "Companies";

select *
from "CompanyTransactionSources";


select * from "CashBoxes";

select * from "Aggregators"

select *, "DateTime" + interval '81 days' from "Transactions" where "AggregatorId" = 4
                             and "DateTime" between '2026-01-06' and '2026-01-13'
                             order by "DateTime" desc

insert into "Transactions" ("DateTime", "CompanyId", "TransactionTypeId", "Description", "Amount", "DriverId", "CarId",
                            "AggregatorId", "AggregatorDriverId", "OrderId", "AddingCashBoxId", "WithdrawalCashBoxId",
                            "CreatedUserId", "CreatedTime", "IsHandled", "AggregatorTransactionId",
                             "CounterpartyId",
                            "PurposeId", "AggregatorCategory", "CancelledTime", "CancelledUserId",
                            "PosTerminalId")
(select "DateTime" + interval '81 days', "CompanyId", "TransactionTypeId", "Description", "Amount", "DriverId", "CarId",
                            "AggregatorId", "AggregatorDriverId", "OrderId", "AddingCashBoxId", "WithdrawalCashBoxId",
                            "CreatedUserId", "CreatedTime", false, "AggregatorTransactionId" || 'N',
                           "CounterpartyId",
                            "PurposeId", "AggregatorCategory", "CancelledTime", "CancelledUserId",
                            "PosTerminalId" from "Transactions" where "AggregatorId" = 4
                             and "DateTime" between '2026-01-06' and '2026-01-13');

insert into "CompanyTransactionSources"("CompanyId", "TransactionSourceId", "CashboxId", "WithdrawalCashboxId")
(select c."CompanyId", c."TransactionSourceId", min(c."Id"), null from "CashBoxes" c where c."TransactionSourceId" is not null
group by  c."CompanyId", c."TransactionSourceId")
                                                                                )
