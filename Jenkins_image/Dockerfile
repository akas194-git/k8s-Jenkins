FROM jenkins/jenkins:lts
MAINTAINER akas
USER root 
EXPOSE 8080 50000
RUN apt-get update -y
RUN apt-get install -y  apt-transport-https ca-certificates curl gnupg2 software-properties-common 
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

RUN apt-get update -y
RUN apt-get install -y  docker-ce

#installing kubectl binary
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl 

RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl


