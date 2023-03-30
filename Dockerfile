 FROM tomcat:9.0-jdk8-corretto-al2
 COPY target/*.war /usr/local/tomcat/webapps/maven-web-app.war