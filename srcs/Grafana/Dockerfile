FROM alpine:latest

RUN apk update && apk upgrade 
RUN apk add bash ca-certificates
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk ; apk add glibc-2.28-r0.apk ; rm glibc-2.28-r0.apk

RUN wget https://dl.grafana.com/oss/release/grafana-7.3.6.linux-amd64.tar.gz ; tar -zxvf grafana-7.3.6.linux-amd64.tar.gz ; rm grafana-7.3.6.linux-amd64.tar.gz ; 

EXPOSE 3000
COPY ./grafana.db /grafana-7.3.6/data/grafana.db

WORKDIR /grafana-7.3.6/bin/
# CMD [ "bash" ]
CMD [ "./grafana-server" ]