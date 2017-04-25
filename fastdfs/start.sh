#!/bin/bash
ip=`ifconfig |grep inet|grep -v '127.0.0.1'|awk '{print $2}'`
sed -i "/#tracker_server/a\tracker_server=$ip:22122" /etc/fdfs/storage.conf
sed -i "/#tracker_server/a\tracker_server=$ip:22122" /etc/fdfs/client.conf
/usr/bin/fdfs_trackerd /etc/fdfs/tracker.conf
/usr/bin/fdfs_storaged /etc/fdfs/storage.conf
ping localhost
