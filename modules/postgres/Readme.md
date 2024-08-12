to provide user access to single DB:
su===>postgres/admin

CREATE DATABASE <database_name>;

REVOKE CONNECT ON DATABASE <database_name> FROM PUBLIC;

CREATE USER <username> WITH ENCRYPTED PASSWORD '<password>';

GRANT ALL PRIVILEGES ON DATABASE <database_name> TO <username>;

\c <database_name>

# You are now connected to database "<database_name>" as user "<username>".

GRANT ALL ON SCHEMA public TO <username>;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO your_user;

 GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO your_user;


 # IF i have created one DB and want to give ACcess of DB
 GRANT ALL PRIVILEGES ON DATABASE pg_db TO rashesh;