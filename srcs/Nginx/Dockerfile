FROM alpine:latest

RUN apk update && apk upgrade 
RUN apk add nginx openssl openssh supervisor bash vsftpd

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisor.conf /etc/supervisor.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj \
"/C=RU/ST=Kazan/L=Kazan/O=School21/OU=kcaraway/CN=my_domain" \
-keyout /etc/ssl/private/kcaraway.key -out /etc/ssl/private/kcaraway.crt

EXPOSE 80 443 22

RUN adduser -D  "kcaraway"
RUN echo "kcaraway:qwerty12345" | chpasswd

RUN sed -i "s/#Port 22/Port 22/g" /etc/ssh/sshd_config ;\
sed -i "s/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/g" /etc/ssh/sshd_config ;\
sed -i "s/#HostKey \/etc\/ssh\/ssh_host_ecdsa_key/HostKey \/etc\/ssh\/ssh_host_ecdsa_key/g" /etc/ssh/sshd_config ;\
sed -i "s/#HostKey \/etc\/ssh\/ssh_host_ed25519_key/HostKey \/etc\/ssh\/ssh_host_ed25519_key/g" /etc/ssh/sshd_config
# sed -i 's/#HostKey \/etc\/ssh\/ssh_host_dsa_key/HostKey \/etc\/ssh\/ssh_host_dsa_key/g' /etc/ssh/sshd_config ;\

RUN ssh-keygen -A ; ssh-keygen -t rsa -b 4096 -f /etc/ssh/ssh_host_key

COPY ./start_nginx.sh /
RUN chmod +x /start_nginx.sh

RUN mkdir -p /run/nginx

# CMD [ "bash" ]
CMD ["/start_nginx.sh"]

