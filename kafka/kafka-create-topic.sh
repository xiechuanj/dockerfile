#!/bin/bash
kafka_home=/usr/local/kafka
echo "create dpcs topic start..."
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1   --topic CW_PLAT_RECOG_MANAGE
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1   --topic CW_FEATURE_PLAT_MANAGE
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 32  --topic CW_FEATURE_PLAT_FEATURE
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1   --topic CW_RECOG_PLAT_MANAGE
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 32  --topic CW_RECOG_PLATANDSTORAGE_INFO
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1   --topic CW_CAPTUR_PLATE_MANAGE
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1   --topic CW_ANALY_PLATE_MANAGE
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1   --topic CW_ANALY_PLATE_SEARCH
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 32  --topic CW_PLAT_FEATURE_MANAGE
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 32  --topic CW_PLAT_FEATURE_FEATURE
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 32  --topic CW_CAPTUR_PLATEANDFEATURE_INFO
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1   --topic CW_PLAT_CAPTURE_MANAGE
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1   --topic CW_PLAT_ANALY_MANAGE
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 32  --topic CW_PLAT_ANALY_SEARCH
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 32  --topic CW_FEATURE_RECOGANDSTORAG_FEATURE
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1   --topic CW_PLATE_PLATE_MANGER
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1   --topic CW_HEARTBEATS_PLATE_MANAGE
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1   --topic CW_FEATURE_PLAT_SEARCHFEATURE
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1   --topic CW_CAPTUR_PLATE_PREVIEW
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1   --topic CW_RECOG_PLAT_PREVIEW
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 32  --topic CW_PLAT_FEATURE_SEARCHFEATURE
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 32  --topic CW_CAPTUR_PLATEANDFEATURE_IMG
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1  --topic CW_PLAT_REALTIME_SEARCH
sh $kafka_home/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1  --topic CW_REALTIME_PLAT_SEARCH
echo 'topic create finished...'
echo 'Here is dpcs all topics'
sh $kafka_home/bin/kafka-topics.sh --list --zookeeper localhost:2181
