FROM 192.168.10.96/xiechuan/centosssh:1.0.0
MAINTAINER xiechuan  <xiechuanj@gmail.com>

RUN yum clean all && yum update -y
RUN yum install -y ntp && yum clean all
EXPOSE 123
ENTRYPOINT ["ntpd"]
CMD ["/usr/sbin/init"]
