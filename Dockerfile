FROM openjdk:11
WORKDIR /app
COPY target/gomycode.jar .
EXPOSE 8084
ENTRYPOINT ["java", "-jar", "gomycode.jar"]