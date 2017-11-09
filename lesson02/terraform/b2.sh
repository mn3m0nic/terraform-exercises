#!/bin/bash
main()
{
  echo "Started script $0 at `date` from `whoami`" 
  sudo apt-get update
  sudo apt-get install -y mysql-server
}
main "$@" | tee /tmp/$(basename $0)"-"$(date +"%Y%m%d_%H%M%S" )".log"
