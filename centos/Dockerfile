FROM centos:7.2.1511
MAINTAINER xiechuan  <xiechuanj@gmail.com>

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# Systemd is included in the centos 7 base containers, but it is not active by default. 
RUN yum -y swap -- remove fakesystemd -- install systemd systemd-libs
RUN yum -y update; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*; \
rm -f /etc/systemd/system/*.wants/*; \
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*; \
rm -f /lib/systemd/system/anaconda.target.wants/*
VOLUME ["/sys/fs/cgroup"]

# Install common utilities, then clean installation files to minimise space
RUN \
yum -y update; \
yum clean all; \
yum -y install unzip curl wget tar vim vim-enhanced nano yum-utils; \
yum clean all; \
rm -fr /var/cache/*
