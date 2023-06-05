# Guía de instalación y manejo de Docker y Docker Compose

## Instalación de Docker

1. Visita el sitio web oficial de Docker: [https://www.docker.com](https://www.docker.com)
2. Descarga la versión de Docker adecuada para tu sistema operativo (Docker Desktop para Windows/Mac, Docker Engine para Linux).
3. Sigue las instrucciones de instalación específicas para tu sistema operativo.
4. Una vez instalado, verifica la instalación ejecutando el siguiente comando en la terminal:  
   ```docker --version```

## Manejo básico de Docker

- Para descargar una imagen desde un repositorio, utiliza el siguiente comando:  
  ```docker pull <nombre_de_la_imagen>```  
  También puedes especificar la versión de la imagen que quieres utilizar:  
  ```docker pull <nombre_de_la_imagen>:<version>```  
  Utiliza el siguiente comando si quieres descargar la última versión:  
  ```docker pull <nombre_de_la_imagen>:latest```  

  **Asegúrate de reemplazar `<nombre_de_la_imagen>` con el nombre real de la imagen que deseas descargar, y `<version>` con la etiqueta de versión correspondiente si lo deseas.**

- Para ejecutar un contenedor, utiliza el siguiente comando:  
  ```docker run <imagen>```

- Para listar los contenedores en ejecución, usa el siguiente comando:  
  ```docker ps```

- Para detener un contenedor en ejecución, utiliza el siguiente comando:  
  ```docker stop <ID_contenedor>```

## Archivos de configuración Dockerfile

- Dockerfile es un archivo de configuración utilizado para definir la imagen de Docker. Contiene una serie de instrucciones que Docker utilizará para crear la imagen.

- A continuación se muestra un ejemplo básico de un archivo Dockerfile:

```dockerfile
# Imagen base
FROM <nombre_de_la_imagen>:<version>

# Instrucciones adicionales para la configuración de la imagen
# ...

# Comando para ejecutar al iniciar un contenedor basado en esta imagen
CMD [<comando>]
```

## Instalación de Docker Compose

1. Visita el sitio web oficial de Docker Compose: [https://docs.docker.com/compose](https://docs.docker.com/compose)
2. Descarga la versión de Docker Compose adecuada para tu sistema operativo.
3. Sigue las instrucciones de instalación específicas para tu sistema operativo.
4. Una vez instalado, verifica la instalación ejecutando el siguiente comando en la terminal:  
```docker-compose --version```  


## Uso de Docker Compose

1. Crea un archivo `docker-compose.yml` en el directorio de tu proyecto.
2. Define los servicios y configuraciones necesarios en el archivo `docker-compose.yml`. Aquí puedes especificar imágenes, puertos, volúmenes, etc.  
3. Ejecuta el siguiente comando en la terminal para levantar los contenedores definidos en el archivo `docker-compose.yml`:  
```docker-compose up```  
Asegurate de estar en el directorio donde se encuentra el archivo `docker-compose.yml`

## Archivos de configuración docker-compose.yml

- El archivo `docker-compose.yml` es utilizado para definir y gestionar múltiples contenedores en Docker.

- A continuación se muestra un ejemplo básico de un archivo `docker-compose.yml`:

```yaml
version: '3'

services:
<nombre_del_servicio>:
    image: <nombre_de_la_imagen>:<version>
    ports:
    - <puerto_host>:<puerto_contenedor>
    volumes:
    - <ruta_del_volumen>:<ruta_del_contenedor>
    environment:
    - <variable_de_entorno>=<valor>
    networks:
    - <nombre_de_la_red>

networks:
<nombre_de_la_red>:
    # Opciones de configuración de red
    # ...

volumes:
<nombre_del_volumen>:
    # Opciones de configuración del volumen
    # ...
```  
* Reemplaza <nombre_del_servicio> con un nombre descriptivo para tu servicio o contenedor.

* Reemplaza <nombre_de_la_imagen> con el nombre de la imagen de Docker que deseas utilizar, y <version> con la etiqueta de versión correspondiente.

* Puedes especificar los puertos que deseas exponer en el host y en el contenedor utilizando la sintaxis <puerto_host>:<puerto_contenedor>. Por ejemplo, 8080:80 indica que el puerto 8080 del host se mapea al puerto 80 del contenedor.

* Puedes configurar volúmenes para persistir datos o compartir archivos entre el host y el contenedor. Utiliza la sintaxis <ruta_del_volumen>:<ruta_del_contenedor>. Por ejemplo, /ruta/local:/ruta/contenedor indica que se montará el directorio /ruta/local del host en la ruta /ruta/contenedor dentro del contenedor.

* Puedes definir variables de entorno utilizando la sintaxis - <variable_de_entorno>=<valor>. Por ejemplo, - MYSQL_ROOT_PASSWORD=secreto establece la variable de entorno MYSQL_ROOT_PASSWORD con el valor secreto.

* Puedes configurar redes para conectar contenedores utilizando la sección networks. Puedes definir opciones adicionales de configuración de red dentro de cada red.

* Puedes definir volúmenes utilizando la sección volumes. Puedes agregar opciones adicionales de configuración de volumen dentro de cada volumen.  



¡Listo! Ahora estás listo para comenzar a utilizar Docker y Docker Compose en tu proyecto.

Recuerda consultar la documentación oficial de Docker y Docker Compose para obtener más información sobre las características y funcionalidades avanzadas.

