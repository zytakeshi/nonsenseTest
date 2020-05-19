#!/bin/bash
pkill "v2ray"
pkill "main"
echo > /var/log/v2ray/error.log
echo > /var/log/v2ray/access.log
ulimit -u unlimited
cd /manager/
nohup ./main &
