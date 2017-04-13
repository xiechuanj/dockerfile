FROM centos:7.2.1511
MAINTAINER xiechuan  <xiechuanj@gmail.com>

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN yum install -y wget curl vim&& wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.rpm
RUN rpm -ivh jdk-8u112-linux-x64.rpm && rm jdk-8u112-linux-x64.rpm
