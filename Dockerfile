FROM maven:3.9.11-amazoncorretto-17-al2023 AS builder
WORKDIR /app
COPY . /app/
RUN mvn clean package -DskipTests

FROM tomcat:jre17-temurin
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]