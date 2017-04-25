FROM centos:7.2.1511
MAINTAINER xiechuan  <xiechuanj@gmail.com>


RUN yum install -y wget curl unzip vim && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.rpm &&  rpm -ivh jdk-8u112-linux-x64.rpm && rm jdk-8u112-linux-x64.rpm
