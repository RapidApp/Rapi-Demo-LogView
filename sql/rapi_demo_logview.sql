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

CREATE TABLE [http_status] (
  [code] integer PRIMARY KEY NOT NULL,
  [description] varchar(255) NOT NULL
);

CREATE TABLE [request_log] (
  [id]         INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  [host]       varchar(15)   NOT NULL, -- IP Addresses
  [ident]      varchar,
  [authuser]   varchar,
  [date]       datetime      NOT NULL,
  [request]    varchar       NOT NULL,
  [status]     integer       NOT NULL, 
  [bytes]      integer,
  [referer]    varchar,
  [useragent]  varchar
);












