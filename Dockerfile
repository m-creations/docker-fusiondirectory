## -*- docker-image-name: "mcreations/fusiondirectory" -*-

FROM rezarahimi/debian-fusiondirectory
MAINTAINER Reza Rahimi <rahimi@m-creations.net>

ENV LDAP_PORT 389
ENV LDAP_HOST ldap-server
ENV LDAP_SERVER_URL ldap://${LDAP_HOST}:${LDAP_PORT}
ENV FUSIONDIRECTORY_VERSION 1.0.8.2
ENV FUSIONDIRECTORY_DEB_PKG_VERSION 1.0.8.2-5+deb8u1
ENV LDAP_ROOT Manager

ADD image/root/ /

RUN wget -O /tmp/jsonrpcphp.tgz --progress=dot "http://www.jsonrpcphp.org/download.php?file=tgz&package=ligh" && \
    tar -xvzf /tmp/jsonrpcphp.tgz -C /tmp && \
    mkdir -p /usr/share/fusiondirectory/include/jsonrpcphp/ && \
    cp -rf /tmp/jsonrpcphp/includes/* /usr/share/fusiondirectory/include/jsonrpcphp/ && \
    a2dissite 000-default && \
    a2disconf fusiondirectory && \
    a2ensite fusiondirectory

EXPOSE 80

CMD ["/start-fd"]
