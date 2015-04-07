#!/bin/bash
#########################################################################################
# published under the x-license                                                         #
# Copyright (c) 2015 http://www.creator110.com                                          #
#########################################################################################

apt-get update
apt-get install mysql-server mysql-client -y
apt-get install apache2 -y
apt-get install php5 libapache2-mod-php5 -y
/etc/init.d/apache2 restart
