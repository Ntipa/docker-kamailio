# docker-kamailio
Kamailio SIP server docker image

This container run an instance of rtpproxy and kamailio to implement VoIP.
Kamailio avails of an external mysql db, one is available through another
docker image:

* `sudo rm -rf /opt/ntipa/mysql_data`
* `sudo mkdir -p /opt/ntipa/mysql_data` 
* `sudo docker run -tid --name mysql -v /opt/ntipa/mysql_data:/var/lib/mysql -p 3306:3306 -e MYSQL_USER="admin" -e MYSQL_PASS="12345678" tornabene/ntipa-mysql`

Container can be built with the command:

* `sudo docker build -t="dgiglio/debian-kamailio:v0" /patc/to/Dockerfile`

Container can be launched with the command:

* `docker run -tid --name kamailio -e DOMAIN=<string> -e PUBLIC_IP=x.x.x.x --dns=x.x.x.x -p 10000-10010:10000-10010/udp -p 4443:4443 -p 9000:9000 -p 5060:5060 -p 5060:5060/udp -p 8060:8060 --link mysql:mysql.ntipa.it dgiglio/debian-kamailio:v0`

