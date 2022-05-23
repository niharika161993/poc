FROM maven
COPY src /home/master/test-maven-app
COPY pom.xml /home/master/test-maven-app/pom.xml
RUN mvn clean install

#package 

FROM openjdk:11
EXPOSE 8087
COPY --from=build /usr/src/app/target/test-maven-app.jar /usr/app/target/test-maven-app.jar
ENTRYPOINT ["java","-jar","/usr/app/tesy-maven-app.jar]
