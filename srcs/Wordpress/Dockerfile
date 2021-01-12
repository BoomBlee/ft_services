FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx supervisor bash
RUN apk add php8 php8-fpm php8-json php8-gd php8-curl php8-mysqli php8-zlib php8-opcache php8-session php8-common php8-iconv php8-xml php8-imap php8-cgi php8-pdo php8-pdo_mysql php8-soap php8-posix php8-gettext php8-ldap php8-ctype php8-dom php8-mbstring php8-phar --repository http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN mkdir -p /run/nginx /run/php

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisor.conf /etc/supervisor.conf
COPY ./wordpress.sh /

RUN chmod +x /wordpress.sh

RUN wget http://wordpress.org/latest.tar.gz ; tar -xzvf latest.tar.gz ; rm latest.tar.gz ; mv wordpress /var/www/
COPY ./wp-config.php /var/www/wordpress/
# RUN chmod 755 -R /var/www/wordpress/*
RUN chmod 755 -R /var/www/*


# RUN adduser -D  "www"
# RUN chown -R www:www /var/www/wordpress
# RUN echo "w:qwerty12345" | chpasswd


EXPOSE 5050

# CMD [ "bash" ]
CMD [ "./wordpress.sh" ]