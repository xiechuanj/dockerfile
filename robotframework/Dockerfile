FROM xiechuan/maven339:1.0.0
MAINTAINER xiechuan  <xiechuanj@gmail.com>

RUN yum install -y yum-plugin-ovl
RUN yum install -y git && wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py && rm -rf get-pip.py
RUN pip install -U django djangorestframework robotframework robotframework-ride robotframework-selenium2library robotframework-databaselibrary requests robotframework-requests robotframework-appiumlibrary robotframework-ftplibrary  robotframework-sudslibrary

CMD [""]
