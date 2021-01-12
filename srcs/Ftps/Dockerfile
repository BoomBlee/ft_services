FROM alpine:latest

RUN apk update && apk upgrade 
RUN apk add vsftpd openssl bash

EXPOSE 21

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=RU/ST=Kazan/L=Kazan/O=School21/OU=kcaraway/CN=my_domain" -keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem

RUN echo "root:root" | chpasswd

RUN mkdir -p /var/log/ftp ; touch /var/log/ftp/xferlog

COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]