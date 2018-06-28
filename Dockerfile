FROM lsiobase/ubuntu:bionic
LABEL MAINTAINER 'Sam Burney <sam@burney.io>'

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt -y install apache2 libapache2-mod-php php-mysql git && apt clean

RUN rm -r /etc/cont-init.d \
    && rm -r /var/www/html \
    && ln -s /var/www/speedtest /var/www/html
COPY ./docker/root/ /

EXPOSE 80/tcp

ENTRYPOINT [ "/init" ]
