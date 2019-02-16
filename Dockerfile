FROM atlassian/confluence-server
MAINTAINER Christoph Eßer <christoph@cehser.de>
ARG CONNECTOR_VERSION=5.1.47

ADD https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${CONNECTOR_VERSION}.tar.gz /tmp/
# tini is broken in atlassian/confluence-server 6.14.1, workaround needed:
ARG TINI_VERSION=v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /sbin/tini
RUN chmod a+x /sbin/tini


RUN cd /tmp &&\
  tar zxvf mysql-connector-java-${CONNECTOR_VERSION}.tar.gz &&\
  cd mysql-connector-java-${CONNECTOR_VERSION} &&\
  cp mysql-connector-java-${CONNECTOR_VERSION}.jar /opt/atlassian/confluence/confluence/WEB-INF/lib/ &&\
  cd /tmp &&\
  rm -rf /tmp/mysql-connector-java-${CONNECTOR_VERSION} mysql-connector-java-${CONNECTOR_VERSION}.tar.gz
