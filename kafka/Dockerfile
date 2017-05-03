FROM xiechuan/zookeeper:1.0.0
MAINTAINER xiechuan  <xiechuanj@gmail.com>

ENV kafka_log="/usr/local/kafka/logs"
ENV kafka_offset_log="/usr/local/KafkaOffsetMonitor/logs"
ENV broker_id=0
ENV IP=127.0.0.1
ENV zk_addr=127.0.0.1:2181


WORKDIR /root

RUN wget http://apache.claz.org/kafka/0.10.0.0/kafka_2.11-0.10.0.0.tgz && wget https://github.com/quantifind/KafkaOffsetMonitor/releases/download/v0.2.1/KafkaOffsetMonitor-assembly-0.2.1.jar
RUN set -x \
    && tar zxvf kafka_2.11-0.10.0.0.tgz -C /usr/local \
    && mv /usr/local/kafka_2.11-0.10.0.0 /usr/local/kafka \
    && mv /usr/local/kafka/config/server.properties /usr/local/kafka/config/server.properties.bak \
    && mkdir -p $kafka_log \
    && mkdir -p $kafka_offset_log \
    && mv KafkaOffsetMonitor-assembly-0.2.1.jar /usr/local/KafkaOffsetMonitor/


COPY server.properties /usr/local/kafka/config/
COPY start.sh /usr/local/kafka/

RUN set -x \
    && sed -i "s#^broker.id=.*#broker.id=$broker_id#g" /usr/local/kafka/config/server.properties \
    && sed -i "s#^host.name=.*#host.name=$IP#g" /usr/local/kafka/config/server.properties \
    && sed -i "s#^zookeeper.connect=.*#zookeeper.connect=${zk_addr}#g" /usr/local/kafka/config/server.properties \
    && sed -i "s#^compression.type=.*#compression.type=gzip#g" /usr/local/kafka/config/producer.properties

RUN nohup java -cp KafkaOffsetMonitor-assembly-0.2.1.jar com.quantifind.kafka.offsetapp.OffsetGetterWeb --zk localhost:2181 --port 8086 --refresh 10.seconds --retain 2.days 1>/var/kafka-offset-console/logs/stdout.log 2>/var/kafka-offset-console/logs/stderr.log & 

RUN chmod 777 /usr/local/kafka/start.sh
WORKDIR  /usr/local/kafka/
COPY kafka-create-topic.sh ./
RUN chmod +x kafka-create-topic.sh
ENTRYPOINT /usr/local/zookeeper-3.4.6/bin/zkServer.sh start && ./start.sh && ./kafka-create-topic.sh &&  ping localhost
