#!/bin/bash
main()
{
  echo "Started script $0 at `date` from `whoami` with args \"$@\""  
  export mysqlhost=$1
  export mysqlusername=$2
  export mysqlpassword=$3
  sudo apt-get update
  sudo apt-get install -y mysql-server mysql-client
  ## Don't use this for prod
  sudo sed -i -e 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
  sudo service mysql restart
  env | tee /tmp/env
cat > /tmp/sqlinit.sql << EOF
CREATE USER '${mysqlusername}'@'%' IDENTIFIED BY '${mysqlpassword}';
GRANT ALL PRIVILEGES ON *.* TO '${mysqlusername}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE DATABASE test;
USE test;
CREATE TABLE names (
	id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
	name VARCHAR(100) NOT NULL
);
INSERT INTO names VALUES ('' , "first");
INSERT INTO names VALUES ('' , "second");
INSERT INTO names VALUES ('' , "third");
EOF
sudo mysql < /tmp/sqlinit.sql
}
main "$@" | tee /tmp/$(basename $0)"-"$(date +"%Y%m%d_%H%M%S" )".log"
