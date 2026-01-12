select * from public."Companies"

select * from "CashBoxes"

select * from "Purposes"

select * from "ImportTransactionItems"

select * from "Transactions" where --"TransactionTypeId" = 21 and
                                   "CompanyId"=2
                             order by "DateTime" desc