FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx supervisor bash
RUN apk add php8 php8-fpm php8-json php8-gd php8-curl php8-mysqli php8-zlib php8-opcache php8-session php8-common php8-iconv php8-xml php8-imap php8-cgi php8-pdo php8-pdo_mysql php8-soap php8-posix php8-gettext php8-ldap php8-ctype php8-dom php8-mbstring php8-phar --repository http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz ; tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz ; rm phpMyAdmin-5.0.4-all-languages.tar.gz ; mv phpMyAdmin-5.0.4-all-languages /var/www/phpmyadmin

COPY config.inc.php /var/www/phpmyadmin/
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisor.conf /etc/supervisor.conf
COPY php.sh /
RUN chmod +x php.sh

RUN mkdir -p /run/nginx /run/php

RUN chmod 777 /var/www/phpmyadmin

EXPOSE 5000

CMD [ "./php.sh" ]
