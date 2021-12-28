FROM maven:3.6.3-openjdk-8-slim AS build
WORKDIR /tmp
RUN apt-get update -y
RUN apt-get install git -y
RUN git clone https://github.com/masdp/DevOps_cert_job.git
RUN mvn package -f /tmp/DevOps_cert_job/App42PaaS-Java-MySQL-Sample/pom.xml

FROM tomcat:8.0-alpine AS prod
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /tmp/DevOps_cert_job/App42PaaS-Java-MySQL-Sample/target/*.war /usr/local/tomcat/webapps/ROOT.war
ADD Config.properties /usr/local/tomcat/ROOT/Config.properties
