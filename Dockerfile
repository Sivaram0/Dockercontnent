# FROM amazoncorretto:17-alpine3.17-jdk
# LABEL author="khaja" 
# LABEL project="learning"
# ARG DOWNLOAD_URL="https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-3.1.0-SNAPSHOT.jar"
# ARG USER="spc"
# ARG GROUP="spc"
# ARG UID=1000
# ARG GID=1000
# ARG HOMEDIR="/spc"
# # creates a new group and user
# RUN addgroup -g ${GID} ${GROUP} \
#     && adduser -h ${HOMEDIR} -u ${UID} -G ${GROUP} -s /bin/bash -D ${USER}
# # switching to user spc
# USER ${USER}
# # Download the file
# ADD --chown=${USER}:${GROUP} ${DOWNLOAD_URL} ${HOMEDIR}/spring-petclinic.jar
# WORKDIR ${HOMEDIR}
# EXPOSE 8080
# CMD ["java", "-jar", "spring-petclinic.jar"]


FROM amazoncorretto:17-alpine3.17-jdk
LABEL author="sivaramaprasad"
ARG GID=1000
ARG UID=1000
ARG GROUP="spc"
ARG HOMEDIR="/spc"
ARG USER="petclinic"
ARG PORT=8080
WORKDIR ${HOMEDIR}
ARG DOWNLOAD_URL="https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-3.1.0-SNAPSHOT.jar"
RUN addgroup -g ${GID} ${GROUP} && adduser -h ${HOMEDIR} -u ${UID} -G ${GROUP} -s /bin/bash -D ${USER}
USER ${USER} 
ADD --chown=${USER}:${GROUP} ${DOWNLOAD_URL} ${HOMEDIR}/spring-petclinic-3.1.0-SNAPSHOT.jar
EXPOSE ${PORT}
CMD ["java", "-jar", "spring-petclinic-3.1.0-SNAPSHOT.jar"]


#from base image
FROM amazoncorretto:17-alpine3.17-jdk
#label the project
LABEL author="sivaramaprasaditrajula"
RUN addgroup -g 1000 spc && adduser -h /petclinic -u 1000 -G spc -s /bin/bash -D spc
USER spc
ADD --chown=spc:spc https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-3.1.0-SNAPSHOT.jar petclinic/spring-petclinic.jar
WORKDIR /petclinic
EXPOSE 8080
CMD [ "java","-jar", "spring-petclinic.jar" ]