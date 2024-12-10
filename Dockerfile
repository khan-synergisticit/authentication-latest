FROM maven:3.9.9-amazoncorretto-17 AS build

COPY src /usr/app/src
COPY pom.xml /usr/app

WORKDIR /usr/app
RUN mvn -f /usr/app/pom.xml clean install -DskipTests -U
FROM openjdk:17
COPY --from=build /usr/app/target/authentication-0.0.1-SNAPSHOT.jar .
EXPOSE 8093
ENTRYPOINT ["nohup", "java","-jar","authentication-0.0.1-SNAPSHOT.jar", "&"]