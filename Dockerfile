#FROM tomcat:9-jre11-slim
#MAINTAINER gulshantk12@gmail.com
#WORKDIR /app

# Copy the WAR file into the webapps directory of Tomcat
#COPY target/shopping-cart-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/

# Optionally, expose the port your application is running on (adjust as needed)
#EXPOSE 8000


# Use the official Ubuntu image as the base image
FROM ubuntu:latest

# Install necessary tools and dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    default-jre-headless \
    curl

# Download and install Tomcat
RUN curl -O http://apache.mirrors.ionfish.org/tomcat/tomcat-9/v9.0.52/bin/apache-tomcat-9.0.52.tar.gz && \
    tar -xzvf apache-tomcat-9.0.52.tar.gz -C /opt && \
    rm apache-tomcat-9.0.52.tar.gz && \
    ln -s /opt/apache-tomcat-9.0.52 /opt/tomcat

# Remove the default ROOT application
RUN rm -rf /opt/tomcat/webapps/ROOT

# Copy the WAR file into the webapps directory
COPY target/shopping-cart-0.0.1-SNAPSHOT.war /opt/tomcat/webapps/shopping-cart-0.0.1-SNAPSHOT.war

# Expose the default Tomcat port
EXPOSE 8000

# Start Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]

