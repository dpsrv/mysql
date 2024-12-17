FROM mysql:9.1.0

RUN microdnf install -y bind-utils

COPY replication /opt/replication

CMD [ "mysqld", "--mysql-native-password=ON", "--innodb-use-native-aio=OFF", "--log-error-verbosity=3" ]
