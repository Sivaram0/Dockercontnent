FROM tomcat:9-jdk8
LABEL author="sivaramaprasaditrajula"
ADD gol Dockercontnent\gameoflife.war
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]