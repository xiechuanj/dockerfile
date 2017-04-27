FROM xiechuan/oraclejdk8u112:1.0.0
MAINTAINER xiechuan  <xiechuanj@gmail.com>
ENV VERSION=8.5.14

RUN wget http://mirrors.cnnic.cn/apache/tomcat/tomcat-8/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz
RUN tar zxvf apache-tomcat-${VERSION}.tar.gz -C /opt && rm -rf apache-tomcat-${VERSION}.tar.gz
WORKDIR /opt/apache-tomcat-${VERSION}
ADD manager.xml /opt/apache-tomcat-${VERSION}/conf/Catalina/localhost/
ADD tomcat-users.xml /opt/apache-tomcat-${VERSION}/conf/ 


ENTRYPOINT bin/startup.sh && ping localhost>null
