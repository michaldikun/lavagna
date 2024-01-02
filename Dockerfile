FROM maven:3.8.6-openjdk-8 AS builder
WORKDIR /app
COPY ./project /app/
RUN mvn com.mycila:license-maven-plugin:format  && \
    mvn verify --fail-never

FROM openjdk:8-jre
WORKDIR /app
COPY --from=builder /app/target ./target
COPY ./entrypoint.sh .
# setting up the db 
ENV DB_DIALECT MYSQL
ENV DB_URL jdbc:mysql://mysql:3306/lavagna?useUnicode=true&characterEncoding=utf-8&useSSL=false 
ENV DB_USER root
ENV DB_PASS 12345
ENV SPRING_PROFILE dev
ENTRYPOINT [ "sh", "entrypoint.sh" ]
