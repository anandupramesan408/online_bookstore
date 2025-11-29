FROM maven:3.9.11-amazoncorretto-17-al2023 AS builder
WORKDIR /app
RUN mvn clean package -DskipTests

FROM tomcat:jre17-temurin
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]