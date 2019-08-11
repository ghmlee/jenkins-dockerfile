FROM jenkins/jenkins:lts
MAINTAINER Graham Lee <ghmlee@ghmlee.com>

USER root

RUN apt-get update && \
    apt-get upgrade -y -q && \
    apt-get install -y -q sudo curl apt-transport-https ca-certificates gnupg2 software-properties-common && \
    echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y -q docker-ce

RUN usermod -a -G docker jenkins

USER jenkins
