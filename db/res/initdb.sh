#!/bin/sh
echo "Restoring database..."
psql -U postgres -a -f initdb.sql;
psql -U fa -d fullaux -a -f location.sql;
echo "Success!"