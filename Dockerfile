FROM ubuntu:16.04
MAINTAINER jaiprak

EXPOSE 8080

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV APP_HOME /app

RUN apt-get update -q -y && \
apt-get install -y --no-install-recommends locales && \
locale-gen en_US.UTF-8 && \
apt-get dist-upgrade -y && \
apt-get --purge remove openjdk*

## JAVA INSTALLATION
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" > /etc/apt/sources.list.d/webupd8team-java-trusty.list && \
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 && \
apt-get update && \
apt-get install -y --no-install-recommends oracle-java8-installer oracle-java8-set-default && \
apt-get clean all

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY build/libs/expensometer*.jar .
CMD java -jar expensometer*.jar --server.port=8080