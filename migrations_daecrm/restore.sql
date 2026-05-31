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
