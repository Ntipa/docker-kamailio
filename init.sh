#!/bin/sh

IP=$(ip -o -4 addr list eth0 | awk '{print $4}' | cut -f1 -d'/');

sed -ir "s/([0-9]{1,3}\.){3}[0-9]{1,3}/$IP/g" /etc/kamailio/kamctlrc;
sed -ir "s/([0-9]{1,3}\.){3}[0-9]{1,3}/$IP/g" /etc/kamailio/kamailio.cfg;

service rtpproxy start;

service kamailio start;
