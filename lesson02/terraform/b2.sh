#!/bin/bash
main()
{
  echo "Started script $0 at `date`" 
  apt-get update
  apt-get intall -y mysql-server
}
main "$@" | tee /tmp/$(basename $0)"-"$(date +"%Y%m%d_%H%M%S" )".log"
