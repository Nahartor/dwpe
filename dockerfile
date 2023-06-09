# Base image for WordPress and MySQL
FROM wordpress:latest

# Install the MySQL client in the PHP container.
RUN docker-php-ext-install mysqli

# Copy the custom WordPress configuration file.
COPY ./configuration_files/wp-config.php /var/www/html/wp-config.php

# Set directory permissions for WordPress.
RUN chown -R www-data:www-data /var/www/html

# Copy the custom MySQL configuration file.
COPY ./configuration_files/my.cnf /etc/mysql/my.cnf

# Generate a password hash using OpenSSL.
RUN password_hash=$(openssl passwd -1 "mysql")

# Add the user with the password to the container.
RUN useradd -m -p "$password_hash" mysql

# Create directories /var/lib/mysql and /var/run/mysqld
RUN mkdir -p /var/lib/mysql /var/run/mysqld

# Set directory permissions for MySQL.
RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

# Expose the ports for WordPress and MySQL.
EXPOSE 80
EXPOSE 3306

# Command to execute WordPress and MySQL.
CMD ["apache2-foreground"]
