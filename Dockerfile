# -----------------------------

# Étape 1 : Build avec Maven

# -----------------------------

FROM eclipse-temurin:17-jdk-alpine AS build

WORKDIR /app

COPY . .

RUN chmod +x mvnw

# Construire le projet sans tests

RUN ./mvnw clean package -DskipTests

# -----------------------------

# Étape 2 : Image finale

# -----------------------------

FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copier le jar correct depuis l'étape de build

COPY --from=build /app/target/gatway-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8085

CMD ["java", "-jar", "app.jar"]
