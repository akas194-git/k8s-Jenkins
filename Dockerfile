FROM centos:centos6
MAINTAINER akas
RUN yum update -y && yum install -y httpd net-tools
COPY ./src var/www/html
EXPOSE 80
ENTRYPOINT apachectl "-DFOREGROUND"


