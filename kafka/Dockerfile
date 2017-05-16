FROM 192.168.10.96/xiechuan/zookeeper:1.0.0
MAINTAINER xiechuan  <xiechuanj@gmail.com>

ENV kafka_log="/usr/local/kafka/logs"
ENV kafka_offset_log="/usr/local/KafkaOffsetMonitor/logs"
ENV broker_id=0
ENV zk_addr=127.0.0.1:2181
ENV kafka_home=/usr/local/kafka
ENV kafka_mang=/usr/local/KafkaOffsetMonitor

WORKDIR /root

RUN wget http://apache.claz.org/kafka/0.10.0.0/kafka_2.11-0.10.0.0.tgz 
RUN set -x \
    && tar zxvf kafka_2.11-0.10.0.0.tgz -C /usr/local \
    && mv /usr/local/kafka_2.11-0.10.0.0 /usr/local/kafka \
    && mkdir -p $kafka_log \
    && mkdir -p $kafka_offset_log 
   
COPY KafkaOffsetMonitor-assembly-0.2.0.jar /usr/local/KafkaOffsetMonitor/
COPY *.properties /usr/local/kafka/config/


WORKDIR  /usr/local/kafka/
COPY *.sh ./
RUN chmod +x *.sh
