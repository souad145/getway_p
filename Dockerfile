
# Utiliser Java 17
FROM eclipse-temurin:17-jdk-alpine

# Créer le dossier de travail
WORKDIR /app

# Copier tout le contenu du sous-dossier
COPY . .

# Construire le projet avec Maven Wrapper
RUN ./mvnw clean package -DskipTests

# Exposer le port que tu utilises (8085)
EXPOSE 8085

# Commande pour démarrer ton Spring Boot Gateway
CMD ["java", "-jar", "target/gateway-service-0.0.1-SNAPSHOT.jar"]
