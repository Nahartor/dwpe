# Guía técnica e instrucciones

Este proyecto tiene como finalidad facilitar, especialmente a aquellos que carezcan de conocimientos informmáticos avanzados, la instalación en su máquina local o servidor web de una triada de contenedores de docker interconectados que le proporcionaran todos los microservicios necesarios para poner en marcha un portal web con WordPress.  

## Requisitos previos

- Este proyecto está concebido para ser ejecutado en un sistema operativo Linux, particularmente todo el desarrollo se ha llevado a cabo sobre Debian 11.
- No se garantiza su correcto funcionamiento en todas las distribuciones de Linux.
- Tampoco se puede garantizar su correcto funcionamiento en versiones anteriores de Debian, ya que algunas de las dependencias necesarias podrían no estar disponibles o llamarse de forma diferente, lo cual afectaría a la ejecución de los scripts.
- A la fecha de la publicación de este proyecto Debian 12 se encuentra en pruebas. En el momento en que sea una versión estable el autor de este proyecto actualizara el mismo, de ser necesario, para que pueda ejecutarse satisfactoriamente en esta nueva versión.

## Estructura del proyecto

    proyecto  
    ├── archivos_configuracion  
    │   ├── wp-config.php  
    │   └── my.cnf  
    ├── Docker_and_docker_compose_installation_and_management_guide.md
    ├── docker-compose.yml  
    ├── dockerfile
    ├── Guia_de_instalación_y_manejo_de_docker_y_docker_compose.md   
    ├── install_docker_and_dependences.sh
    ├── LICENSE_ES.md
    ├── LICENSE.md
    ├── menu_docker.sh
    ├── README_ES.md  
    └── README.md  

- El directorio `archivos_configuracion`contiene los archivos de configuracion personalizados que van a ser copiados al conrtenedor de WordPress.
- El fichero `docker-compose.yml` contiene el código necesario para la creación de los contenedores. En este fichero podrá encontrar una serie de variables de entorno, las cuales puede modificar según sus necesidades siguiendo los comentarios que hay junto a las mismas.  
No obstante, a continuación explicaremos pormenorizadamente cada una de ellas en orden de aparición en el documento:
    
    - `WORDPRESS_DB_HOST` --> En esta variable se almacena el nombre del contenedor o la ip del servidor del que WordPress tomará la bases datos. Por defecto es `db`, sin embargo puedes modificar este parámetro y sustituirlo por el nombre de otro contenedor de MySQL que tengas o incluso la IP de un servidor de bases de datos externo.
    - `WORDPRESS_DB_USER` --> En esta variable se almacena el nombre de usuario de la base datos. (1)
    - `WORDPRESS_DB_PASSWORD` --> En esta variable se almacena la contraseña del usuario especificado en la variable anterior. (2)
    - `WRODPRESS_DB_NAME` --> En esta variable se almacena el nombre de la base de datos en la que WordPress almacenara toda su información. (3)
    - `MYSQL_ROOT_PASSWORD` --> En esta variable se almacena la contraseña del usuario root de la base de datos.
    - `MYSQL_USER` --> En esta variable se almacena el nombre de usuario de la base de datos. (1)
    - `MYSQL_PASSWORD` --> En esta variable se almacena la contraseña del usuario especificado en la variable anterior. (2)
    - `MYSQL_DATABASE` --> En esta variable se almacena el nombre de la base de datos en la que WordPress almacenará toda su información. (3)

**IMPORTANTE:** Alagunas variables estan marcadas con un número entre paréntesis. Es importante que si se modifica una variable todas aquellas variables que estén marcadas con el mismo número deben ser modificadas de igual manera.  

## Instrucciones de uso  

1. Descargue este repositorio en su servidor. Para ello tiene varias opciones (puede verlas en el botón "Code"):
   1. HTTPS: puede copiar el enlace y (teniendo Git instalado en su equipo) ejecutar `git clone <enlace>` en la ubicacion donde desee copiar el repositorio (preferiblemente `/root`).
   2. SSH: puede acceder via ssh a los servidores de GitHub. Para ello debe seguir los siguientes pasos:
      1. Si ya dispone de una clave SSH vinculada a GitHub para su servidor, ignore los pasos 2, 3 y 4.
      2. Acceda a su cuenta de GitHub, en el desplegable seleccione "Settings".
      3. En el menú lateral, en el apartado "Access" seleccione "SSH and GPG keys".
      4. En el botón "New SSH key" podrá copiar su clave SSH. Si no tiene clave SSH en su servidor o no sabe como generarla visite el siguiente enlace: https://docs.github.com/es/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
      5. Copie el texto que figura en el cuadro en el apartado "SSH" del boton "Code".
      6. Ejecute en su servidor, en la ubicacion donde desee copiar el repositorio (preferiblemente `/root`), el siguiente comando: `git clone <texto_copiado>`.
   3. GitHub CLI: esta opción solo es aplicable a equipos Windows que tengan la consola de Git instalada. Ya que este proyecto corre íntegramente en Linux usted debe ignorar esta opción.
   4. GitHub Desktop: esta opción solo es aplicable a equipos Windows. Ya que este proyecto corre íntegramente en Linux usted debe ignorar esta opción.
   5. Download ZIP: usted puede descargar este repositorio como un archivo comprimido de extension `.zip` y descomprimirlo en su servidor. De esta forma no tiene por qué instalar Git. Se recomienda descomprimir el contenido del archivo en el directorio `/root` 
2. Asegurese de que los ficheros presentes en el directorio `proyecto` pertenecen al usuario y grupo **root**. Para ello ejecute el siguiente comando con permisos de superusuario:  
   `sudo chown -R root:root ./proyecto`
3. Asegurese de que los ficheros `install_docker_and_dependences.sh` y `menu_docker.sh` sean ficheros de tipo ejecutable. Para ello ejecute los siguientes comandos con permisos de superusuario:  
   `chmod -x ./proyecto/install_docker_and_dependences.sh`  
   `chmod -x ./proyecto/menu_docker.sh`
4. Ejecute el script `install_docker_and_dependences.sh` con permisos de superusuario:  
   `sudo bash ./proyecto/install_docker_and_dependences.sh`
5. Ejecute el script `menu_docker.sh` con permisos de superusuario:  
   `sudo bash ./proyecto/menu_docker.sh`
   
   El script `menu_docker.sh` desplegará un menú con las siguientes opciones:
   1. Levantar todos los contenedores: esta opción ejecutará el comando `docker-compose up -d` lo cual levantará todos los contenedores necesarios para el despliegue del portal web con WordPress.
   2. Parar todos los contenedores: esta opción ejecutará el comando `docker-compose down` lo cual detendrá todos los contenedores.
   3. Parar un contenedor específico: esta opción le permitirá detener un contenedor a su discrección.
   4. Levantar un contenedor específico: esta opción le permitirá levantar un contenedor a su discreccón.
   5. Ver los registros de los contenedores: ya que la ejecución de `docker-compose up` se efectúa en segundo plano, usted no podra ver los logs de los contenedores. Con esta opción podrá cargar los logs.
   6. Salir: esta opción finaliza el programa.
6. Seleccione la opción `1` en el menú.

Con esto usted ya tiene un portal web corriendo con WordPress en su servidor.  
Puede acceder al mismo a traves de su navegador escribiendo la ip de su servidor (o su nombre de dominio si dispone de uno) seguido de dos puntos y el puerto al que se redirige el contenedor de WordPress, es decir el puerto 8080*

\* Si el puerto 8080 esta siendo utilizado en su maquina por otro servicio libere el puerto o ingrese en el archivo `docker-compose.yml y siga las instrucciones que figuran en la linea 8.  

A continuación se muestran algunos comandos que le serán de utilidad para gestionar sus contenedores, realizar configuraciones en WordPress, MySQL, etc. 

* `docker ps`: este comando muestra los contenedores presentes en el sistema, su estado y su alias. El alias por defecto del contenedor de WordPress es "proyecto_wordpress_1" y el de MySQL es "proyecto_db_1", sin embargo algún factor ajeno a este proyecto podría ocasionar cambios en este valor por defecto, por lo que este comando puede facilitar la gestión de los contenedores y ademas puede que sea necesario para poder ejecutar los comandos que se muestran a continuación.
* `docker exec -i -t <nombre_del_contenedor> /bin/bash`: este comando permite conectarse a los contenedores e interactuar con ellos del mismo modo en que lo haríamos con la consola de comandos de una máquina cualquiera. Debe recordar que un contenedor utiliza los recursos del sistema anfitrión y que, en gran medida, su eficiencia radica en que solo tiene instaladas aquellas dependencias que necesita para ejecutar el servicio en cuestión. Por lo tanto, si desea ejecutar un comando determinado (como por ejemlo hacer ping) o gestionar un servicio (como por ejemplo SSH o MySQL-client) deberá instalarlos previamente. 
* `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <nombre_del_contenedor>`: este comando nos devolverá la IP asignada automáticamente a nuestro contenedor. Esto puede ser de gran utilidad si, por ejemplo, queremos conectarnos via SSH desde un equipo que no sea el anfitrión de Docker (para conectarnos desde el equipo anfitrión podemos usar el alias del contenedor).  
**IMPORTANTE:** la IP asignada al contenedor cambiará si lo detenemos y lo volvemos a levantar. Preste atención a este hecho ya que puede ser la causa de que los comandos que usted esté lanzando al contenedor no funcionen.

Si desea saber más acerca del funcionamiento de Docker y Docker-Compose no dude en consultar la guía tecnica de instalación y manejo adjunta en este repositorio así como la documentación que podrá encontrar en la web oficial https://docs.docker.com

## Contribuciones
¡Las contribuciones a este proyecto son bienvenidas! Si desea agregar nuevas funcionalidades, corregir errores o mejorar la documentación, no dude en comunicarlo al propietario de este repositorio.

## Licencia
Este proyecto se encuentra bajo licencia GNU (consulte el archivo `LICENSE` para saber más).

## Autoría
Este proyecto ha sido realizado íntegramente por Nicolás Balboni Palma como parte del Proyecto de fin de ciclo de Admnistración de Sistemas Informáticos en Red en el IES Ciudad Jardin (Málaga).