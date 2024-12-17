FROM mysql:8.4.3

RUN microdnf install -y bind-utils

COPY replication /opt/replication

CMD [ "mysqld", "--mysql-native-password=ON", "--log-error-verbosity=3" ]
