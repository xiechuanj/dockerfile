FROM 192.168.10.96/xiechuan/centos:systemd
MAINTAINER xiechuan  <xiechuanj@gmail.com>

RUN yum clean all && \
    yum update -y && \
    yum -y install epel-release && \
    yum -y install openssh-server sudo initscripts install ngrep install http;

RUN systemctl enable sshd.service

RUN mkdir -p /root/.ssh/

EXPOSE 22

CMD ["/usr/sbin/init"]
