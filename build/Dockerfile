FROM maven:3.8.1-jdk-8 AS builder
ARG LOG4J_VERSION
ENV LOG4J_VERSION=$LOG4J_VERSION
ARG SOURCE_COMPAT
ENV SOURCE_COMPAT=$SOURCE_COMPAT
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean assembly:assembly -DdescriptorId=jar-with-dependencies

FROM scratch AS export-stage
ARG LOG4J_VERSION
ENV LOG4J_VERSION=$LOG4J_VERSION
ARG SOURCE_COMPAT
ENV SOURCE_COMPAT=$SOURCE_COMPAT
COPY --from=builder /usr/src/app/target/*with-dependencies.jar "java${SOURCE_COMPAT}_log4j${LOG4J_VERSION}.jar"
