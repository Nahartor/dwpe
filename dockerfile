# Imagen base para WordPress y MySQL
FROM wordpress:latest

# Instalar el cliente de MySQL en el contenedor de PHP
RUN docker-php-ext-install mysqli

# Copiar el archivo de configuración personalizado de WordPress
COPY ./archivos_configuracion/wp-config.php /var/www/html/wp-config.php

# Establecer permisos de directorio para WordPress
RUN chown -R www-data:www-data /var/www/html

# Copiar el archivo de configuración personalizado de MySQL
COPY ./archivos_configuracion/my.cnf /etc/mysql/my.cnf

# Generar un hash de contraseña utilizando openssl
RUN password_hash=$(openssl passwd -1 "mysql")

# Agregar el usuario con la contraseña en el contenedor
RUN useradd -m -p "$password_hash" mysql


# Establecer permisos de directorio para MySQL
RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

# Expone el puerto en el que se ejecuta WordPress
EXPOSE 80
EXPOSE 3306

# Comando para ejecutar WordPress y MySQL
CMD ["apache2-foreground"]
