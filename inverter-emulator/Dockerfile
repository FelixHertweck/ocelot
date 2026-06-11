FROM openjdk:11-jre-slim
WORKDIR /app

# Copy the pre-built JAR file into the container
# Adjust the source path based on the actual build output name
COPY target/inverter-emulator-1.0.0-SNAPSHOT-jar-with-dependencies.jar ./emulator.jar

EXPOSE 502
CMD ["java", "-jar", "emulator.jar"]
