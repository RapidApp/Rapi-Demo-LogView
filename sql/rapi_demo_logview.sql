--------------------------------------------------------------------------------
--   *** sql/rapi_demo_logview.sql  --  DO NOT MOVE OR RENAME THIS FILE ***
-- 
-- Add your DDL here (i.e. CREATE TABLE statements)
-- 
-- To (re)initialize your SQLite database (rapi_demo_logview.db) and (re)generate
-- your DBIC schema classes and update your base TableSpec configs, run this command
-- from your app home directory:
-- 
--    perl devel/model_DB_updater.pl --from-ddl --cfg
-- 
--------------------------------------------------------------------------------

CREATE TABLE [request_log] (
  [id]         INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  [host]       varchar,
  [ident]      varchar,
  [authuser]   varchar,
  [date]       varchar,
  [request]    varchar,
  [status]     varchar,
  [bytes]      varchar,
  [referer]    varchar,
  [useragent]  varchar
);












