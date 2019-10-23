#!/bin/bash

###############################################
# Filename:    ftp-util.sh 
# Version:     2.0.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: ftp-util
# Notes:       
###############################################

#工作空间
workspaces=$(dirname "$0")

. ${workspaces}/common-constants

FILE_NAME=$1

ftp -n <<EOF
open $ftp_address
user $ftp_user $ftp_passwd
bin
cd $ftp_path
put $FILE_NAME
bye
EOF
