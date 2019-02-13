#!/bin/sh

# -------------------------------------------------------------------------------
# Filename:    rsync-util.sh 
# Version:     3.0.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: rsync 文件传输
# Notes:       
# -------------------------------------------------------------------------------

. /etc/init.d/functions

if [ $# -lt 4 ]
   then
    echo "USAGE:$0 USAGE|PARAM|REMOTE-HOST|FROM-PATH|TO-PATH"
    exit 1
fi

#remote_host
remote_host=$2
#echo -e "remote_host:$remote_host"

#from_path
from_path=$3
#echo -e "from_path:$from_path"

#to_path
to_path=$4
#echo -e "to_path:$to_path"

if [ $1 == '-u' ]; 
	then
		echo -e "\n[info] 上传文件"
		rsync -av $from_path '-e ssh -l root' $remote_host:$to_path
else if [ $1 == '-d' ] 
	then 
		echo -e "\n[info] 下载文件"
		rsync -av $remote_host:$from_path '-e ssh -l root' $to_path
	fi
fi

echo -e "\n"
if [ $? -eq 0 ]
  	then
    	action "[info] rsync-util $remote_host ok" /bin/true
  	else
    	action "[info] rsync-util $remote_host ok" /bin/false
fi
