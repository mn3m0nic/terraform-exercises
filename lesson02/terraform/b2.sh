#!/bin/bash
main()
{
  echo "Started script $0 at `date` from `whoami`" 
  sudo apt-get update
  sudo apt-get install -y mysql-server
  ## Don't use this for prod
  sudo sed -i -e 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
  sudo service mysql restart
}
main "$@" | tee /tmp/$(basename $0)"-"$(date +"%Y%m%d_%H%M%S" )".log"
