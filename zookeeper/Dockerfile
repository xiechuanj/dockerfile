FROM xiechuan/oraclejdk8u112:1.0.0
MAINTAINER xiechuan  <xiechuanj@gmail.com>


RUN wget http://archive.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
RUN set -x \
    && tar zxvf zookeeper-3.4.6.tar.gz -C /usr/local \
    && mkdir -p /usr/local/zookeeper-3.4.6/data \
    && mkdir -p /usr/local/zookeeper-3.4.6/logs \
    && mv /usr/local/zookeeper-3.4.6/conf/zoo_sample.cfg /usr/local/zookeeper-3.4.6/conf/zoo_sample.cfg.bak \
    && echo "tickTime=2000" >/usr/local/zookeeper-3.4.6/conf/zoo.cfg \
    && echo "initLimit=10" >>/usr/local/zookeeper-3.4.6/conf/zoo.cfg \
    && echo "syncLimit=5" >>/usr/local/zookeeper-3.4.6/conf/zoo.cfg \
    && echo "dataDir=/usr/local/zookeeper-3.4.6/data" >>/usr/local/zookeeper-3.4.6/conf/zoo.cfg \
    && echo "dataLogDir=/usr/local/zookeeper-3.4.6/logs" >>/usr/local/zookeeper-3.4.6/conf/zoo.cfg \
    && echo "clientPort=2181" >>/usr/local/zookeeper-3.4.6/conf/zoo.cfg

WORKDIR  /usr/local/zookeeper-3.4.6/bin

ENTRYPOINT ./zkServer.sh start && ping localhost
