# Utiliser une image Java 17
FROM eclipse-temurin:17-jdk-alpine

# Créer un dossier pour l'application
WORKDIR /app

# Copier tous les fichiers du projet
COPY . .

# Rendre le wrapper Maven exécutable
RUN chmod +x mvnw

# Construire le projet sans tests
RUN ./mvnw clean package -DskipTests

# Exposer le port que ton app utilise
EXPOSE 8085

# Lancer l'application
CMD ["java", "-jar", "target/gateway-service-0.0.1-SNAPSHOT.jar"]
