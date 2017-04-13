FROM centos

### This image is a build from non automated image cause of no possibility of Oracle 12c instalation in Docker container

MAINTAINER xiechuan "932280190@qq.com"


ADD qcConfigFile.properties /qcConfigFile.properties
EXPOSE 8181
RUN mkdir -p /var/opt/HP/ALM/conf && sed 's/localhost/172.17.0.1/' /qcConfigFile.properties >/var/opt/HP/ALM/conf/qcConfigFile.properties

WORKDIR /mnt/alm_cache
 
ENTRYPOINT ./run_silent.sh && ping localhost
CMD  [""]
