## -*- docker-image-name: "mcreations/debian-fusiondirectory  " -*-

FROM debian:jessie
MAINTAINER Reza Rahimi <rahimi@m-creations.net>

ADD image/root/ /

RUN apt-get update && \
    apt-get install -y apache2 php5 php-pear php-mdb2 fusiondirectory fusiondirectory-plugin-mail vim && \
    a2dissite 000-default && \
    a2disconf fusiondirectory && \
    a2ensite fusiondirectory

EXPOSE 80

CMD ["/start-fd"]