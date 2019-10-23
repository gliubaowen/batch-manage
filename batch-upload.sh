#!/bin/bash

###############################################
# Filename:    batch-upload.sh 
# Version:     3.0.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 批量上传文件到远程
# Notes:       
###############################################

export LANG="en_US.UTF-8"

#工作空间
workspaces=$(dirname "$0")

. ${workspaces}/common-constants

#当前系统时间
CURRENTDATE=$(date +%Y-%m-%d)

if [ $# -lt 3 ]
    then
    echo "USAGE:$0 USAGE|PROPERTIES|FROM-LOCAL-FILE|TO-HOST-DIR"
    exit 1
fi

echo -e "[info] >>>>>>>>>>>>>>>>>>>>执行此脚本时间:$CURRENTDATE<<<<<<<<<<<<<<<<<<\n"

#配置文件
PROPERTIES=$1
echo -e "[info] hostname_file:$PROPERTIES"

#from_path
from_path="$2"
echo -e "[info] from_path:$from_path"

#to_path
to_path=$3
echo -e "[info] to_path:$to_path"

#检查配置文件是否正确
check-conf()
{
	echo -e '\n[info] ====================校验配置文件开始===================='

	if [ -f $PROPERTIES ] ; then
		echo "[success] 配置文件: $PROPERTIES 存在"
	else
		echo "[error] 配置文件: $PROPERTIES 未找到"
		exit 1
	fi

	if [ -s $PROPERTIES ] ; then
		echo "[success] 配置文件: $PROPERTIES 正常"
	else
		echo "[error] 配置文件: $PROPERTIES 为空"
		exit 2
	fi

	echo -e '[info] ====================校验配置文件结束====================\n'
}

main()
{
	echo '[info] ####################开始###################'
	check-conf
	echo "[info] 读取配置文件:$PROPERTIES"
	
	i=0;
	for remote_host in `cat $PROPERTIES`
	do
		let i++
		echo -e "\n[info] host_no:>>[$i]<< remote_host:>>[$remote_host]<<"
		echo -e "[info] command:>>>>> ./ssh-scp.sh ${remote_host} ${from_path} ${to_path}" 
		echo "[info] @@@@@@@@@@@@@@@@@@@@start@@@@@@@@@@@@@@@@@@@@"
		bash ssh-upload.sh $remote_host "${from_path}" $to_path 
		echo "[info] @@@@@@@@@@@@@@@@@@@@end@@@@@@@@@@@@@@@@@@@@"
	done

	echo -e "[info] ####################结束###################\n"
	exit 0
}

#执行方法
main | tee $log_dir/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
