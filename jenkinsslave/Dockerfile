FROM xiechuan/robotframework:1.0.0
MAINTAINER xiechuan  <xiechuanj@gmail.com>

WORKDIR ~/
RUN pip install -U python-jenkins 
COPY createJenkinsNode.py ./

ENTRYPOINT /opt/apache-tomcat-8.5.14/bin/startup.sh && python createJenkinsNode.py
