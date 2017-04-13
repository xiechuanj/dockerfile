FROM xiechuan/tomcat8:1.0.1
MAINTAINER xiechuan  <xiechuanj@gmail.com>

ENV ANT_VERSION=1.10.1

RUN wget --no-check-certificate --no-cookies http://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz \
    && tar -zvxf apache-ant-${ANT_VERSION}-bin.tar.gz -C /opt/ \
    && rm -rf apache-ant-${ANT_VERSION}-bin.tar.gz 

