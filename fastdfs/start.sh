#!/bin/bash
ip=`ifconfig |grep inet|grep -v '127.0.0.1'|awk '{print $2}'`
sed -i "s/192.168.10.116/$ip/g" /usr/local/nginx-1.10.0/conf/nginx.conf

echo "start zookeeper..."
/usr/local/zookeeper-3.4.6/bin/zkServer.sh start &
echo "zookeeper started success..."
sleep 5

sed -i "s/127.0.0.1/$ip/g" /usr/local/kafka/config/server.properties
sed -i "s/localhost/$ip/g" /usr/local/kafka/config/server.properties

echo "start kafka broker server..."
$kafka_home/bin/kafka-server-start.sh -daemon $kafka_home/config/server.properties &
echo "kafka broker started success..."

echo "start kafka manger server plat"
java -cp $kafka_mang/KafkaOffsetMonitor-assembly-0.2.0.jar com.quantifind.kafka.offsetapp.OffsetGetterWeb --zk localhost:2181 --port 8086 --refresh 5.minutes --retain 1.days 1>/usr/local/KafkaOffsetMonitor/logs/stdout.log 2>/usr/local/KafkaOffsetMonitor/logs/stderr.log &
echo "kafka manger plat started..."

sed -i "s/192.168.10.116/$ip/g" /etc/fdfs/storage.conf
sed -i "s/192.168.10.116/$ip/g" /etc/fdfs/client.conf
sed -i "s/192.168.10.116/$ip/g" /etc/fdfs/mod_fastdfs.conf
sleep 5
/usr/bin/fdfs_trackerd /etc/fdfs/tracker.conf
/usr/bin/fdfs_storaged /etc/fdfs/storage.conf
ln -sv /usr/include/fastcommon /usr/local/include/fastcommon
ln -sv /usr/include/fastdfs /usr/local/include/fastdfs
ln -sv /usr/lib64/libfastcommon.so /usr/local/lib/libfastcommon.so
ln -s $datadir/data/ $datadir/data/M00

/usr/local/nginx-1.10.0/sbin/nginx

/usr/local/kafka/kafka-create-topic.sh
ping localhost>null
