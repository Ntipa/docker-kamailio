#!/bin/sh

IP=$(ip -o -4 addr list eth0 | awk '{print $4}' | cut -f1 -d'/');
#IP=0.0.0.0

sed -ri "s/([0-9]{1,3}\.){3}[0-9]{1,3}/$IP/" /etc/kamailio/kamctlrc;
sed -ri "s/(MY_IP_ADDR\!)([0-9]{1,3}\.){3}[0-9]{1,3}/\1$IP/" /etc/kamailio/kamailio.cfg;

if [ "$CHARSET" != "" ] ; then
    sed -ri "s/SIP_DOMAIN=.*/SIP_DOMAIN=$DOMAIN/" /etc/kamailio/kamctlrc;
    sed -ri "s/DOMAIN_ALIAS=.*/DOMAIN_ALIAS=$DOMAIN/" /etc/kamailio/kamctlrc;
    sed -ri "s/MY_DOMAIN=.*/MY_DOMAIN=$DOMAIN/" /etc/kamailio/kamctlrc;
    sed -ri "s/DBACCESSHOST=.*/DBACCESSHOST=$DOMAIN/" /etc/kamailio/kamctlrc;
fi
