#!/bin/bash
source /etc/profile
kafka_home=/usr/local/kafka
kafka_mang=/usr/local/KafkaOffsetMonitor

echo "start kafka broker server..."
$kafka_home/bin/kafka-server-start.sh -daemon $kafka_home/config/server.properties &
echo "kafka broker started success..."

echo "start kafka manger server plat"
java -cp $kafka_mang/KafkaOffsetMonitor-assembly-0.2.1.jar com.quantifind.kafka.offsetapp.OffsetGetterWeb --zk localhost:2181 --port 8086 --refresh 5.minutes --retain 1.days 1>/usr/local/KafkaOffsetMonitor/logs/stdout.log 2>/usr/local/KafkaOffsetMonitor/logs/stderr.log &
echo "kafka manger plat started..."
