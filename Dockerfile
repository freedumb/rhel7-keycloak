# Run latest version of Keycloak SSO in a RHEL7 container
# FROM rhel7
FROM centos:7
MAINTAINER Ganesh R, gradhakr@nilanet.com

# Upgrade the system
RUN yum -y upgrade
RUN yum -y install wget tar gunzip && yum clean all -y

# Download OpenJDK 8
RUN yum -y install java-1.8.0-openjdk-devel && yum clean all -y

# Set the Java & Keycloak Home env variables
ENV JAVA_HOME /usr/lib/jvm/java-openjdk
ENV KEYCLOAK_DIR /keycloak
ENV KEYCLOAK_VERSION 2.4.0.Final

# Download Keycloak 9.x
RUN wget --no-cookies --no-check-certificate "http://downloads.jboss.org/keycloak/${KEYCLOAK_VERSION}/keycloak-${KEYCLOAK_VERSION}.tar.gz" -O /tmp/keycloak.tar.gz

# Switch directory
WORKDIR ${KEYCLOAK_DIR}

# Unzip the file into current working directory
RUN tar -xzf /tmp/keycloak.tar.gz

# Export java bin directory
RUN export PATH=${JAVA_HOME}/bin:${PATH}

# Expose port 8080 on the container
EXPOSE 8080

# Create the keycloak admin account
RUN ./keycloak-${KEYCLOAK_VERSION}/bin/add-user-keycloak.sh -r master -u admin -p admin

# Change perms for keycloak directory
RUN chmod -R 777 ./keycloak-${KEYCLOAK_VERSION}

# Start the keycloak server.  Listen on all interfaces.
CMD ["./keycloak-2.4.0.Final/bin/standalone.sh","-b","0.0.0.0"]
