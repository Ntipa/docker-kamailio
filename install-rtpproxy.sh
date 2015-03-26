#!/bin/sh

cd /tmp;

apt-get install -y make git;

git clone https://github.com/sippy/rtpproxy.git
cd rtpproxy;

./configure; 
make;
make install;

apt-get remove -y make git;
#cd .. && rm -fR rtpproxy/;
