FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn clean install

FROM fabric8/java-alpine-openjdk8-jre:1.5
RUN mkdir -p /opt/app && \
    addgroup bennu  && \
    adduser -D -G bennu -h /opt/app -s /bin/false bennu
WORKDIR /opt/app
ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    JAVA_DEBUG= \
    JAVA_DEBUG_PORT=8787 \
    AB_OFF=true \
    JAVA_APP_JAR=app.jar \
    JAVA_APP_DIR=/opt/app \
    JAVA_OPTIONS="-Djava.security.egd=file:/dev/./urandom -Duser.timezone=America/Santiago"
COPY --from=MAVEN_TOOL_CHAIN /tmp/target/*.jar app.jar
VOLUME /tmp
EXPOSE 9000 8787
USER bennu
