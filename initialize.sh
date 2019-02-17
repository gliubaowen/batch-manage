#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    initialize.sh 
# Version:     2.0.0
# Date:        2019-02-17
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 初始化项目
# Notes:       
# -------------------------------------------------------------------------------

#工作空间
workspaces=$(dirname "$0")

. ${workspaces}/common-constants

#创建日志目录
mkdir -p $log_dir
