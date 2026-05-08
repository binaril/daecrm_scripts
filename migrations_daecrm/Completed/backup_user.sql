
CREATE ROLE dbbackup_role LOGIN PASSWORD 'strong_password';
GRANT CONNECT ON DATABASE daecrm TO limousine;
GRANT CONNECT ON DATABASE wiki TO dbbackup_role;
GRANT CONNECT ON DATABASE taximeter TO dbbackup_role;
GRANT USAGE ON SCHEMA public TO dbbackup_role;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO dbbackup_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT SELECT ON TABLES TO dbbackup_role;


GRANT SELECT ON ALL TABLES IN SCHEMA имя_схемы TO имя_пользователя;

vacuum FULL "Logs"




GRANT SELECT, INSERT, DELETE, UPDATE ON ALL TABLES IN SCHEMA public TO limousine;


select * from "Users" where "CompanyId"=2 and ("LastName" like '%Ibrahim%' or "FirstName" like '%Ibrahim%')



INSERT INTO public."TriggerRules" ("Id", "CompanyId", "Name", "Description", "ConditionJson", "MessageTemplate", "CooldownSeconds", "AllowWhatsapp", "AllowTelegram", "AllowPortal", "Disabled", "Deleted", "CreatedTime", "ModifiedTime", "SustainedForSeconds") VALUES (24, 2, 'Онлайн без заказов', null, e'{
  "operator": "AND",
  "rules": [
    { "fact": "driver.aggregators.onlineCount", "op": "gte", "value": 1 },
    { "fact": "driver.aggregators.onTripCount",      "op": "eq",  "value": 0 }
  ]
}', 'Водитель {{DriverName}}: машина {{CarName}} онлайн без заказа (60 мин)', 3600, false, false, true, false, false, '2026-04-20 19:30:12.344846 +00:00', '2026-04-20 19:30:12.344846 +00:00', 3600);
INSERT INTO public."TriggerRules" ("Id", "CompanyId", "Name", "Description", "ConditionJson", "MessageTemplate", "CooldownSeconds", "AllowWhatsapp", "AllowTelegram", "AllowPortal", "Disabled", "Deleted", "CreatedTime", "ModifiedTime", "SustainedForSeconds") VALUES (17, 2, '‼️Поездка без заказа в системе', null, '{"operator":"AND","rules":[{"fact":"driver.aggregators.onTripCount","op":"eq","value":0},{"fact":"car.seatSensor","op":"eq","value":true}]}', 'Водитель {{DriverName}}: машина {{CarName}} поездка без заказов в системах (датчик сидения активен)', 1800, false, true, true, false, false, '2026-04-20 19:28:10.215589 +00:00', '2026-04-20 19:28:10.215589 +00:00', 300);
INSERT INTO public."TriggerRules" ("Id", "CompanyId", "Name", "Description", "ConditionJson", "MessageTemplate", "CooldownSeconds", "AllowWhatsapp", "AllowTelegram", "AllowPortal", "Disabled", "Deleted", "CreatedTime", "ModifiedTime", "SustainedForSeconds") VALUES (26, 2, 'Водитель заблокирован', null, '{ "fact": "driver.isBlocked", "op": "eq", "value": true }', 'Водитель {{DriverName}}: машина {{CarName}} заблокирован агрегатором {{"BlockedOrderAggregator"}}', 3600, false, true, true, false, false, '2026-04-20 19:27:22.060629 +00:00', '2026-04-20 19:27:22.060629 +00:00', 0);
INSERT INTO public."TriggerRules" ("Id", "CompanyId", "Name", "Description", "ConditionJson", "MessageTemplate", "CooldownSeconds", "AllowWhatsapp", "AllowTelegram", "AllowPortal", "Disabled", "Deleted", "CreatedTime", "ModifiedTime", "SustainedForSeconds") VALUES (25, 2, 'Пробег без заказов', null, e'{
  "operator": "AND",
  "rules": [
    { "fact": "car.sessionMileage",        "op": "gt", "value": 20 },
    { "fact": "driver.activeOrders.count", "op": "eq", "value": 0 }
  ]
}', 'Водитель {{DriverName}}: машина {{CarName}} пробег без заказа', 3600, false, true, true, true, false, '2026-04-20 19:27:22.060629 +00:00', '2026-04-20 19:27:22.060629 +00:00', 1200);
INSERT INTO public."TriggerRules" ("Id", "CompanyId", "Name", "Description", "ConditionJson", "MessageTemplate", "CooldownSeconds", "AllowWhatsapp", "AllowTelegram", "AllowPortal", "Disabled", "Deleted", "CreatedTime", "ModifiedTime", "SustainedForSeconds") VALUES (16, 2, 'Машина заведена без агрегаторов', null, '{"operator":"AND","rules":[{"fact":"car.ignition","op":"eq","value":true},{"fact":"driver.aggregators.onlineCount","op":"lte","value":1}, { "fact": "driver.aggregators.onTripCount",      "op": "eq",  "value": 0 }]}', 'Водитель {{DriverName}}: машина {{CarName}} заведена 10+ мин, активных агрегаторов ≤1', 43200, false, true, true, false, false, '2026-04-20 19:27:22.060629 +00:00', '2026-04-20 19:27:22.060629 +00:00', 600);
INSERT INTO public."TriggerRules" ("Id", "CompanyId", "Name", "Description", "ConditionJson", "MessageTemplate", "CooldownSeconds", "AllowWhatsapp", "AllowTelegram", "AllowPortal", "Disabled", "Deleted", "CreatedTime", "ModifiedTime", "SustainedForSeconds") VALUES (18, 2, 'Мало агрегаторов при заведённой машине', null, '{"operator":"AND","rules":[{"fact":"car.ignition","op":"eq","value":true},{"fact":"driver.aggregators.onlineCount","op":"lt","value":2}, { "fact": "driver.aggregators.onTripCount",      "op": "eq",  "value": 0 }]}', 'Водитель {{DriverName}}: машина {{CarName}} мало агрегаторов при заведённой машине (20 мин)', 1200, false, true, true, false, false, '2026-04-20 19:30:12.344846 +00:00', '2026-04-20 19:30:12.344846 +00:00', 1200);
INSERT INTO public."TriggerRules" ("Id", "CompanyId", "Name", "Description", "ConditionJson", "MessageTemplate", "CooldownSeconds", "AllowWhatsapp", "AllowTelegram", "AllowPortal", "Disabled", "Deleted", "CreatedTime", "ModifiedTime", "SustainedForSeconds") VALUES (27, 2, 'Отмена заказа', null, '{ "fact": "driver.orderCancelled", "op": "eq", "value": true }', 'Водитель {{DriverName}}: машина {{CarName}} отменил заказ в {{CancelledOrderAggregator}}', 300, false, true, true, false, false, '2026-04-20 19:27:22.060629 +00:00', '2026-04-20 19:27:22.060629 +00:00', 0);
