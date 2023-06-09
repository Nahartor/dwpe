#!/bin/bash

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run with root privileges." >&2
  exit 1
fi

# Function to start all containers
start_containers() {
  docker-compose up -d
}

# Function to stop all containers
stop_containers() {
  docker-compose down
}

# Function to stop a specific container
stop_specific_container() {
  read -p "Enter the name of the container you want to stop (wordpress, db, php): " container
  docker-compose stop $container
}

# Function to start a specific container
start_specific_container() {
  read -p "Enter the name of the container you want to start (wordpress, db, php): " container
  docker-compose up -d $container
}

# Main menu
while true; do
  echo "==== Menu ===="
  echo "1. Start all containers"
  echo "2. Stop all containers"
  echo "3. Stop a specific container"
  echo "4. Start a specific container"
  echo "5. View container logs"
  echo "6. Exit"
  echo "=============="

  read -p "Select an option: " option

  case $option in
    1) start_containers ;;
    2) stop_containers ;;
    3) stop_specific_container ;;
    4) start_specific_container ;;
    5) docker-compose logs ;;
    6) exit ;;
    *) echo "Invalid option. Please select a valid option." ;;
  esac

  echo
done

'
A continuación podrá encontrar el código en español. Si desea usar este script en español solo tiene que borrar todo entre la primera línea del texto y la linea 59 (y también la linea 112). 
# Verificar si se está ejecutando como superusuario
if [ "$(id -u)" -ne 0 ]; then
  echo "Este script debe ser ejecutado con permisos de superusuario." >&2
  exit 1
fi

# Función para levantar todos los contenedores
levantar_contenedores() {
  docker-compose up -d
}

# Función para parar todos los contenedores
parar_contenedores() {
  docker-compose down
}

# Función para parar un contenedor específico
parar_contenedor_especifico() {
  read -p "Ingrese el nombre del contenedor que desea parar (wordpress, db, php): " contenedor
  docker-compose stop $contenedor
}

# Función para levantar un contenedor específico
levantar_contenedor_especifico() {
  read -p "Ingrese el nombre del contenedor que desea levantar (wordpress, db, php): " contenedor
  docker-compose up -d $contenedor
}

# Menú principal
while true; do
  echo "==== Menu ===="
  echo "1. Levantar todos los contenedores"
  echo "2. Parar todos los contenedores"
  echo "3. Parar un contenedor específico"
  echo "4. Levantar un contenedor específico"
  echo "5. Ver los registros de los contenedores"
  echo "6. Salir"
  echo "=============="

  read -p "Seleccione una opción: " opcion

  case $opcion in
    1) levantar_contenedores ;;
    2) parar_contenedores ;;
    3) parar_contenedor_especifico ;;
    4) levantar_contenedor_especifico ;;
    5) docker-compose logs ;;
    6) exit ;;
    *) echo "Opción inválida. Por favor, seleccione una opción válida." ;;
  esac

  echo
done
'