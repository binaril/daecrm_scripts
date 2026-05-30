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


GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO limousine;


SELECT setval('public."UserSessions_Id_seq"', COALESCE(MAX("Id"), 1)) FROM "UserSessions";


select *
from "UserSessions" order by "Id" desc;



 -- Сбросить все sequence в соответствие с реальными данными
  DO $$
  DECLARE
      r RECORD;
  BEGIN
      FOR r IN
          SELECT
              seq.relname AS seq_name,
              tbl.relname AS tbl_name,
              col.attname AS col_name
          FROM pg_class seq
          JOIN pg_depend dep ON dep.objid = seq.oid
          JOIN pg_class tbl ON tbl.oid = dep.refobjid
          JOIN pg_attribute col ON col.attrelid = tbl.oid AND col.attnum = dep.refobjsubid
          WHERE seq.relkind = 'S'
      LOOP
          EXECUTE format(
              'SELECT setval("%L", COALESCE((SELECT MAX("%I") FROM "%I"), 1))',
              r.seq_name, r.col_name, r.tbl_name
          );
      END LOOP;
  END $$;



  DO $$
  DECLARE
      r RECORD;
  BEGIN
      FOR r IN
          SELECT
              seq.oid      AS seq_oid,
              tbl.relname  AS tbl_name,
              col.attname  AS col_name
          FROM pg_class seq
          JOIN pg_depend dep ON dep.objid = seq.oid
          JOIN pg_class tbl ON tbl.oid = dep.refobjid
          JOIN pg_attribute col
               ON col.attrelid = tbl.oid AND col.attnum = dep.refobjsubid
          WHERE seq.relkind = 'S'
      LOOP
          EXECUTE format(
              'SELECT setval(%s, COALESCE((SELECT MAX(%I) FROM %I), 0) + 1, false)',
              r.seq_oid,    -- OID — числовой, кавычки и регистр не нужны
              r.col_name,   -- %I → "ColName" автоматически
              r.tbl_name    -- %I → "TableName" автоматически
          );
      END LOOP;
  END $$;



 -- Посмотреть реальное имя sequence для UserSessions
  SELECT relname FROM pg_class WHERE relkind = 'S' AND relname ILIKE '%usersession%';

  -- Сравнить max Id и текущее значение sequence
  SELECT MAX("Id") FROM "UserSessions";
  SELECT last_value, is_called FROM "UserSessions_Id_seq";

SELECT column_name, column_default, is_identity
  FROM information_schema.columns
  WHERE table_name = 'UserSessions' AND column_name = 'Id';


 DO $$
  DECLARE
      r RECORD;
      max_id bigint;
  BEGIN
      FOR r IN
          SELECT table_name, column_name
          FROM information_schema.columns
          WHERE is_identity = 'YES' AND table_schema = 'public'
      LOOP
          EXECUTE format(
              'SELECT COALESCE(MAX(%I), 0) + 1 FROM %I',
              r.column_name, r.table_name
          ) INTO max_id;

          EXECUTE format(
              'ALTER TABLE %I ALTER COLUMN %I RESTART WITH %s',
              r.table_name, r.column_name, max_id
          );

          RAISE NOTICE 'RESTART %.% WITH %', r.table_name, r.column_name, max_id;
      END LOOP;
  END $$;
