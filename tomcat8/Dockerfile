FROM xiechuan/oraclejdk8u112:1.0.1
MAINTAINER xiechuan  <xiechuanj@gmail.com>


RUN wget http://mirrors.cnnic.cn/apache/tomcat/tomcat-8/v8.5.13/bin/apache-tomcat-8.5.13.tar.gz
RUN tar zxvf apache-tomcat-8.5.13.tar.gz -C /opt && rm -rf apache-tomcat-8.5.13.tar.gz
WORKDIR /opt/apache-tomcat-8.5.13
ADD manager.xml /opt/apache-tomcat-8.5.13/conf/Catalina/localhost/
ADD tomcat-users.xml /opt/apache-tomcat-8.5.13/conf/ 


ENTRYPOINT bin/startup.sh && ping 127.0.0.1
