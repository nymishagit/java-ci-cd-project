FROM tomcat:9-jdk17
COPY target/java-ci-cd.war /usr/local/tomcat/webapps/
EXPOSE 8080

