FROM maven:3.8.4-openjdk-17 AS build

#setting work directory

WORKDIR /app

#Copy POM file

COPY pom.xml .

#Copying Source code

COPY src ./src

# Package the application

RUN mvn package -DskipTests
