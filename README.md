FusionDirectory Docker Container
================================

A docker image for [Fusiondirectory](http://fusiondirectory.org), a
powerful web interface in front of Directory using LDAP v3 protocol.

How to use
----------

This docker image needs an LDAP server which contains
Fusiondirectory's LDAP schemas. You can use
[mcreations/fusiondirectory-ldap](https://hub.docker.com/r/mcreations/fusiondirectory-ldap)
which keeps the persistent data in a Docker volume at `/data`.

```
docker run -d --name ldap -e LDAP_DOMAIN=example.com -e LDAP_ROOTPW=secret -h ldapsrv.example.com mcreations/fusiondirectory-ldap
```

Now you can run this container with a link to that LDAP server, named `ldap-server`:

```
docker run -d -p 12080:80 -e LDAP_DOMAIN=example.com -e LDAP_ROOTPW=secret -e LDAP_ROOTDN="cn=Manager,dc=example,dc=com" --link ldap:ldap-server --rm -it mcreations/fusiondirectory
```

Now open http://localhost:12080 and login as `fd-admin` using `LDAP_ROOTPW` as password.

Connection variables
--------------------

These environment variables are used to connect to the LDAP server:

* `LDAP_HOST`: ldap server (default: `ldap-server`)
* `LDAP_PORT`: tcp port on ldap server (default: `389`)
* `LDAP_SERVER_URL`: combination of protocol, host, and port (default: `ldap://${LDAP_HOST}:${LDAP_PORT}`)
* `LDAP_DOMAIN`: LDAP domain (default: `example.com`)
* `LDAP_ROOTDN` - the ROOT DN of ldap server default is: `cn=Manager,@SUFFIX@`)
* `LDAP_ROOTPW` - The ROOT password of the ROOTDN of LDAP server

Web Service Access
------------------

For programmatic access to the FusionDirectory functionality, you can
use the [FusionDirectory web service](http://documentation.fusiondirectory.org/en/documentation/plugin/webservice_plugin).


Github Repo
-----------

https://github.com/m-creations/docker-fusiondirectory
