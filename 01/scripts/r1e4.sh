#!/usr/bin/env bash

# Checkeamos que se hayan recivido todos los parametros requeridos
if [[ $# -eq 3 ]]; then
   URL=$1
   FILE=$2
   SEARCH=$3
else
   echo -e "\nr1e4.sh - Descarga un archivo de una direccion web y busca una palabra en el. Luego imprime en pantalla los numeros de linea donde se encontro.

  r1e4.sh <URL> <file> <search> 
    <URL> - Direccion web de donde descargar el archivo
    <file> - Nombre con que se guardara el archivo
    <search> - Palabra a buscar el el archivo descargado\n"
   exit
fi

# Guadamos la ruta de donde estamos parados
DIR=$(pwd)

# Descargamos el archivo de "URL" y lo guardamos en "FILE"
curl --silent $URL -o $DIR/$FILE

# Realizamos la busqueda de "SEARCH" en "FILE" e imprimimos en pantalla el nro de linea de las ocurrencias
grep -n $SEARCH $DIR/$FILE | cut -d":" -f1 | less
