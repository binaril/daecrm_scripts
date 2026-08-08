select * from "__EFMigrationsHistory" order by "MigrationId" desc

--у
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO limousine;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO limousine;

-- чтобы это не повторялось на следующей миграции:
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public
  GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO limousine;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public
  GRANT USAGE, SELECT ON SEQUENCES TO limousine;