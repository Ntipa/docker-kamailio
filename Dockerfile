# Face recognizer
FROM debian:stable
MAINTAINER Daniele Giglio <giglio.d@gmail.com>
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get install -y curl
RUN curl http://deb.kamailio.org/kamailiodebkey.gpg | apt-key add -
COPY kamailio.list /etc/apt/sources.list.d/

RUN apt-get update
#RUN apt-get -y install openssh-server && mkdir /var/run/sshd
#RUN apt-get -y install supervisor
COPY kamailio.cfg /etc/kamailio/
COPY kamctlrc	  /etc/kamailio/
COPY tls.cfg	  /etc/kamailio/
COPY kamailio	  /etc/default/
RUN apt-get -y install kamailio kamailio-extra-modules kamailio-ims-modules kamailio-mysql-modules kamailio-nth kamailio-presence-modules kamailio-tls-modules kamailio-websocket-modules kamailio-xml-modules kamailio-xmpp-modules
RUN apt-get -y install rtpproxy

EXPOSE 22 5060

CMD ["/usr/sbin/kamailio"]
