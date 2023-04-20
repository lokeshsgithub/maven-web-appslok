FROM maven:3.3.9-alpine as build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM tomcat:jre8-alpine
COPY --from=build /app/target/maven-web-app.war /usr/local/tomcat/webapps/maven-web-app.war

 