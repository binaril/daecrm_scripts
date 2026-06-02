
  -- ================================================================
  -- ШАГ 1: ПРЕДПРОСМОТР — что будем реверсировать
  -- ================================================================
  SELECT
      t."Id",
      t."DateTime",
      t."Amount",
      -t."Amount" AS "ReversalAmount",
      t."CompanyId",
      t."DriverId",
      t."OrderId",
      oo."Id" AS "OfficeOrderId",
      t."Description"
  FROM "Transactions" t
  JOIN "Orders" o       ON o."Id" = t."OrderId"
  JOIN "OfficeOrders" oo ON oo."Id"::text = o."AggregatorOrderId"
  WHERE
      t."TransactionTypeId" = 42          -- COMPANY_FEE
      AND t."AggregatorId"  = 3           -- OFFICE
      AND t."IsCancelled"   = false
      AND t."DateTime"      >=  '2026-05-01 00:00:00+00'
      AND oo."IsCash"       = true
  ORDER BY t."DateTime";


  -- ================================================================
  -- ШАГ 2: СОЗДАЁМ РЕВЕРСНЫЕ ТРАНЗАКЦИИ (IsHandled=false)
  -- Фоновый джоб подхватит их через AggrFeeSummary и компенсирует
  -- CashBoxSummary и AggrSummary автоматически
  -- ================================================================
  INSERT INTO "Transactions" (
      "DateTime", "CompanyId", "TransactionTypeId", "Description",
      "AggregatorCategory", "Amount", "DriverId", "CarId",
      "AggregatorId", "AggregatorDriverId", "OrderId",
      "AddingCashBoxId", "WithdrawalCashBoxId",
      "CreatedTime", "IsHandled", "AggregatorTransactionId",
      "PurposeId", "CounterpartyId", "IsCorrection", "IsCancelled", "PosTerminalId"
  )
  SELECT
      t."DateTime",
      t."CompanyId",
      t."TransactionTypeId",
      'Cancelled. ' || t."Description",
      t."AggregatorCategory",
      -t."Amount",                        -- противоположный знак
      t."DriverId",
      t."CarId",
      t."AggregatorId",
      t."AggregatorDriverId",
      t."OrderId",
      t."AddingCashBoxId",
      t."WithdrawalCashBoxId",
      NOW() AT TIME ZONE 'UTC',
      false,                              -- IsHandled=false → джоб обработает
      t."AggregatorTransactionId",
      t."PurposeId",
      t."CounterpartyId",
      true,                               -- IsCorrection=true
      false,
      t."PosTerminalId"
  FROM "Transactions" t
  JOIN "Orders" o       ON o."Id" = t."OrderId"
  JOIN "OfficeOrders" oo ON oo."Id"::text = o."AggregatorOrderId"
  WHERE
      t."TransactionTypeId" = 42
      AND t."AggregatorId"  = 3
      AND t."IsCancelled"   = false
      AND t."DateTime"      >= '2026-05-01 00:00:00+00'
      AND oo."IsCash"       = true;

  -- ================================================================
  -- ШАГ 3: ПРОВЕРКА — убедиться что джоб обработал все реверсные
  -- Должно вернуть 0 строк перед запуском шага 4
  -- ================================================================
  SELECT t."Id", t."IsHandled", t."IsCorrection", t."Amount"
  FROM "Transactions" t
  JOIN "Orders" o       ON o."Id" = t."OrderId"
  JOIN "OfficeOrders" oo ON oo."Id"::text = o."AggregatorOrderId"
  WHERE
      t."TransactionTypeId" = 42
      AND t."AggregatorId"  = 3
      AND t."DateTime"      >= '2026-05-01 00:00:00+00'
      AND oo."IsCash"       = true
      AND t."IsCancelled"   = false
      AND t."IsHandled"     = false;      -- ждём пока это станет 0


  -- ================================================================
  -- ШАГ 4: СКРЫТЬ ИЗ ОТЧЁТОВ — помечаем оригиналы и реверсные как отменённые
  -- Запускать ТОЛЬКО когда шаг 3 вернул 0 строк
  -- ================================================================
  UPDATE "Transactions" t
  SET
      "IsCancelled"   = true,
      "CancelledTime" = NOW() AT TIME ZONE 'UTC'
  FROM "Orders" o
  JOIN "OfficeOrders" oo ON oo."Id"::text = o."AggregatorOrderId"
  WHERE
      t."OrderId"           = o."Id"
      AND t."TransactionTypeId" = 42
      AND t."AggregatorId"      = 3
      AND t."DateTime"          >= '2026-05-01 00:00:00+00'
      AND oo."IsCash"           = true
      AND t."IsCancelled"       = false
      AND t."IsHandled"         = true;   -- только обработанные

