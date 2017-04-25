FROM centos:7.2.1511
MAINTAINER xiechuan  <xiechuanj@gmail.com>

ENV tracker_server="127.0.0.1"
ENV datadir="/fastdata"
ENV my_group="group0"


WORKDIR /root

COPY *  ./
RUN yum install wget gcc gcc-c++ vim unzip openssl-devel net-tools make -y && chmod +x start.sh
RUN wget https://github.com/happyfish100/fastdfs/archive/V5.08.tar.gz
RUN set -x \
    && wget https://github.com/happyfish100/fastdfs/archive/V5.08.tar.gz  \
    && tar zxvf libfastcommon-master.tar.gz && tar zxvf V5.08.tar.gz \
    && cd libfastcommon-master \
    && ./make.sh && ./make.sh install \
    && cd ../fastdfs-5.08/ \
    && ./make.sh && ./make.sh install \
    && cd /etc/fdfs/ \
    && cp client.conf.sample client.conf \
    && cp storage.conf.sample storage.conf \
    && cp tracker.conf.sample tracker.conf \
    && mkdir -p $datadir \
    && cores=`grep 'core id'  /proc/cpuinfo | sort -u | wc -l` \
    && tracker_server=`ifconfig |grep inet|grep -v '127.0.0.1'|awk '{print $2}'` \
    && sed -i "s#base_path=.*#base_path=$datadir#g" /etc/fdfs/tracker.conf \
    && sed -i "s#work_threads=.*#work_threads=$cores#g" /etc/fdfs/tracker.conf \
    && sed -i "s#base_path=.*#base_path=$datadir#g" /etc/fdfs/storage.conf \
    && sed -i "s#work_threads=.*#work_threads=$cores#g" /etc/fdfs/storage.conf \
    && sed -i "s#store_path0=.*#store_path0=$datadir#g" /etc/fdfs/storage.conf \
    && sed -i "s#^store_group=.*#store_group=$my_group#g" /etc/fdfs/tracker.conf \
    && sed -i "s#^group_name=.*#group_name=$my_group#g" /etc/fdfs/storage.conf \
    && sed -i "s#base_path=.*#base_path=$datadir#g" /etc/fdfs/client.conf
  



WORKDIR /root
ENTRYPOINT ./start.sh
