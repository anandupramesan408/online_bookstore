FROM eclipse-temurin-11-alpine AS builder
WORKDIR /app
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jdk-jammy
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]