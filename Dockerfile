FROM alpine:latest AS build

WORKDIR /home/gradle/src
COPY . /home/gradle/src

FROM openjdk:8-jdk-alpine
VOLUME /tmp
EXPOSE 8000

COPY --from=build /home/gradle/src/build/libs/*.jar app.jar

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
