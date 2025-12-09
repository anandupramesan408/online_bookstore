#!/bin/bash
mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<EOF
$(cat /docker-entrypoint-initdb.d/db-init.sql)
EOF
