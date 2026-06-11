FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

RUN apk add --no-cache netcat-openbsd

# Port configuration
ENV IEC61850_PORT=102
EXPOSE 102

# Copy the fat jar. The assembly plugin creates a jar with '-jar-with-dependencies' suffix
COPY target/protection-relay-emulator-*-jar-with-dependencies.jar emulator.jar

# Run the application
ENTRYPOINT ["java", "-jar", "emulator.jar"]

