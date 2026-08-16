select * from "__EFMigrationsHistory" order by "MigrationId" desc





GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES    IN SCHEMA public TO limousine;
GRANT USAGE,  SELECT                 ON ALL SEQUENCES IN SCHEMA public TO limousine;

-- Чтобы это не повторялось на каждой будущей миграции:
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public
  GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO limousine;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public
  GRANT USAGE, SELECT ON SEQUENCES TO limousine;

-- Контроль: granted == total.
SELECT count(*) FILTER (WHERE has_table_privilege('limousine', quote_ident(tablename), 'SELECT')) AS granted,
       count(*) AS total
FROM pg_tables WHERE schemaname = 'public';