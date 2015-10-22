## -*- docker-image-name: "mcreations/fusiondirectory" -*-

FROM debian:jessie
MAINTAINER Reza Rahimi <rahimi@m-creations.net>

ENV LDAP_PORT 389
ENV LDAP_HOST ldap-server
ENV LDAP_SERVER_URL ldap://${LDAP_HOST}:${LDAP_PORT}
ENV FUSIONDIRECTORY_VERSION 1.0.8.2
ENV FUSIONDIRECTORY_DEB_PKG_VERSION 1.0.8.2-5+deb8u1

ADD image/root/ /

RUN apt-get update && \
    apt-get install -y apache2 php5 php-pear php-mdb2 fusiondirectory=${FUSIONDIRECTORY_DEB_PKG_VERSION} fusiondirectory-plugin-mail=${FUSIONDIRECTORY_DEB_PKG_VERSION} vim && \
    a2dissite 000-default && \
    a2disconf fusiondirectory && \
    a2ensite fusiondirectory

EXPOSE 80

CMD ["/start-fd"]