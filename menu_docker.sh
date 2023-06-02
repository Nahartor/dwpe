#!/bin/bash

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
