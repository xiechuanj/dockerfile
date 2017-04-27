FROM xiechuan/ant1101:1.0.0
MAINTAINER xiechuan  <xiechuanj@gmail.com>
ENV VERSION=3.3.9

RUN yum install -y unzip && wget http://apache.osuosl.org/maven/maven-3/${VERSION}/binaries/apache-maven-${VERSION}-bin.zip
RUN unzip  apache-maven-${VERSION}-bin.zip -d /opt/
