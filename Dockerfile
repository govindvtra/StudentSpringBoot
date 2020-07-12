FROM openjdk:8-jre-slim

WORKDIR /home/gradle/src
COPY . /home/gradle/src


EXPOSE 8080

RUN mkdir /app

COPY  /home/gradle/src/build/libs/*.jar /app/spring-boot-application.jar

ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Djava.security.egd=file:/dev/./urandom","-jar","/app/spring-boot-application.jar"]
