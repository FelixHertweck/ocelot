# Build stage
FROM eclipse-temurin:21-jdk-jammy AS build
WORKDIR /app
COPY pom.xml .
RUN apt-get update && apt-get install -y maven
COPY src ./src
# build using maven installed from apt
RUN mvn clean package -DskipTests

# Run stage
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
# Port configuration
ENV IEC61850_PORT=102
EXPOSE 102

# Copy the fat jar from build stage. The assembly plugin creates a jar with '-jar-with-dependencies' suffix
COPY --from=build /app/target/protection-relay-emulator-1.0.0-SNAPSHOT-jar-with-dependencies.jar /app/emulator.jar

# Run the application
ENTRYPOINT ["java", "-jar", "/app/emulator.jar"]
