fusiondirectory
===============
A docker image for Fusiondirectory's GUI.

How to use
----------
This docker image to run needs a LDAP server for which Fusiondirectory's LDAP schemas have been imported. Already m-creations prepaired one docker which support Fusiondirectory https://github.com/m-creations/docker-fusiondirectory-ldap on github for running it as a LDAP docker server:
```
mkdir ~/my-example.com
docker run --name ldap-server-fd -p 389:389 -e LDAP_DOMAIN=example.com -e LDAP_ROOTPW=secret -v ~/my-example.com:/var/openldap-data -h ldapsrv.example.com --rm -it mcreations/openwrt-ldap-fd
```
Now you can run a docker of Fusiondirectory GUI which has been linked with previous LDAP server with --link facility of docker as follows
```
docker run -p 12080:80 -e LDAP_DOMAIN=example.com -e LDAP_ROOTPW=secret --link ldap-server-fd:ldap-server --rm -it mcreations/debian-fusion-directory
```

Give it two env vars for connecting to LDAP server:

* `LDAP_DOMAIN`
* `LDAP_ROOTPW`

To check Fusiondirectory's GUI fo http://localhost:12080 in interet browser insice docker host.

Github Repo
-----------
https://github.com/m-creations/docker-fusiondirectory