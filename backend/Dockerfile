# Étape 1 : Utiliser une image Maven avec JDK 21 pour builder l'application
FROM maven:3.8.5-eclipse-temurin-21 AS builder

# Définit le répertoire de travail pour le build dans /app/backend
WORKDIR /app/backend

# Copier le contenu du dossier backend uniquement
COPY backend/ .

# Exécuter la commande Maven pour builder l’application
RUN mvn clean package -DskipTests

# Étape 2 : Préparer une image légère pour exécuter l'application
FROM eclipse-temurin:21-jre AS runtime

# Définit le répertoire de travail pour l'exécution
WORKDIR /app

# Copier le fichier JAR de l’application depuis l’étape de build
COPY --from=builder /app/backend/target/*.jar app.jar

# Expose le port 8080 pour l’application
EXPOSE 8080

# Commande pour lancer l'application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
