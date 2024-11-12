FROM maven:3.9.9-eclipse-temurin-21-alpine AS builder

WORKDIR /app/backend

COPY backend/ .

RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jre AS runtime

WORKDIR /app

COPY --from=builder /app/backend/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
