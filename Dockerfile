FROM maven:3.8.4-openjdk-17 AS build

#setting work directory

WORKDIR /app

#Copy POM file

COPY pom.xml .

#Copying Source code

COPY src ./src

# Package the application

RUN mvn package -DskipTests

# Use an official OpenJDK image as the base image for running the application
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the packaged jar file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port the application runs on
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
