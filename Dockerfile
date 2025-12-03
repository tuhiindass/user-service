# Stage 1: Build the Spring Boot application (Maven example)
#FROM maven:3.8.6-eclipse-temurin-11 AS build
#WORKDIR /app
#COPY pom.xml .
#COPY src ./src
#RUN mvn clean package -DskipTests

# Stage 2: Create the final Docker image
#FROM eclipse-temurin:17-jre
#WORKDIR /app
#COPY --from=build /app/target/*.jar app.jar
#EXPOSE 8000
#ENTRYPOINT ["java", "-jar", "app.jar"]


FROM eclipse-temurin:11

WORKDIR /app

COPY target/*.jar app.jar
ADD src/main/resources .
COPY scripts/run.sh run.sh

EXPOSE 8090

ENTRYPOINT [ "sh", "run.sh"]
