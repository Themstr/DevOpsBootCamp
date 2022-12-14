# Use the official openjdk image as the base image
FROM openjdk:11

# Set the working directory to /app
WORKDIR /app

# Copy the pom.xml and mvnw file to the working directory
COPY ./pom.xml pom.xml
COPY ./mvnw mvnw
COPY ./mvnw.cmd mvnw.cmd
COPY .mvn .mvn
# Run the Maven Wrapper to download and install the required dependencies
RUN ./mvnw -N io.takari:maven:wrapper
RUN ./mvnw dependency:resolve

# Copy the source code to the working directory
COPY src ./src

# Build the Spring Boot application
RUN ./mvnw package -DskipTests

# Expose port 8080
EXPOSE 8084

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "target/gomycode.jar"]