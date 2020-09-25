#!/bin/sh

apt update
yes | apt upgrade
yes | apt install curl
yes | apt install alien

curl -O https://download.oracle.com/otn_software/linux/instantclient/19600/oracle-instantclient19.6-basic-19.6.0.0.0-1.x86_64.rpm
curl -O https://download.oracle.com/otn_software/linux/instantclient/19600/oracle-instantclient19.6-sqlplus-19.6.0.0.0-1.x86_64.rpm
curl -O https://download.oracle.com/otn_software/linux/instantclient/19600/oracle-instantclient19.6-devel-19.6.0.0.0-1.x86_64.rpm
curl -O https://download.oracle.com/otn_software/linux/instantclient/19600/oracle-instantclient19.6-jdbc-19.6.0.0.0-1.x86_64.rpm

alien -i oracle-instantclient19.6-basic-19.6.0.0.0-1.x86_64.rpm
alien -i oracle-instantclient19.6-sqlplus-19.6.0.0.0-1.x86_64.rpm
alien -i oracle-instantclient19.6-devel-19.6.0.0.0-1.x86_64.rpm
aline -i oracle-instantclient19.6-jdbc-19.6.0.0.0-1.x86_64.rpm

yes | perl -MCPAN -e 'install Bundle::DBD::Pg'
yes | perl -MCPAN -e 'install DBD::Oracle'

yes | apt install wget

wget -c https://github.com/darold/ora2pg/archive/v20.0.tar.gz -O - | tar -xz
cd ora2pg-20.0
perl Makefile.PL
make
yes | make install

ora2pg

