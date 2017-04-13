FROM xiechuan/maven339:1.0.1
MAINTAINER xiechuan  <xiechuanj@gmail.com>

ENV JMETER_VERSION=3.1
ENV JMETER_HOME=/opt/jmeter
ENV JMETER_DOWNLOAD_URL=http://mirrors.tuna.tsinghua.edu.cn/apache/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz

RUN yum install -y unzip curl
RUN mkdir -p ${JMETER_HOME}  && \
    curl -L --silent ${JMETER_DOWNLOAD_URL} | tar -xz --strip=1 -C ${JMETER_HOME} && \
    curl -L --silent http://jmeter-plugins.org/downloads/file/JMeterPlugins-Standard-1.2.1.zip -o /tmp/jmeter-plugins-standard.zip && \
    unzip -o -d ${JMETER_HOME} /tmp/jmeter-plugins-standard.zip && \
    rm /tmp/jmeter-plugins-standard.zip

VOLUME ['/opt/jmeter']

WORKDIR	${JMETER_HOME}
CMD [""]
