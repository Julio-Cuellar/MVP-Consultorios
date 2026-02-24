FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app

COPY pom.xml .
COPY common/pom.xml common/
COPY service-api/pom.xml service-api/
COPY service-impl/pom.xml service-impl/

RUN mvn -q -e -B dependency:go-offline

COPY common/src common/src
COPY service-api/src service-api/src
COPY service-impl/src service-impl/src

RUN mvn -q -e -B package -DskipTests

FROM eclipse-temurin:21-jre
WORKDIR /app

COPY --from=build /app/service-impl/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]