#!/bin/bash

# stop postgres
service postgresql stop

# copy configuration files
mv /var/lib/postgresql/9.3/main /var/lib/postgresql/9.3/master
mv /etc/postgresql/9.3/main /etc/postgresql/9.3/master
cp /setup/postgres/postgresql.conf.master /etc/postgresql/9.3/master/postgresql.conf
cp /setup/postgres/pg_hba.conf  /etc/postgresql/9.3/master/pg_hba.conf
cp /setup/postgres/pgbouncer.ini /etc/pgbouncer/
cp /setup/postgres/userlist.txt /etc/pgbouncer/
cp /setup/postgres/pgbouncer.default /etc/default/pgbouncer
chown -R postgres /etc/postgresql
chown -R postgres /etc/pgbouncer

# create the archiving and replica directories
mkdir /var/lib/postgresql/wal_archive
mkdir /var/lib/postgresql/9.3/replica1
mkdir /var/lib/postgresql/9.3/replica2
mkdir /etc/postgresql/9.3/replica1
mkdir /etc/postgresql/9.3/replica2
cp /setup/postgres/postgresql.conf.replica1 /etc/postgresql/9.3/replica1/postgresql.conf
cp /setup/postgres/pg_hba.conf /etc/postgresql/9.3/replica1/
cp /setup/postgres/postgresql.conf.replica2 /etc/postgresql/9.3/replica2/postgresql.conf
cp /setup/postgres/pg_hba.conf /etc/postgresql/9.3/replica2/
chown -R postgres /var/lib/postgresql/*
chown -R postgres /etc/postgresql/9.3/*
chmod 700 /var/lib/postgresql/9.3/replica1
chmod 700 /var/lib/postgresql/9.3/replica2

#link pg_ctl and friends
ln -s /usr/lib/postgresql/9.3/bin/pg_ctl /usr/bin/pg_ctl
ln -s /usr/lib/postgresql/9.3/bin/initdb /usr/bin/initdb
ln -s /usr/lib/postgresql/9.3/bin/pg_archivecleanup /usr/bin/pg_archivecleanup

# restart postgresql
su - postgres -c "/usr/bin/pg_ctl -D /etc/postgresql/9.3/master start"

# load the libdata database
psql -U postgres -f /setup/postgres/libdata.users.sql postgres
pg_restore -e -U postgres -d libdata /setup/postgres/libdata.dump

exit 0