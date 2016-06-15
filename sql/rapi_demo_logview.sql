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
INSERT INTO [http_status] VALUES (100,'Continue');
INSERT INTO [http_status] VALUES (101,'Switching Protocols');
INSERT INTO [http_status] VALUES (102,'Processing');
INSERT INTO [http_status] VALUES (103,'Checkpoint');
INSERT INTO [http_status] VALUES (200,'OK');
INSERT INTO [http_status] VALUES (201,'Created');
INSERT INTO [http_status] VALUES (202,'Accepted');
INSERT INTO [http_status] VALUES (203,'Non-Authoritative Information');
INSERT INTO [http_status] VALUES (204,'No Content');
INSERT INTO [http_status] VALUES (205,'Reset Content');
INSERT INTO [http_status] VALUES (206,'Partial Content');
INSERT INTO [http_status] VALUES (207,'Multi-Status (WebDAV)');
INSERT INTO [http_status] VALUES (208,'Already Reported (WebDAV)');
INSERT INTO [http_status] VALUES (301,'Moved Permanently');
INSERT INTO [http_status] VALUES (302,'Found');
INSERT INTO [http_status] VALUES (304,'Not Modified');
INSERT INTO [http_status] VALUES (307,'Temporary Redirect');
INSERT INTO [http_status] VALUES (400,'Bad Request');
INSERT INTO [http_status] VALUES (401,'Unauthorized');
INSERT INTO [http_status] VALUES (403,'Forbidden');
INSERT INTO [http_status] VALUES (404,'Not Found');
INSERT INTO [http_status] VALUES (500,'Internal Server Error');

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












