-- Скрипт для восстановления всех последовательностей после pg_restore
-- Выполните после восстановления БД, если есть ошибки setval

DO $$
DECLARE
    seq_record RECORD;
    max_id    bigint;
    schema_nm text;
BEGIN
    -- Проходим по всем последовательностям в схеме public
    FOR seq_record IN
        SELECT
            s.schemaname,
            s.sequencename,
            t.tablename,
            c.relkind
        FROM pg_sequences s
        LEFT JOIN pg_class c ON c.relname = s.sequencename
        LEFT JOIN pg_tables t ON s.sequencename like t.tablename || '%_seq'
        WHERE s.schemaname = 'public'
        and t.tablename is not null
    LOOP
        schema_nm := seq_record.schemaname;

        -- Пытаемся найти максимальный ID в связанной таблице
       -- BEGIN
            EXECUTE format(
                'SELECT COALESCE(MAX("Id"), 0) FROM %I.%I',
                seq_record.schemaname,
                seq_record.tablename
            ) INTO max_id;

            -- Устанавливаем значение последовательности на max_id + 1
            EXECUTE format(
                'SELECT setval(%L, %L, false)',
                format('%I.%I', schema_nm, seq_record.sequencename),
                max_id + 1
            );

            RAISE NOTICE 'Обновлена последовательность %.%: значение %',
                schema_nm, seq_record.sequencename, max_id + 1;
       /* EXCEPTION
            WHEN OTHERS THEN
                -- Если таблица не найдена или пустая, ставим MINVALUE
                BEGIN
                    EXECUTE format(
                        'SELECT setval(%L, 1, false)',
                        format('%I.%I', schema_nm, seq_record.sequencename)
                    );
                    RAISE NOTICE 'Последовательность %.% установлена на 1 (таблица не найдена/пустая)',
                        schema_nm, seq_record.sequencename;
                END;
        END;*/
    END LOOP;
END $$;



SELECT
            s.schemaname,
            s.sequencename,
            t.tablename,
            c.relkind
        FROM pg_sequences s
        LEFT JOIN pg_class c ON c.relname = s.sequencename
        LEFT JOIN pg_tables t ON s.sequencename like t.tablename || '%_seq'
        WHERE s.schemaname = 'public'
        and t.tablename is null


SELECT setval('public."CabmanTrip_Id_seq"', COALESCE(MAX("Id"), 1)) FROM "CabmanTrips";
SELECT setval('public."CarModel_Id_seq"', COALESCE(MAX("Id"), 1)) FROM "CarModels";
SELECT setval('public."CareemCar_Id_seq"', COALESCE(MAX("Id"), 1)) FROM "CareemCars";



SELECT *
        FROM pg_sequences
        WHERE schemaname = 'public'