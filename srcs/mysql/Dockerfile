FROM alpine:latest

RUN apk update && apk upgrade 
RUN apk add mariadb mariadb-client mysql mysql-client openrc bash

VOLUME [ "/var/lib/mysql" ]
VOLUME [ "/sys/fs/cgroup" ]

COPY ./start_mysql.sh /
COPY my.cnf /etc/mysql/my.cnf
COPY wordpress3user.sql /

RUN chmod +x /etc/mysql/my.cnf
RUN chmod +x /start_mysql.sh

EXPOSE 3306

# CMD [ "bash" ]
CMD [ "./start_mysql.sh" ]