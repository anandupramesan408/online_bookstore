FROM eclipse-temurin-11-alpine AS builder
WORKDIR .
RUN 'mvn clean package'

FROM eclipse-temurin:17-jdk-jammy
COPY --from=builder:target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]