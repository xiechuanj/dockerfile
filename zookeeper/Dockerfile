FROM xiechuan/oraclejdk8u112:1.0.0
MAINTAINER xiechuan  <xiechuanj@gmail.com>


RUN wget http://archive.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
RUN set -x \
    && tar zxvf zookeeper-3.4.6.tar.gz -C /usr/local \
    && mkdir -p /usr/local/zookeeper-3.4.6/data \
    && mkdir -p /usr/local/zookeeper-3.4.6/logs

COPY zoo.cfg  /usr/local/zookeeper-3.4.6/conf/
