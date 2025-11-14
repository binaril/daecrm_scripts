select * from "EventTriggers";

select * from "CompanyEventTriggers";

select * from "DriverReportLogs" order by  "Time" desc;

select count(*) from "DriverReportLogs" where "ReportId" is null;

--триггеры
select ce."Id", t."Name" from "CompanyEventTriggers" ce
inner join "EventTriggers" t on ce."EventTriggerId" = t."Id"
where "CompanyId"=2;

select * from "CompanyEventTriggers" ce
inner join "EventTriggers" t on ce."EventTriggerId" = t."Id"
where "CompanyId"=2;

select * from "Users" where "CompanyId"=2 and "Role"=0 and "IsBlocked"= false

/*
1 Order cancelled by driver - Из системы агрегатора поступила информация об отмене заказа со стороны водителя (кроме убера, нет в API)
2 Mileage without orders - Водитель проехал 20 км без пассажира (фиксируется по одометру и датчику сидения)
3 Seat sensors disabled - Зафиксированы выполнения заказов без активированных датчиков сидений
4 Online without orders - Водитель онлайн 20 минут без пассажира (фиксируется по датчику сидения)
5 Block driver - Водитель заблокирован в агрегаторе
6 Offline/online - Датчик GPS включен(появился сигнал)/отключен (нет сигнала в течение 15 минут)

*/


--статистика рассылки по водителям

select u."UserName", count(*) "all",
sum (case when r."IsSuccess" then 0 else 1 end) errors,
sum (case when r."CompanyEventTriggerId" = 1 then 1 else 0 end) "Order cancelled by driver",
sum (case when r."CompanyEventTriggerId" = 2 then 1 else 0 end) "Mileage without orders",
sum (case when r."CompanyEventTriggerId" = 3 then 1 else 0 end) "Seat sensors disabled",
sum (case when r."CompanyEventTriggerId" = 4 then 1 else 0 end) "Online without orders",
sum (case when r."CompanyEventTriggerId" = 5 then 1 else 0 end) "Block driver",
sum (case when r."CompanyEventTriggerId" = 6 then 1 else 0 end) "Offline/online"
from "DriverReportLogs" r
inner join "Users" u on r."DriverId" = u."Id"
where "ReportId" is null and r."Time">='2025-11-01 00:00:00.000000 +04:00'
group by u."UserName";


select count(*) "all",
sum (case when r."IsSuccess" then 0 else 1 end) errors,
sum (case when r."CompanyEventTriggerId" = 1 then 1 else 0 end) "Order cancelled by driver",
sum (case when r."CompanyEventTriggerId" = 2 then 1 else 0 end) "Mileage without orders",
sum (case when r."CompanyEventTriggerId" = 3 then 1 else 0 end) "Seat sensors disabled",
sum (case when r."CompanyEventTriggerId" = 4 then 1 else 0 end) "Online without orders",
sum (case when r."CompanyEventTriggerId" = 5 then 1 else 0 end) "Block driver",
sum (case when r."CompanyEventTriggerId" = 6 then 1 else 0 end) "Offline/online"
from "DriverReportLogs" r
inner join "Users" u on r."DriverId" = u."Id"
where "ReportId" is null and r."Time">='2025-10-17 00:00:00.000000 +04:00';


--из отправленных


select count(*) "all",
sum (case when r."CompanyEventTriggerId" = 1 then 1 else 0 end) "Order cancelled by driver",
sum (case when r."CompanyEventTriggerId" = 2 then 1 else 0 end) "Mileage without orders",
sum (case when r."CompanyEventTriggerId" = 3 then 1 else 0 end) "Seat sensors disabled",
sum (case when r."CompanyEventTriggerId" = 4 then 1 else 0 end) "Online without orders",
sum (case when r."CompanyEventTriggerId" = 5 then 1 else 0 end) "Block driver",
sum (case when r."CompanyEventTriggerId" = 6 then 1 else 0 end) "Offline/online"
from "DriverReportLogs" r
inner join "Users" u on r."DriverId" = u."Id"
where "ReportId" is null and r."Time">='2025-10-17 00:00:00.000000 +04:00' and r."IsSuccess";



select * from  "DriverReportLogs" r
where r."CompanyEventTriggerId" = 2
order by "Id" desc


select * from "CompanyEventTriggers";

select * from "Reports";

select o."DateTime" + interval '1 hour' * 4 as time, u."UserName", a."Name", o."AddInfo"
from "Orders" o
inner join "Users" u on o."DriverId" = u."Id"
inner join "Aggregators" a on a."Id" = o."AggregatorId"
where u."CompanyId" = 2
  --and "AddInfo" not like '%client cancelled%'
              and "OrderStatusId" = 6
              order by o."DateTime" desc;

select * from "OrderStatuses"

select * from "Companies"

select * from "Users" where "Role" != 0 order by "Id"