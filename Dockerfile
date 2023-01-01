# TOMCAT
FROM ubuntu:20.04
MAINTAINER "bangarraju sagi"
RUN groupadd -r tomcat && useradd -r -g tomcat tomcat
RUN apt update -y
RUN apt install -y  tar
RUN apt install -y default-jdk
RUN mkdir /opt/tomcat/
ADD https://archive.apache.org/dist/tomcat/tomcat-10/v10.0.8/bin/apache-tomcat-10.0.8.tar.gz /opt/tomcat
RUN cd /opt/tomcat && tar -xzf apache-tomcat-10.0.8.tar.gz && rm apache-tomcat-10.0.8.tar.gz
COPY sample.war /opt/tomcat/webapps/
RUN chown -R tomcat:tomcat /opt/tomcat/
RUN chmod -R 755 /opt/tomcat/
RUN cd /opt/tomcat/bin
EXPOSE 8080
USER tomcat
CMD ["catalina.sh", "run"]
