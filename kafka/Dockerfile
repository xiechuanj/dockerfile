FROM xiechuan/zookeeper:1.0.0
MAINTAINER xiechuan  <xiechuanj@gmail.com>

ENV kafka_log="/usr/local/kafka/logs"
ENV kafka_offset_log="/usr/local/KafkaOffsetMonitor/logs"
ENV broker_id=0
ENV zk_addr=127.0.0.1:2181
ENV kafka_home=/usr/local/kafka
ENV kafka_mang=/usr/local/KafkaOffsetMonitor

WORKDIR /root

RUN wget http://apache.claz.org/kafka/0.10.0.0/kafka_2.11-0.10.0.0.tgz && wget https://github.com/quantifind/KafkaOffsetMonitor/releases/download/v0.2.1/KafkaOffsetMonitor-assembly-0.2.1.jar
RUN set -x \
    && tar zxvf kafka_2.11-0.10.0.0.tgz -C /usr/local \
    && mv /usr/local/kafka_2.11-0.10.0.0 /usr/local/kafka \
    && mkdir -p $kafka_log \
    && mkdir -p $kafka_offset_log \
    && mv KafkaOffsetMonitor-assembly-0.2.1.jar /usr/local/KafkaOffsetMonitor/


COPY *.properties /usr/local/kafka/config/

RUN nohup java -cp KafkaOffsetMonitor-assembly-0.2.1.jar com.quantifind.kafka.offsetapp.OffsetGetterWeb --zk localhost:2181 --port 8086 --refresh 10.seconds --retain 2.days 1>/var/kafka-offset-console/logs/stdout.log 2>/var/kafka-offset-console/logs/stderr.log & 

WORKDIR  /usr/local/kafka/
COPY *.sh ./
RUN chmod +x *.sh
