FROM openjdk:8-jre-alpine
LABEL author="sivaramaprasaditrajula"
ADD gol Dockercontnent\gameoflife.war
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]