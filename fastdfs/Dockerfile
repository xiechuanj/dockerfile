FROM xiechuan/kafka:1.0.0
MAINTAINER xiechuan  <xiechuanj@gmail.com>

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV datadir="/fastdata"
ENV my_group="group0"

WORKDIR /root
COPY *.tar.gz ./
RUN yum install -y yum-plugin-ovl
RUN yum install wget gcc gcc-c++ vim unzip openssl-devel net-tools make -y
RUN set -x \
    && wget https://github.com/happyfish100/fastdfs/archive/V5.08.tar.gz  \
    && tar zxvf libfastcommon-master.tar.gz && tar zxvf V5.08.tar.gz \
    && cd libfastcommon-master \
    && ./make.sh && ./make.sh install \
    && cd ../fastdfs-5.08/ \
    && ./make.sh && ./make.sh install \
    && cd /etc/fdfs/ \
    && mkdir -p $datadir

WORKDIR /root
RUN tar zxvf nginx-1.10.0.tar.gz -C /usr/local/ 
  
COPY client.conf storage.conf tracker.conf mod_fastdfs.conf /etc/fdfs/
COPY nginx.conf /usr/local/nginx-1.10.0/conf/nginx.conf
COPY http.conf /etc/fdfs/
COPY mime.types /etc/fdfs/

COPY start.sh ./
RUN chmod +x start.sh
ENTRYPOINT ./start.sh
