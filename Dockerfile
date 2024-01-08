FROM tomcat:9-jdk8
LABEL author="siva"
EXPOSE 8080
ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
WORKDIR /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic-3.1.0-SNAPSHOT.jar"]
# FROM amazoncorretto:17-alpine3.17-jdk
# LABEL author="khaja" 
# LABEL project="learning"
# ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-3.1.0-SNAPSHOT.jar /spc/spring-petclinic-3.1.0-SNAPSHOT.jar
# WORKDIR /spc
# EXPOSE 8080
# CMD ["java", "-jar", "spring-petclinic-3.1.0-SNAPSHOT.jar"]