select * from "__EFMigrationsHistory" order by "MigrationId" desc





GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES    IN SCHEMA public TO limousine;
GRANT USAGE,  SELECT                 ON ALL SEQUENCES IN SCHEMA public TO limousine;

-- Чтобы это не повторялось на каждой будущей миграции:
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public
  GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO limousine;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public
  GRANT USAGE, SELECT ON SEQUENCES TO limousine;

select * from "Companies"

-- Контроль: granted == total.
SELECT count(*) FILTER (WHERE has_table_privilege('limousine', quote_ident(tablename), 'SELECT')) AS granted,
       count(*) AS total
FROM pg_tables WHERE schemaname = 'public';



  select relname, n_live_tup, seq_scan, idx_scan, n_tup_ins, n_tup_upd, n_tup_del,
         last_seq_scan, last_idx_scan
  from pg_stat_user_tables
  where relname in ('UserCompanyGrants','CompanyRoleAccesses');