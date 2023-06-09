#!/bin/bash

# Check if running as superuser
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be executed with superuser privileges." >&2
  exit 1
fi

# Update and upgrade the system
apt update
apt upgrade -y

# Install Docker
apt install docker.io -y

# Install Docker Compose
apt install docker-compose -y

echo "Installation completed."

'
A continuación podrá encontrar el código en español. Si desea usar este script en español solo tiene que borrar todo entre la primera línea del texto y la linea 23 (y también la linea 44). 
# Verificar si se está ejecutando como superusuario
if [ "$(id -u)" -ne 0 ]; then
  echo "Este script debe ser ejecutado con permisos de superusuario." >&2
  exit 1
fi


# Actualizar y actualizar el sistema
apt update
apt upgrade -y


# Instalar Docker
apt install docker.io -y


# Instalar Docker Compose
apt install docker-compose -y


echo "Instalación completada."
'