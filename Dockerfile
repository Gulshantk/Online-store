From tomcat:9-jre11-slim
MAINTAINER gulshantk12@gmail.com
WORKDIR /app

# Copy the WAR file into the webapps directory of Tomcat
COPY target/shopping-cart-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/

# Optionally, expose the port your application is running on (adjust as needed)
EXPOSE 8080

# Health check endpoint (optional, adjust as needed)
#HEALTHCHECK --interval=30s --timeout=10s CMD curl --fail http://localhost:8080/ || exit 1

# Example: Uncomment the following lines to push the image to Docker Hub
#ARG DOCKER_USERNAME
#ARG DOCKER_REPO
#ARG DOCKER_TAG

# Uncomment the following lines to push the image to Docker Hub
#RUN echo "dckr_pat_GljleFTeMlDoVts1r3jBiTxpmmg" | docker login -u "gulshantk" --password-stdin
RUN docker tag online-app:on gulshantk/online_app:image1
RUN docker push gulshantk/online_app:image1
