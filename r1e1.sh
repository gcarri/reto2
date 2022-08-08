#!/bin/bash

# Guadamos la ruta de donde estamos parados
DIR=$(pwd)

# Creamos el directorio "foo" en el lugar donde estamos parados.
mkdir $DIR/foo

# y los subdirectorios "dummy" y "empty"
mkdir $DIR/foo/empty
mkdir $DIR/foo/dummy

# Creamos los archivos "file1.txt" y "file2.txt"
touch $DIR/foo/dummy/file1.txt
touch $DIR/foo/dummy/file2.txt

# Escribimos el "mensaje" en "file1.txt"
echo Me encanta bash\!\! > $DIR/foo/dummy/file1.txt

