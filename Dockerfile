FROM ubuntu:latest AS buid

RUN apt-get update
RUN apt-get install openjdk17-jdk -y

COPY . .

RUN apt-get install maven -y
RUN mvn clean install

EXPOSE 8080

COPY --chown=build /target/todolist-1.0.0.jar app.jar

CMD [ "java", "-jar", "app.jar" ]