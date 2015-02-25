# docker-kamailio
Kamailio SIP server docker image

This container run an instance of rtpproxy and kamailio to implement VoIP.
Kamailio avails of an external mysql db, one is available through another
docker image:

* sudo rm -rf /opt/ntipa/mysql_data
* sudo mkdir -p /opt/ntipa/mysql_data 
* sudo docker run -tid --name mysql -v /opt/ntipa/mysql_data:/var/lib/mysql -p 3306:3306 -e MYSQL_USER="admin" -e MYSQL_PASS="12345678" tornabene/ntipa-mysql
* sudo docker run -tid --name kamailio -P  --link mysql:mysql.ntipa.it tornabene/ntipa-kamailio

* 
Container can be launched with the command:

* # docker run -tid --name kamailio -p 10000-10010:10000-10010 -p 4443:4443 -p 9000:9000 -p 5060:5060 -p 8060:8060 --link mysql:mysql.ntipa.it dgiglio/debian-kamailio:v0 /usr/local/bin/init.sh

Before starting Kamailio it's necessary to run 
create mysqldb with `kamdbctl create` inside kamailio container


