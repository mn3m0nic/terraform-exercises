#!/bin/bash
main()
{
  echo "Started script $0 at `date` from `whoami` with args \"$@\"" 
  export mysqlhost=$1
  export mysqlusername=$2
  export mysqlpassword=$3
  sudo apt-get update
  sudo apt-get install -y php apache2 subversion git php-pdo-mysql
  sudo rm /var/www/html/index.html
  sudo svn export --force https://github.com/mn3m0nic/terraform-exercises/trunk/lesson02/serverdata/php/site-files /var/www/html/
  chmod 777 /var/www/html
cat > /var/www/html/config.php << EOF
<?php
\$host       = "${mysqlhost}";
\$username   = "${mysqlusername}";
\$password   = "${mysqlpassword}";
\$dbname     = "test"; 
\$dsn        = "mysql:host=\$host;dbname=\$dbname"; 
\$options    = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION);
?>
EOF
chmod 755 /var/www/html
## DEBUG
#env > /tmp/env
}
main "$@" | tee /tmp/$(basename $0)"-"$(date +"%Y%m%d_%H%M%S" )".log"
