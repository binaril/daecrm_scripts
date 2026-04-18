
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