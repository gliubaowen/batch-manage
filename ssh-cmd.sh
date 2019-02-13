#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    ssh-cmd.sh 
# Version:     3.0.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: ssh 到远程主机执行命令
# Notes:       
# -------------------------------------------------------------------------------

. /etc/init.d/functions

if [ $# -lt 2 ]
    then
    echo "USAGE:$0 USAGE|HOST|COMMAND"
    exit 1
fi

#remote_host
remote_host=$1
#需要执行的命令
cmd=$2

ssh root@$remote_host "source /etc/profile;${cmd}"
echo -e "\n"
if [ $? -eq 0 ]
    then
      action "[info] ssh-cmd $remote_host ok" /bin/true
    else
      action "[info] ssh-cmd $remote_host ok" /bin/false
fi
