#!/usr/bin/env bash

setenforce 0

yum-config-manager --add-repo https://beaker-project.org/yum/beaker-server-RedHatEnterpriseLinux.repo
yum install -y beaker-server mariadb-server

cat > /etc/my.cnf.d/beaker.cnf << EOF
[mysqld]
character-set-server=utf8
EOF

systemctl enable --now mariadb

mysql << EOF
CREATE DATABASE beaker;
CREATE USER beaker;
GRANT ALL ON beaker.* TO 'beaker'@'localhost' IDENTIFIED BY 'beaker';
EOF

beaker-init -u admin -p testing -e root@example.com

systemctl enable --now httpd
systemctl enable --now beakerd
