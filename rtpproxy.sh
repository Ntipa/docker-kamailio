#!/bin/sh

PRIV_IP=$(ip -o -4 addr list eth0 | awk '{print $4}' | cut -f1 -d'/')

/usr/bin/rtpproxy -s udp:127.0.0.1:7722 -u kamailio:kamailio -p /var/run/rtpproxy/rtpproxy.pid -d WARN:LOG_LOCAL5 -l $PRIV_IP/$PUBLIC_IP -m 10001 -M 10010
