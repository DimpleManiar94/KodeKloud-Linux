#!/bin/bash

import_database_dump() {
  mysql kodekloud_db01 < /opt/db_backups/db.sql
  echo "imported database dump into kodekloud_db01 database."
}

if mysql -e "SHOW DATABASES" | grep -q kodekloud_db01; then
  echo "Database already exists"
  if mysql -e "SHOW TABLES FROM kodekloud_db01" | wc -l > 0; then
    echo "database is not empty"
  else
    import_database_dump
  fi
else
  mysql -e "CREATE DATABASE kodekloud_db01"
  echo "Database kodekloud_db01 has been created"
  import_database_dump
fi

mysql -e "CREATE USER IF NOT EXISTS 'kodekloud_roy'@'%' IDENTIFIED BY 'asdfgdsd'"
mysql -e "GRANT ALL PRIVILEGES ON kodekloud_db01.* to 'kodekloud_roy'@'%'"

mysql kodekloud_db01 > /opt/db_backups/kodekloud_db01.sql
mysql -e "FLUSH PRIVILEGES"