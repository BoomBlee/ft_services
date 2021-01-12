FROM alpine:latest

RUN apk update && apk upgrade 
RUN apk add supervisor bash

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk ; apk add glibc-2.28-r0.apk ; rm glibc-2.28-r0.apk

# InfluxDB
RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.3-static_linux_amd64.tar.gz ; tar xvfz influxdb-1.8.3-static_linux_amd64.tar.gz ; rm influxdb-1.8.3-static_linux_amd64.tar.gz ;ls; mv influxdb-1.8.3-1 /influxdb

# Telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz ; tar xf telegraf-1.17.0_linux_amd64.tar.gz ; rm telegraf-1.17.0_linux_amd64.tar.gz ; mv telegraf-1.17.0 /telegraf


RUN ./telegraf/usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /telegraf/etc/telegraf/telegraf.conf

COPY ./start_influxdb.sh /
COPY supervisor.conf /etc/supervisor.conf

RUN chmod +x start_influxdb.sh

VOLUME [ "/var/lib/influxdb" ]

EXPOSE 8086

# CMD [ "bash" ]
CMD [ "./start_influxdb.sh" ]