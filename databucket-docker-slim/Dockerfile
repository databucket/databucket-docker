FROM openjdk:8-slim
VOLUME /tmp

EXPOSE 8080

ENV VERSION 2.2.6
ENV TITLE Databucket
ENV DB_HOST localhost
ENV DB_PORT 3306
ENV DB_DATABASE databucket
ENV DB_USER databucket
ENV DB_PASSWORD data1234!
ENV DB_PROPERTIES ''
ENV JAR_NAME databucket-app-${VERSION}.jar

RUN adduser spring --disabled-password --gecos ""

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install wget -y

COPY /docker-entrypoint.sh /home/spring/docker-entrypoint.sh
RUN chmod +x /home/spring/docker-entrypoint.sh

RUN wget -O /home/spring/${JAR_NAME} https://github.com/databucket/databucket-app/releases/download/${VERSION}/${JAR_NAME}
RUN chown spring:spring /home/spring/${JAR_NAME}

USER spring
WORKDIR /home/spring

ENTRYPOINT ["sh", "-c", "./docker-entrypoint.sh $JAR_NAME"]