# Run latest version of Keycloak SSO in a RHEL7 container
FROM rhel7
MAINTAINER Ganesh R, gradhakr@nilanet.com

# Upgrade the system
RUN yum -y upgrade
RUN yum -y install wget tar gunzip

# Download OpenJDK 8
RUN yum -y install java-1.8.0-openjdk-devel

# Set the Java & Keycloak Home env variables
ENV JAVA_HOME /usr/lib/jvm/java-openjdk 
ENV KEYCLOAK_DIR /keycloak

# Download Keycloak 9.x
RUN wget --no-cookies --no-check-certificate "http://downloads.jboss.org/keycloak/1.9.2.Final/keycloak-1.9.2.Final.tar.gz" -O /tmp/keycloak.tar.gz

# Switch directory 
WORKDIR ${KEYCLOAK_DIR}

# Unzip the file into current working directory
RUN tar -xzf /tmp/keycloak.tar.gz

# Export java bin directory
RUN export PATH=${JAVA_HOME}/bin:${PATH}

# Expose port 8080 on the container
EXPOSE 8080

# Create the keycloak admin account
RUN ./keycloak-1.9.2.Final/bin/add-user.sh -r master -u admin -p admin

# Change perms for keycloak directory
RUN chmod -R 777 ./keycloak-1.9.2.Final

# Start the keycloak server
CMD ["./keycloak-1.9.2.Final/bin/standalone.sh"]
