
# FROM amazoncorretto:17.0.7-alpine
# COPY ./*.war ./app.war
# CMD ["java", "-jar", "app.war"]


#선생님이 주신 방법
# FROM eclipse-temurin:17-jdk-jammy
# WORKDIR /app
# COPY ./com.test/.mvn/wrapper/maven-wrapper.jar .mvn/wrapper/maven-wrapper.jar
# COPY ./com.test/.mvn/wrapper/maven-wrapper.properties .mvn/wrapper/maven-wrapper.properties
# COPY ./com.test/mvnw ./
# COPY ./com.test/mvnw.cmd ./
# COPY ./com.test/pom.xml ./
# # COPY work ./work
# RUN chmod +x ./mvnw
# RUN ./mvnw dependency:resolve
# COPY ./com.test/src ./src
# CMD ["./mvnw", "spring-boot:run"]

# 기본 이미지 설정
FROM eclipse-temurin:17-jdk-jammy

# 작업 디렉토리 설정
WORKDIR /app

# Maven Wrapper 복사
COPY ./com.test/.mvn/wrapper/maven-wrapper.jar .mvn/wrapper/maven-wrapper.jar
COPY ./com.test/.mvn/wrapper/maven-wrapper.properties .mvn/wrapper/maven-wrapper.properties
COPY ./com.test/mvnw ./
COPY ./com.test/mvnw.cmd ./

# pom.xml 복사
COPY ./com.test/pom.xml ./

# Maven Wrapper 실행 권한 설정 및 의존성 해결
RUN chmod +x ./mvnw
RUN ./mvnw dependency:resolve

# 소스 코드 복사
COPY ./com.test/src ./src

# Whatap 에이전트 설치를 위한 디렉토리 생성 및 파일 복사
RUN mkdir -p /whatap
COPY --from=whatap/kube_mon /data/agent/micro/whatap.agent-*.jar /whatap
COPY ./whatap.conf /whatap/

# 포트 8080 공개
EXPOSE 8080

# 애플리케이션 실행 명령어
CMD ["java", "-javaagent:/whatap/whatap.agent-2.0_20.jar", "-Dwhatap.micro.enabled=true", "-jar", "/app/target/world.navie-0.0.1-SNAPSHOT.jar"]

