
# FROM amazoncorretto:17.0.7-alpine
# COPY ./*.war ./app.war
# CMD ["java", "-jar", "app.war"]


#선생님이 주신 방법
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
COPY ./com.test/.mvn/wrapper/maven-wrapper.jar .mvn/wrapper/maven-wrapper.jar
COPY ./com.test/.mvn/wrapper/maven-wrapper.properties .mvn/wrapper/maven-wrapper.properties
COPY ./com.test/mvnw ./
COPY ./com.test/mvnw.cmd ./
COPY ./com.test/pom.xml ./
# COPY work ./work
RUN chmod +x ./mvnw
RUN ./mvnw dependency:resolve
COPY ./com.test/src ./src
CMD ["./mvnw", "spring-boot:run"]