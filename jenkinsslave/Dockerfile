FROM xiechuan/robotframework:1.0.1
MAINTAINER xiechuan  <xiechuanj@gmail.com>

WORKDIR ~/
RUN pip install -U python-jenkins 
COPY createJenkinsNode.py ./

ENTRYPOINT python createJenkinsNode.py
