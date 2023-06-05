# Docker and Docker Compose installation and management guide

## Docker installation

1. Visit the official Docker website: [https://www.docker.com](https://www.docker.com)
2. Download the appropriate version of Docker for your operating system (Docker Desktop for Windows/Mac, Docker Engine for Linux).
3. Follow the installation instructions specific to your operating system.
4. Once installed, verify the installation by running the following command in the terminal:
    ```docker --version```

## Basic handling of Docker

- To download an image from a repository, use the following command:
   ```docker pull <image_name>```
   You can also specify the version of the image you want to use:
   ```docker pull <image_name>:<version>```
   Use the following command if you want to download the latest version:
   ```docker pull <image_name>:latest```

   **Be sure to replace `<image_name>` with the actual name of the image you wish to download, and `<version>` with the corresponding version tag if desired.**

- To run a container, use the following command:
   ```docker run <image>```

- To list the running containers, use the following command:
   ```docker ps```

- To stop a running container, use the following command:
   ```docker stop <container_ID>```

## Dockerfile configuration files

- Dockerfile is a configuration file used to define the Docker image. It contains a series of instructions that Docker will use to create the image.

- Below is a basic example of a Dockerfile:

```dockerfile
# base image
FROM <image_name>:<version>

# Additional instructions for image configuration
# ...

# Command to run when starting a container based on this image
CMD [<command>]
```

## Installing Docker Compose

1. Visit the official Docker Compose website: [https://docs.docker.com/compose](https://docs.docker.com/compose)
2. Download the appropriate version of Docker Compose for your operating system.
3. Follow the installation instructions specific to your operating system.
4. Once installed, verify the installation by running the following command in the terminal:
```docker-compose --version```


## Using Docker Compose

1. Create a `docker-compose.yml` file in your project directory.
2. Define the necessary services and configurations in the `docker-compose.yml` file. Here you can specify images, ports, volumes, etc.
3. Run the following command in the terminal to pull up the containers defined in the `docker-compose.yml` file:
```docker-compose up```
Make sure you are in the directory where the `docker-compose.yml` file is located

## Configuration files docker-compose.yml

- The `docker-compose.yml` file is used to define and manage multiple containers in Docker.

- Here is a basic example of a `docker-compose.yml` file:

```yaml
version: '3'

services:
<service_name>:
     image: <image_name>:<version>
     ports:
     - <host_port>:<container_port>
     volumes:
     - <path_of_volume>:<path_of_container>
     environment:
     - <environment_variable>=<value>
     networks:
     - <network_name>

networks:
<network_name>:
     # Network configuration options
     # ...

volumes:
<volume_name>:
     # Volume configuration options
     # ...
```
* Replace <service_name> with a descriptive name for your service or container.

* Replace <image_name> with the name of the Docker image you want to use, and <version> with the corresponding version tag.

* You can specify the ports you want to expose on the host and the container using the <host_port>:<container_port> syntax. For example, 8080:80 indicates that host port 8080 is mapped to container port 80.

* You can configure volumes to persist data or share files between the host and the container. Use the syntax <path_to_volume>:<path_to_container>. For example, /local/path:/container/path indicates that the host's /local/path directory will be mounted to the /container/path inside the container.

* You can define environment variables using the syntax - <environment_variable>=<value>. For example, - MYSQL_ROOT_PASSWORD=secret sets the environment variable MYSQL_ROOT_PASSWORD to the secret value.

* You can configure networks to connect containers using the networks section. You can define additional network configuration options within each network.

* You can define volumes using the volumes section. You can add additional volume configuration options within each volume.



Ready! You are now ready to start using Docker and Docker Compose in your project.

Remember to consult the official documentation