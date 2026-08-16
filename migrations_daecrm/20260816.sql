-- ============================================================================
--  Схлопывание истории миграций: 355 миграций -> одна baseline.
--
--  Что произошло в коде: миграции с 20240113162451_initdb по
--  20260715154315_AddStartManuallyAnchoredToDriverCarChange удалены и заменены
--  одной миграцией 20260715154316_Baseline. Схема, которую она создаёт,
--  побайтово эквивалентна применению всех 355 удалённых миграций подряд
--  (её Up() — это SQL, сгенерированный из них же через `dotnet ef migrations script`).
--
--  Что нужно сделать с УЖЕ СУЩЕСТВУЮЩЕЙ базой: переписать __EFMigrationsHistory,
--  чтобы EF считал baseline применённой и не пытался выполнить её заново.
--  Саму схему трогать не нужно — она уже в нужном состоянии.
--
--  ВАЖНО: выполнять только на базе, которая УЖЕ прошла миграцию
--  20260715154315_AddStartManuallyAnchoredToDriverCarChange. Проверка ниже
--  сама остановит скрипт, если это не так.
--
--  Порядок выката:
--    1. Бэкап базы.
--    2. Выполнить этот скрипт (он в транзакции, при несоответствии — откат).
--    3. Выкатить новый код.
--    4. dotnet ef database update --project DaeTaxi.DAL.Migrations
--       (накатит только миграции после 20260715154315 — те, что не схлопывались).
-- ============================================================================

BEGIN;

DO $$
DECLARE
    v_applied  int;
    v_baseline int;
    v_deleted  int;
BEGIN
    -- Точка отсечения обязана быть применена — иначе схема базы старше baseline,
    -- и схлопнутых шагов эта база уже никогда не получит.
    SELECT count(*) INTO v_applied
    FROM "__EFMigrationsHistory"
    WHERE "MigrationId" = '20260715154315_AddStartManuallyAnchoredToDriverCarChange';

    IF v_applied = 0 THEN
        RAISE EXCEPTION
            'База не дошла до точки отсечения 20260715154315_AddStartManuallyAnchoredToDriverCarChange. '
            'Сначала накатите миграции СТАРЫМ кодом (до схлопывания), затем повторите.';
    END IF;

    SELECT count(*) INTO v_baseline
    FROM "__EFMigrationsHistory"
    WHERE "MigrationId" = '20260715154316_Baseline';

    IF v_baseline > 0 THEN
        RAISE NOTICE 'Baseline уже проставлен — скрипт был выполнен ранее, изменений не требуется.';
        RETURN;
    END IF;

    -- Сравниваем по первым 14 символам (timestamp фиксированной длины),
    -- чтобы длина имени миграции не влияла на лексикографический порядок.
    DELETE FROM "__EFMigrationsHistory"
    WHERE left("MigrationId", 14) <= '20260715154315';

    GET DIAGNOSTICS v_deleted = ROW_COUNT;

    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20260715154316_Baseline', '10.0.1');

    RAISE NOTICE 'История схлопнута: удалено % записей, проставлен 20260715154316_Baseline.', v_deleted;
END $$;

-- Контроль: должна остаться одна запись baseline и всё, что после точки отсечения.
SELECT "MigrationId"
FROM "__EFMigrationsHistory"
ORDER BY "MigrationId";

COMMIT;








