FROM openjdk:8-alpine
VOLUME /tmp

EXPOSE 8080

ENV DB_HOST localhost
ENV DB_PORT 3306
ENV DB_DATABASE databucket
ENV DB_USER databucket
ENV DB_PASSWORD data1234!
ENV JAR_NAME databucket-app-2.2.5.jar

RUN adduser spring --disabled-password --gecos ""

RUN apk update && \
    apk upgrade && \
    apk add ca-certificates wget && \
    update-ca-certificates

COPY /docker-entrypoint.sh /home/spring/docker-entrypoint.sh
RUN chmod +x /home/spring/docker-entrypoint.sh

RUN wget -O /home/spring/databucket-app-2.2.5.jar https://github.com/databucket/databucket-app/releases/download/2.2.5/databucket-app-2.2.5.jar
RUN chown spring:spring /home/spring/${JAR_NAME}

USER spring
WORKDIR /home/spring

ENTRYPOINT ["sh", "-c", "./docker-entrypoint.sh $JAR_NAME"]