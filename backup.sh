#!/bin/sh
HOSTNAME='localhost'
MYSQLUSER='root'
MYSQLPASS='password'
for DB in $(mysql -h $HOSTNAME -u $MYSQLUSER --password=${MYSQLPASS} --batch --skip-column-names --execute="show databases");
do
    FILENAME=${HOSTNAME}_Database_${DB}.sql
    mysqldump $DB -h $HOSTNAME -u $MYSQLUSER --password=${MYSQLPASS} --triggers --routines  > $FILENAME
done
