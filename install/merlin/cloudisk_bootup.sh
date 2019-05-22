#!/usr/bin/env bash

# copyright logi all rights reserved.

while [[ ! -f /opt/bin/opkg ]]
do
   sleep 60
   logger -t 'CloudDisk' 'No opt, sleep 60s.'
done

logger -t 'CloudDisk' 'Install requirements ...'
opkg update && opkg install \
coreutils-nohup libreadline libcurl libopenssl \
bash curl wget openssl-util ca-certificates ca-bundle
logger -t 'CloudDisk' 'Requirements installed.'

if [[ "`ps | grep speedup | grep -v grep`" == "" ]];
then
    nohup /opt/bin/bash /jffs/scripts/CloudDisk/speedup.sh > /dev/null 2>&1 &
    logger -t 'CloudDisk' 'Started.'
fi