FROM atlassian/confluence-server
MAINTAINER Christoph Eßer <christoph@cehser.de>

RUN apt-get update &&\
  apt-get install wget && rm -rf /var/lib/apt/lists
RUN cd /tmp &&\
  wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.47.tar.gz  &&\
  tar zxvf mysql-connector-java-5.1.47.tar.gz &&\
  cd mysql-connector-java-5.1.47 &&\
  cp mysql-connector-java-5.1.47.jar /opt/atlassian/confluence/confluence/WEB-INF/lib/ &&\
  cd /tmp &&\
  rm -rf /tmp/mysql-connector-java-5.1.47 mysql-connector-java-5.1.47.tar.gz
