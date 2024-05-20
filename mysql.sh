#!/bin/bash -e

. ../rc/secrets/mysql/mysql.env

CONTAINER_NAME=dpsrv-mysql-latest
docker exec -it $CONTAINER_NAME mysql -h localhost -u root -p$MYSQL_ROOT_PASSWORD mysql "$@"
