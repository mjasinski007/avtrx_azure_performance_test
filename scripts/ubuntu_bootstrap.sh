#!/bin/bash
sudo hostnamectl set-hostname ${name}
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo echo ubuntu:${password} | /usr/sbin/chpasswd
sudo apt update -y
sudo apt upgrade -y
sudo apt-get -y install traceroute unzip build-essential autotools-dev autoconf libtool automake git gcc hping3 apache2 net-tools qperf iperf3 mtr

sudo /etc/init.d/ssh restart
sudo echo "<html><h1>Aviatrix is awesome</h1></html>" > /var/www/html/index.html 


### Install ntttcp ###
git clone https://github.com/Microsoft/ntttcp-for-linux
cd ntttcp-for-linux/src
make; make install
cp ntttcp /usr/local/bin/


### Install Sockperf ###

# From bash command line (assumes Git is installed)
git clone https://github.com/mellanox/sockperf
cd sockperf/
sudo ./autogen.sh
sudo ./configure --prefix=

# make is slow, may take several minutes
sudo make; sudo make install 