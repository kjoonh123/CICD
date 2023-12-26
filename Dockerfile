
# FROM amazoncorretto:17.0.7-alpine
# COPY ./*.war ./app.war
# CMD ["java", "-jar", "app.war"]


#선생님이 주신 방법
# FROM eclipse-temurin:17-jdk-jammy
# WORKDIR /app
# COPY ./navieproject/.mvn/wrapper/maven-wrapper.jar .mvn/wrapper/maven-wrapper.jar
# COPY ./navieproject/.mvn/wrapper/maven-wrapper.properties .mvn/wrapper/maven-wrapper.properties
# COPY ./navieproject/mvnw ./
# COPY ./navieproject/mvnw.cmd ./
# COPY ./navieproject/pom.xml ./
# # COPY work ./work
# RUN chmod +x ./mvnw
# RUN ./mvnw dependency:resolve
# COPY ./navieproject/src ./src
# CMD ["./mvnw", "spring-boot:run"]

# # 기본 이미지 설정
# FROM eclipse-temurin:17-jdk-jammy

# # 작업 디렉토리 설정
# WORKDIR /app

# # Maven Wrapper 복사
# COPY ./navieproject/.mvn/wrapper/maven-wrapper.jar .mvn/wrapper/maven-wrapper.jar
# COPY ./navieproject/.mvn/wrapper/maven-wrapper.properties .mvn/wrapper/maven-wrapper.properties
# COPY ./navieproject/mvnw ./
# COPY ./navieproject/mvnw.cmd ./

# # pom.xml 복사
# COPY ./navieproject/pom.xml ./

# # Maven Wrapper 실행 권한 설정 및 의존성 해결
# RUN chmod +x ./mvnw
# RUN ./mvnw dependency:resolve

# # 소스 코드 복사
# COPY ./navieproject/src ./src

# # Whatap 에이전트 설치를 위한 디렉토리 생성 및 파일 복사
# RUN mkdir -p /whatap
# COPY --from=whatap/kube_mon /data/agent/micro/whatap.agent-*.jar /whatap
# COPY ./whatap.conf /whatap/

# # 포트 8080 공개
# EXPOSE 8080

# # 애플리케이션 실행 명령어
# CMD ["java", "-javaagent:/whatap/whatap.agent-2.2.25.jar", "-Dwhatap.micro.enabled=true", "-jar", "/app/target/world.navie-0.0.1-SNAPSHOT.jar"]


# Java 17 JDK를 사용하는 기본 이미지 설정
FROM eclipse-temurin:17-jdk-jammy

# 작업 디렉토리를 '/app'으로 설정
WORKDIR /app

# Maven Wrapper 파일 복사
COPY ./navieproject/.mvn/wrapper/maven-wrapper.jar .mvn/wrapper/maven-wrapper.jar
COPY ./navieproject/.mvn/wrapper/maven-wrapper.properties .mvn/wrapper/maven-wrapper.properties
COPY ./navieproject/mvnw ./
COPY ./navieproject/mvnw.cmd ./

# 프로젝트의 pom.xml 파일 복사
COPY ./navieproject/pom.xml ./

# Maven Wrapper 실행 권한 설정 및 의존성 해결
RUN chmod +x ./mvnw
RUN ./mvnw dependency:resolve

# 프로젝트 소스 코드 복사
COPY ./navieproject/src ./src

# 애플리케이션 빌드 (JAR 파일 생성)
RUN ./mvnw package

# Whatap 에이전트 설치를 위한 디렉토리 생성 및 파일 복사
RUN mkdir -p /whatap
COPY --from=whatap/kube_mon /data/agent/micro/whatap.agent-*.jar /whatap
COPY ./whatap.conf /whatap/

# 포트 8080 공개
EXPOSE 8080

# 애플리케이션 실행 명령어
CMD ["java", "-javaagent:/whatap/whatap.agent-2.2.25.jar", "-Dwhatap.micro.enabled=true", "-jar", "/app/target/world.navie-0.0.1-SNAPSHOT.jar"]

