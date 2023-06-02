# Guía técnica e instrucciones

Este proyecto tiene como finalidad facilitar, especialmente a aquellos que carezcan de conocimientos informmáticos avanzados, la instalación en su máquina local o servidor web de una triada de contenedores de docker interconectados que le proporcionaran todos los microservicios necesarios para poner en marcha un portal web con WordPress.  

## Requisitos previos

- Este proyecto está concebido para ser ejecutado en un sistema operativo Linux, particularmente todo el desarrollo se ha llevado a cabo sobre Debian 11.
- No se garantiza su correcto funcionamiento en todas las distribuciones de Linux.
- Tampoco se puede garantizar su correcto funcionamiento en versiones anteriores de Debian, ya que algunas de las dependencias necesarias podría no estar disponible o llamarse de forma diferente, lo cual afectaría a la ejecución de los scripts.
- A la fecha de la publicación de este proyecto Debian 12 se encuentra en pruebas. En el momento en que sea una versión estable el autor de este proyecto actualizara el mismo, de ser necesario, para que pueda ejecutarse satisfactoriamente en esta nueva versión.

## Estructura del proyecto

    proyecto  
    ├── archivos_configuracion  
    │   ├── wp-config.php  
    │   └── my.cnf  
    ├── docker-compose.yml  
    ├── dockerfile  
    ├── install_docker_and_dependences.sh  
    └── menu_docker.sh  

- El directorio `archivos_configuracion`contiene los archivos de configuracion personalizados que van a ser copiados al conrtenedor de WordPress.
- El fichero `docker-compose.yml` contiene el código necesario para la creación de los contenedores. En este fichero podrá encontrar una serie de variables de entorno, las cuales puede modificar según sus necesidades siguiendo los comentarios que hay junto a las mismas.  
No obstante, a continuación explicaremos pormenorizadamente cada una de ellas en orden de aparición en el documento:
    
    - `WORDPRESS_DB_HOST`  -> En esta variable se almacena el nombre del contenedor o la ip del servidor del que WordPress tomará la bases datos. Por defecto es `db`, sin embargo puedes modificar este parámetro y sustituirlo por el nombre de otro contenedor de MySQL que tengas o incluso la IP de un servidor de bases de datos externo.
    