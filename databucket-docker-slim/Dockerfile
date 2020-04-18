FROM openjdk:8-slim
VOLUME /tmp

EXPOSE 8080

ENV DB_HOST localhost
ENV DB_PORT 3306
ENV DB_DATABASE databucket
ENV DB_USER databucket
ENV DB_PASSWORD data1234!
ENV JAR_NAME databucket-app-2.2.6.jar

RUN adduser spring --disabled-password --gecos ""

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install wget -y

COPY /docker-entrypoint.sh /home/spring/docker-entrypoint.sh
RUN chmod +x /home/spring/docker-entrypoint.sh

RUN wget -O /home/spring/databucket-app-2.2.6.jar https://github.com/databucket/databucket-app/releases/download/2.2.6/databucket-app-2.2.6.jar
RUN chown spring:spring /home/spring/${JAR_NAME}

USER spring
WORKDIR /home/spring

ENTRYPOINT ["sh", "-c", "./docker-entrypoint.sh $JAR_NAME"]