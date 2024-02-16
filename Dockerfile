
FROM openjdk:20-ea-17-jdk
VOLUME /tmp
EXPOSE 8888
ADD ./target/crud-clients-0.0.11-SNAPSHOT.jar crud.jar
ENTRYPOINT ["java", "-jar", "crud.jar"]