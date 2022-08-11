#!/usr/bin/env bash

# Se guarda la ruta de trajo
DIR=$(pwd)/foo

# Se copia el contenido de "file1.txt" a "file2.txt"
cat $DIR/dummy/file1.txt >> $DIR/dummy/file2.txt

# Se mueve el archivo "file2.txt" al directorio "foo/empty"
mv $DIR/dummy/file2.txt $DIR/empty/file2.txt
