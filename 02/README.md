# __Reto 2 - Linux - gestión de permisos__

### __Punto 1__

![Creacion de archivos](./images/creando%20archivos.png)

Se creo el directorio linux en el _home_ del usuario y dentro de este se trabajo.

Los archivos se crearon con el comando _touch_ indicando que se usen los numeros en el rango _{1..9}_.

---

### __Punto 2__

![Creacion de archivos](./images/setear%20permisos.png)

Luego se setearon los permisos de cada archivo como se indicaba en la consigna. Esto se realizo concatenando los comandos _chmod_ para cada archivo con _&&_ para poder realizarlo en una sola linea y poder realizar una unica captura de pantalla.

---

### __Punto 3__

![Creacion de archivos](./images/cambiar%20permisos.png)

Finalmente, se modificaron los permisos de los archivos con los comandos indicados en la consigna. 

---

### __Punto 4__

Roxs es la líder de un equipo de trabajo para una compañía que realiza Auditorías Externas. Él ha creado un archivo llamado _Lista_Precios_ en su directorio `/home`. El archivo es altamente confidencial, pero resulta que existe un alto riesgo de que su archivo sea vulnerado porque otros empleados utilizan su equipo al finalizar su turno. Actualmente, Roxs posee una contraseña segura, pero él necesita resguardar los datos de ese archivo y no desea que nadie más que solamente él tenga acceso al mismo. ¿Qué solución le propondrían como equipo a Roxs?

>Considere lo siguiente para solucionar el problema.
>
>Para proveer una solución apropiada para restringir accesos no autorizados al archivo, se necesita realizar lo siguiente:
>1. Identificar las medidas de seguridad a implementarse.
>1. Identificar el tipo de usuarios para quienes los permisos serán cambiados.
>1. Identificar el tipo de permiso que necesita ser cambiado.
>1. Verificar los permisos de acceso al archivo.

Siendo que la consigna del reto es la manipulacion de permisos, la medida de seguridad a implementar sera cambiar los permisos del archivo _Lista_Precios_ para que solo el usuario __Roxs__ tenga acceso a este.

Para esto se cambiaran los permisos correspondientes a __group__ y __others__ y se conservaran los de __owner__.

Se otorgaran permisos de __lectura__ y __escritura__ al usuario __owner__ del archivo, y se quitaran todos los permisos del __group__ del __owner__ y de __others__ usuarios.
Esto puede ser ralizado con el comando:

```
chmod u=rw,go= ~/Lista_Precios
```

Y para verificar los permisos del archivo:

```
ls -l ~/Lista_Precios
```

Todos estos comandos deben ser ejecutados por el usuario __Roxs__.

Esta solucion tiene como falencia el hecho que tanto el usuario __root__ como todo aquel que tenga acceso al comando __sudo__ podra manipular el archivo.

Como medida adicional de seguridad no perteneciente al ambito del problema propuesto, se podria cambiar el nombre del archivo de _Lista_Precios_ a _.Lista_precios_; lo que lo volveria __"oculto"__.

Por otro lado, el archivo podria ser comprimido y protegido con una contraseña usando el sigiente comando:

```
zip -e Lista_Precios.zip Lista_Precios
```

---

## __Conclucion__

A pesar de la comodidad para la manipulacion de los permisos atraves del los parametros alfabeticos (rwx); personalmente prefiero el uso de la notacion octal para el manejo de permisos.