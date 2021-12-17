FROM openjdk:8-jdk
ARG SOURCE_COMPAT
ARG LOG4J_VERSION
ENV PORT=8080
COPY "out/java${SOURCE_COMPAT}_log4j${LOG4J_VERSION}.jar" app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
