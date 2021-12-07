FROM amazoncorretto:11 as builder
WORKDIR application
ARG JAR_FILE
COPY ${JAR_FILE} application.jar
RUN java -Djarmode=layertools -jar application.jar extract

FROM amazoncorretto:11
WORKDIR application
ARG NAME
ENV NAME=$NAME
ENV TZ="Asia/Seoul"
COPY --from=builder application/dependencies/ ./
COPY --from=builder application/spring-boot-loader/ ./
COPY --from=builder application/snapshot-dependencies/ ./
COPY --from=builder application/application/ ./
ENTRYPOINT ["java", "-Dspring.application.name=${NAME}", "org.springframework.boot.loader.JarLauncher"]
