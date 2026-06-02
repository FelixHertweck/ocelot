FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY target/otproxy-*-jar-with-dependencies.jar app.jar
COPY src/main/resources/proxy-config.yml proxy-config.yml

EXPOSE 5020
ENTRYPOINT ["java", "-jar", "app.jar"]
CMD ["proxy-config.yml"]
