FROM openjdk:8-alpine
VOLUME /tmp

EXPOSE 8080

ENV DB_HOST localhost
ENV DB_PORT 3306
ENV DB_DATABASE databucket
ENV DB_USER databucket
ENV DB_PASSWORD data1234!
ENV JAR_NAME databucket-app-2.2.6.jar

RUN adduser spring --disabled-password --gecos ""

RUN apk update && \
    apk upgrade

COPY /docker-entrypoint.sh /home/spring/docker-entrypoint.sh
RUN chmod +x /home/spring/docker-entrypoint.sh

COPY /${JAR_NAME} /home/spring/${JAR_NAME}
RUN chown spring:spring /home/spring/${JAR_NAME}

USER spring
WORKDIR /home/spring

ENTRYPOINT ["sh", "-c", "./docker-entrypoint.sh $JAR_NAME"]