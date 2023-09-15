#!/bin/bash -e

. ../rc/secrets/mysql/mysql.env

docker exec -it mysql mysql -h localhost -u root -p$MYSQL_ROOT_PASSWORD mysql "$@"
