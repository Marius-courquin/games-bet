# Étape 1 : Builder l'application avec Maven
# Utilise Maven avec Java 23 pour builder le projet
FROM eclipse-temurin:23-jdk AS builder

# Définit le répertoire de travail
WORKDIR /app

# Copie les fichiers du projet Maven dans l'image
COPY . .

# Exécute la commande de build Maven pour créer le fichier JAR de l'application
RUN ./mvnw clean package -DskipTests

# Étape 2 : Préparer une image plus légère pour exécuter l'application
# Utilise une image légère JDK pour exécuter l'application
FROM eclipse-temurin:23-jre AS runtime

# Définit le répertoire de travail pour l'exécution
WORKDIR /app

# Copie le fichier JAR de l'application depuis l'étape précédente
COPY --from=builder /app/target/*.jar app.jar

# Expose le port 8080 pour l'application
EXPOSE 8080

# Commande pour lancer l'application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
