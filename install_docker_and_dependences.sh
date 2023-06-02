#!/bin/bash


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