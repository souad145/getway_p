# -----------------------------

# Étape 1 : Build avec Maven

# -----------------------------

FROM eclipse-temurin:17-jdk-alpine AS build

# Définir le répertoire de travail

WORKDIR /app

# Copier tous les fichiers du projet

COPY . .

# Rendre le wrapper Maven exécutable

RUN chmod +x mvnw

# Construire le projet sans tests

RUN ./mvnw clean package -DskipTests

# -----------------------------

# Étape 2 : Image finale

# -----------------------------

FROM eclipse-temurin:17-jdk-alpine

# Définir le répertoire de travail

WORKDIR /app

# Copier le jar depuis l'étape de build

COPY --from=build /app/target/gateway-0.0.1-SNAPSHOT.jar app.jar

# Exposer le port utilisé par l'application

EXPOSE 8085

# Commande pour lancer l'application

CMD ["java", "-jar", "app.jar"]
