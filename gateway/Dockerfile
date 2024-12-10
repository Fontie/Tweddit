# Use an OpenJDK image as a base image
FROM openjdk:19-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Make the jar file
RUN mvn clean package

# Copy the Maven build artifact (JAR file) into the container
COPY target/*.jar babymonitor.jar

# Expose the port your Spring Boot application will run on (e.g., 8080)
EXPOSE 8085

# Command to run the Spring Boot application
CMD ["java", "-jar", "/app/app.jar"]
