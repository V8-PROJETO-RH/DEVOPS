FROM openjdk:21-jdk-slim AS builder

WORKDIR /app

RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

RUN git clone -b dev https://github.com/V8-PROJETO-RH/BACKEND-IA.git

WORKDIR /app/BACKEND-IA/implementacao-login/login

RUN chmod +x mvnw

RUN ./mvnw clean package -DskipTests

FROM openjdk:21-jdk-slim

WORKDIR /app

COPY --from=builder /app/BACKEND-IA/implementacao-login/login/target/*.jar app.jar

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "app.jar"]
