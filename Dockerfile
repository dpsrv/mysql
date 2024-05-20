FROM mysql:latest

RUN microdnf install -y bind-utils

COPY replication /opt/replication

CMD [ "mysqld", "--mysql-native-password=ON" ]
