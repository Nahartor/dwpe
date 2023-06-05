# Technical guide and instructions

The purpose of this project is to facilitate, especially for those who lack advanced computer skills, the installation on their local machine or web server of a triad of interconnected docker containers that will provide all the necessary microservices to launch a web portal with WordPress. .

## Previous requirements

- This project is conceived to be executed in a Linux operating system, particularly all the development has been carried out on Debian 11.
- Its correct operation is not guaranteed in all Linux distributions.
- Its correct operation cannot be guaranteed in previous versions of Debian either, since some of the necessary dependencies may not be available or may be called differently, which would affect the execution of the scripts.
- As of the publication date of this project, Debian 12 is in testing. As soon as it is a stable version, the author of this project will update it, if necessary, so that it can run satisfactorily in this new version.

## Project structure

     wfd
     ├── configuration_files
     │ ├── wp-config.php
     │ └── my.cnf
     ├── Docker_and_docker_compose_installation_and_management_guide.md
     ├── docker-compose.yml
     ├── dockerfile
     ├── Guia_de_instalación_y_manejo_de_docker_y_docker_compose.md  
     ├── install_docker_and_dependencies.sh
     ├── LICENSE_ES.md
     ├── LICENSE.md
     ├── menu_docker.sh
     ├── README_ES.md 
     └── README.md

- The `configuration_files` directory contains the custom configuration files that are going to be copied to the WordPress container.
- The `docker-compose.yml` file contains the code necessary to create the containers. In this file you will find a series of environment variables, which you can modify according to your needs by following the comments next to them.
However, below we will explain each of them in detail in order of appearance in the document:
    
   - `WORDPRESS_DB_HOST` --> This variable stores the name of the container or the IP of the server from which WordPress will take the database. By default it is `db`, however you can modify this parameter and replace it with the name of another MySQL container you have or even the IP of an external database server.
   - `WORDPRESS_DB_USER` --> The username of the database is stored in this variable. (1)
   - `WORDPRESS_DB_PASSWORD` --> This variable stores the password of the user specified in the previous variable. (2)
   - `WRODPRESS_DB_NAME` --> This variable stores the name of the database in which WordPress will store all its information. (3)
   - `MYSQL_ROOT_PASSWORD` --> The password of the database root user is stored in this variable.
   - `MYSQL_USER` --> The database username is stored in this variable. (1)
   - `MYSQL_PASSWORD` --> The password of the user specified in the previous variable is stored in this variable. (2)
   - `MYSQL_DATABASE` --> This variable stores the name of the database in which WordPress will store all its information. (3)

**IMPORTANT:** Some variables are marked with a number in parentheses. It is important that if a variable is modified, all those variables that are marked with the same number must be modified in the same way.

- The `configuration_files/wp-config.php` file contains a series of variables, which must be modified (if desired) according to the above.
   - `DB_NAME` --> This variable stores the name of the database in which WordPress will store all its information. (3)
   - `DB_USER` --> This variable stores the database username. (1)
   - `DB_PASSWORD` --> This variable stores the password of the user specified in the previous variable. (2)
   - `DB_HOST` --> This variable stores the name of the container or the IP of the server from which WordPress will take the database. By default it is `db`, however you can modify this parameter and replace it with the name of another MySQL container you have or even the IP of an external database server. (4)

## Instructions for use

1. Download this repository to your server. To do this you have several options (you can see them in the "Code" button):
    1. HTTPS: You can copy the link and (with Git installed on your machine) run `git clone <link>` to the location where you want to copy the repository (preferably `/root`).
    2. SSH: You can access the GitHub servers via ssh. To do this you must follow the following steps:
       1. If you already have an SSH key bound to GitHub for your server, skip steps 2, 3, and 4.
       2. Access your GitHub account, in the dropdown select "Settings".
       3. In the side menu, in the "Access" section, select "SSH and GPG keys".
       4. In the button "New SSH key" you can copy your SSH key. If you do not have an SSH key on your server or do not know how to generate it, visit the following link: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh- key-and-adding-it-to-the-ssh-agent
       5. Copy the text that appears in the box in the "SSH" section of the "Code" button.
       6. Run on your server, in the location where you want to copy the repository (preferably `/root`), the following command: `git clone <text_copied>`.
    3. GitHub CLI – This option is only applicable to Windows machines that have the Git console installed. Since this project runs entirely on Linux you should ignore this option.
    4. GitHub Desktop – This option is only applicable to Windows computers. Since this project runs entirely on Linux you should ignore this option.
    5. Download ZIP: You can download this repository as a compressed `.zip` file and unzip it on your server. This way you don't have to install Git. It is recommended to unzip the contents of the archive in the `/root` directory
2. Modify, if desired, the environment variables as stated in the **Project structure** point.
3. Make sure that the files present in the `project` directory belong to the user and group **root**. To do this, run the following command with superuser permissions:
    `sudo chown -R root:root ./project`
4. Make sure that the `install_docker_and_dependencies.sh` and `menu_docker.sh` files are executable files. To do this, run the following commands with superuser permissions:
    `chmod -x ./project/install_docker_and_dependencies.sh`
    `chmod -x ./project/menu_docker.sh`
5. Run the `install_docker_and_dependencies.sh` script with root permissions:
    `sudo bash ./project/install_docker_and_dependencies.sh`
6. Run the `menu_docker.sh` script with superuser permissions:
    `sudo bash ./project/menu_docker.sh`
   
    The `menu_docker.sh` script will display a menu with the following options:
    1. Build all containers: this option will execute the command `docker-compose up -d` which will build all the containers necessary for the deployment of the web portal with WordPress.
    2. Stop all containers: This option will run the `docker-compose down` command which will stop all containers.
    3. Stop a specific container: This option will allow you to stop a container at your discretion.
    4. Raise a specific container: This option will allow you to raise a container at your discretion.
    5. View container logs: Since `docker-compose up` runs in the background, you will not be able to view container logs. With this option you can load the logs.
    6. Exit: This option ends the program.
7. Select option `1` from the menu.

With this you already have a web portal running with WordPress on your server.
You can access it through your browser by typing the ip of your server (or your domain name if you have one) followed by a colon and the port to which the WordPress container is redirected, that is, port 8080*

\* If port 8080 is being used on your machine by another service, release the port or enter the `docker-compose.yml file and follow the instructions on line 8.

Below are some commands that will be useful for managing your containers, configuring WordPress, MySQL, etc.

* `docker ps`: This command shows the containers present on the system, their status and their aliases. The default alias of the WordPress container is "proyecto_wordpress_1" and that of MySQL is "proyecto_db_1", however some factor unrelated to this project could cause changes in this default value, so this command can facilitate container management and it may also be necessary to be able to execute the commands shown below.
* `docker exec -i -t <container_name> /bin/bash`: This command allows you to connect to containers and interact with them in the same way that you would with the command console of any machine. You should remember that a container uses the resources of the host system, and that a large part of its efficiency lies in having only those dependencies installed that it needs to run the service in question. Therefore, if you want to execute a specific command (such as ping) or manage a service (such as SSH or MySQL-client) you must install them first.
* `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_name>`: this command will return the IP automatically assigned to our container. This can be very useful if, for example, we want to connect via SSH from a computer that is not the Docker host (to connect from the host computer we can use the container alias).
**IMPORTANT:** The IP assigned to the container will change if we stop it and start it up again. Pay attention to this fact as it may cause the commands you are issuing to the container not to work.

If you want to know more about the operation of Docker and Docker-Compose, do not hesitate to consult the technical installation and management guide attached to this repository as well as the documentation that you can find on the official website https://docs.docker.com

## Contributions
Contributions to this project are welcome! If you want to add new functionality, fix bugs, or improve documentation, feel free to let the owner of this repository know.

## License
This project is licensed under the GNU license (see the `LICENSE.md` file for more).

## Authorship
This project has been carried out entirely by Nicolás Balboni Palma as part of the End-of-Cycle Project on Network Computer Systems Administration at the IES Ciudad Jardin (Málaga).