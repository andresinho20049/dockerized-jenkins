# Dockerized Jenkins Project
This is a Dockerized Jenkins project that uses Dockerfile, Docker Compose, and Containerd to run a self-contained Jenkins instance.

## Overview
The goal of this project is to create a Docker image for Jenkins that can be easily deployed and managed in a cloud or on-premises environment. The image includes the following components:

* **Dockerfile**: The main Dockerfile used to build the base image.
* **Docker-Compose**: A docker compose with the user and volume privilege settings to allow running docker commands in pipelines, for example: docker build -t {image}

![Preview](https://github.com/andresinho20049/dockerized-jenkins/blob/main/preview.gif)

## Getting Started
1. Clone this repository: `git clone https://github.com/andresinho20049/dockerized-jenkins.git`
2. In the project folder, run the command:
    ```base
    docker compose up
    ```
3. Once finished, access `http://localhost:8080` in the browser
---
> On first access, you will need to enter the admin code, which will be available in the console log, if you have run the container in the background, exec:
> 1. `docker ps`
> 2. `docker logs {container_id}`

## Running Docker Commands within Jenkins
One of the key features of our Dockerized Jenkins project is its ability to execute Docker commands directly from within Jenkins pipelines. Since we've built the Jenkins image with Docker installed, it's possible to run `docker` commands just like you would on your local machine.

The secret lies in the `Docker Compose` configuration, which sets up volumes that allow Docker commands to be executed seamlessly within the container. By mounting the Jenkins workspace and configuration files as volumes from the host machine, we create a self-contained environment where Docker can run without issues.

### Example Use Case: Running `docker build`

As an example, let's say you want to build a Docker image using Jenkins pipelines. You can simply add the following command to your pipeline:
```groovy
sh 'docker build -t my-image'
```
This will execute the `docker build` command within the container, building the specified image without requiring any additional configuration.

### Benefits

By enabling Docker commands to be executed within Jenkins, this project provides several benefits:

* **Simplified Pipeline Development**: Developers can focus on writing pipeline code rather than manually managing dependencies and environment setup.
* **Increased Flexibility**: With Docker available within Jenkins, you can use various Docker images as build tools or run custom containers for specific tasks.
* **Streamlined CI/CD Pipelines**: By integrating Docker commands directly into pipelines, you can create more efficient and automated workflows.

Overall, this project's ability to execute Docker commands within Jenkins makes it an ideal solution for teams looking to streamline their continuous integration and delivery processes.

## Persistent Jenkins Configuration

In our **Dockerized Jenkins** project, we configured `Docker Compose` to mount volumes from the host machine to the Jenkins container. This ensures that sensitive configuration files, such as pipeline scripts and plugin configurations, are persisted even if the server crashes or the Jenkins container is stopped or restarted.

By mounting `/var/jenkins_home` as volumes, we ensure that:

* **Configuration files**: The Jenkins `config.xml` file, containing important configurations, remains intact.

* **Pipeline scripts**: Stored pipeline scripts are preserved.

* **Plugin data**: Plugin and cache data is retained.

This means that even if the container is restarted or deleted, all of your Jenkins configurations remain safe, ensuring a seamless recovery process. This level of persistence allows for maximum uptime and reduced downtime, making it an ideal solution for production environments.

The docker volume can be saved in a storage for greater security, such as S3.

## :copyright: Copyright
**Developed by** [Andresinho20049](https://andresinho20049.com.br/) \
**Project**: Dockerized Jenkins \
Our Dockerized Jenkins project utilizes Docker to run a self-contained Jenkins environment. Jenkins pipelines can execute `docker` commands directly using volumes configured in `Docker Compose`, ensuring seamless execution of build, test, and deployment processes.

Sensitive data persists even in case of container restarts or failures due to carefully designed volume configurations. This ensures maximum uptime and reduced downtime.
