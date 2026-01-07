\connect kota0724
ALTER EXTENSION "pg_stat_statements" UPDATE;
\encoding SQL_ASCII
\connect -reuse-previous=on "dbname='ckn21-db'"
ALTER EXTENSION "pg_stat_statements" UPDATE;
\encoding SQL_ASCII
\connect -reuse-previous=on "dbname='prod-25db'"
ALTER EXTENSION "pg_stat_statements" UPDATE;
\encoding SQL_ASCII
\connect -reuse-previous=on "dbname='prod25-db'"
ALTER EXTENSION "pg_stat_statements" UPDATE;
\encoding SQL_ASCII
\connect -reuse-previous=on "dbname='kcr25prd-v1'"
ALTER EXTENSION "pg_stat_statements" UPDATE;
\encoding SQL_ASCII
\connect -reuse-previous=on "dbname='kcr25prd-v2'"
ALTER EXTENSION "pg_stat_statements" UPDATE;
\encoding SQL_ASCII
\connect -reuse-previous=on "dbname='anis-prd-pg25'"
ALTER EXTENSION "pg_stat_statements" UPDATE;
\encoding SQL_ASCII
\connect -reuse-previous=on "dbname='kcr-waba201025'"
ALTER EXTENSION "pg_stat_statements" UPDATE;
\encoding SQL_ASCII
\connect -reuse-previous=on "dbname='kcr-waba201025-1'"
ALTER EXTENSION "pg_stat_statements" UPDATE;
\encoding SQL_ASCII
\connect -reuse-previous=on "dbname='kcr-prd-pg2'"
ALTER EXTENSION "pg_stat_statements" UPDATE;
