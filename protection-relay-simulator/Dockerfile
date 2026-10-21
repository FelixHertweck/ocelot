FROM eclipse-temurin:25-jre-alpine
WORKDIR /app

RUN apk add --no-cache netcat-openbsd

# Port configuration
ENV IEC61850_PORT=102
EXPOSE 102

# Copy the fat jar. The assembly plugin creates a jar with '-jar-with-dependencies' suffix
COPY target/protection-relay-simulator-*-jar-with-dependencies.jar simulator.jar

# Run the application
ENTRYPOINT ["java", "-jar", "simulator.jar"]

