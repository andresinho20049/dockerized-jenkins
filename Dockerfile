FROM jenkins/jenkins:jdk17
USER root
RUN apt-get update && apt-get install -y lsb-release

#Docker
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc   https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=amd64   signed-by=/usr/share/keyrings/docker-archive-keyring.asc]   https://download.docker.com/linux/debian   bookworm stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli

USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"