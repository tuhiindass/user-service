# Stage 1: Build the Spring Boot application (Maven)
FROM maven:3.8.7-eclipse-temurin-17 AS build
WORKDIR /app

# Copy only pom first for caching
COPY pom.xml .
RUN mvn -B dependency:resolve dependency:resolve-plugins

# Copy source code
COPY src ./src

# Build application
RUN mvn clean package -DskipTests


# Stage 2: Create the final runtime Docker image
# ❌ Avoid openjdk:17-jdk-alpine (causes SSL/musl issues)
# ✔ Use Eclipse Temurin JRE
FROM eclipse-temurin:17-jre
WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
