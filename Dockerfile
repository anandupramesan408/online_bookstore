<<<<<<< HEAD
###Building the app
FROM eclipse-temurin:11-jdk-alpine as builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

## run in tomat container
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /usr/local/tomcat
RUN rm -rf webapps/ROOT
COPY --from=builder /app/target/*.war webapps/ROOT.war
EXPOSE 8080
CMD [ "catalina.sh", "run" ]
=======
FROM maven:3.9.11-amazoncorretto-17-al2023 AS builder
WORKDIR /app
COPY . /app/
RUN mvn clean package -DskipTests

FROM tomcat:jre17-temurin
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
>>>>>>> containerized
