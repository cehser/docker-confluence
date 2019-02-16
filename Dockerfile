FROM atlassian/confluence-server
MAINTAINER Christoph Eßer <christoph@cehser.de>
ARG CONNECTOR_VERSION=5.1.47

ADD https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${CONNECTOR_VERSION}.tar.gz /tmp/

RUN cd /tmp &&\
  tar zxvf mysql-connector-java-${CONNECTOR_VERSION}.tar.gz &&\
  cd mysql-connector-java-${CONNECTOR_VERSION} &&\
  cp mysql-connector-java-${CONNECTOR_VERSION}.jar /opt/atlassian/confluence/confluence/WEB-INF/lib/ &&\
  cd /tmp &&\
  rm -rf /tmp/mysql-connector-java-${CONNECTOR_VERSION} mysql-connector-java-${CONNECTOR_VERSION}.tar.gz
