FROM eclipse-temurin:25-jre-alpine
WORKDIR /app

# Copy the pre-built JAR file into the container
# Adjust the source path based on the actual build output name
COPY target/*-jar-with-dependencies.jar ./emulator.jar

EXPOSE 502
CMD ["java", "-jar", "emulator.jar"]
