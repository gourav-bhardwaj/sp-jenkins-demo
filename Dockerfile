FROM openjdk:8
WORKDIR '/app'
COPY ./ /app
CMD ["java", "-jar", "sp-jenkins-demo-*-SNAPSHOT.jar"]