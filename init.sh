#!/bin/sh

IP=$(ip -o -4 addr list eth0 | awk '{print $4}' | cut -f1 -d'/');

sed -ri "s/([0-9]{1,3}\.){3}[0-9]{1,3}/$IP/" /etc/kamailio/kamctlrc;
sed -ri "s/(MY_IP_ADDR\!)([0-9]{1,3}\.){3}[0-9]{1,3}/\1$IP/" /etc/kamailio/kamailio.cfg;
