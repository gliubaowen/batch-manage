#!/bin/sh

###############################################
# Filename:    ssh-upload.sh 
# Version:     3.0.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: ssh scp 文件从本地到远程
# Notes:       
###############################################

. /etc/init.d/functions

if [ $# -lt 3 ]
   then
    echo "USAGE:$0 USAGE|REMOTE-HOST|FROM-LOCAL-PATH|TO-REMOTEHOST-PATH"
    exit 1
fi

#remote_host
remote_host=$1
#echo -e "remote_host:$remote_host"

#from_path
from_path=$2
#echo -e "from_path:$from_path"

#to_path
to_path=$3
#echo -e "to_path:$to_path"

scp -r ${from_path} root@${remote_host}:${to_path}
echo -e "\n"
  if [ $? -eq 0 ]
    then
      action "[info] ssh-upload $remote_host ok" /bin/true
    else
      action "[info] ssh-upload $remote_host ok" /bin/false
  fi
