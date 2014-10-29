#This is just for debugging. A proper docker build is on the way.
FROM centos:centos7
RUN yum update -y; yum install -y binutils gcc gcc-c++ glibc-static make automake patch wget tar bzip2 hostname; yum clean all;

ADD . /tmp/smls/
RUN /tmp/smls/build 01-prepare

#RUN /tmp/smls/build 02-temporary
#RUN /tmp/smls/build 03-sysroot
