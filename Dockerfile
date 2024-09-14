FROM tomcat:8.0.20-jre8

# Install nano
RUN apt-get update && apt-get install -y nano

# Copy your WAR file
COPY target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
