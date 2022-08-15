#!/usr/bin/env bash
#------------------------------------------------------
# PALETA DE COLORES
#------------------------------------------------------
#setaf para color de letras/setab: color de fondo
	purple=$(tput setaf 5);
	bg_blue=$(tput setab 4);
	reset=$(tput sgr0);
	bold=$(tput setaf bold);

#------------------------------------------------------
# DIRECTORIO DE TRABAJO
#------------------------------------------------------

proyectoActual=$(pwd);

#------------------------------------------------------
# DISPLAY MENU
#------------------------------------------------------

imprimir_menu () {
    imprimir_encabezado "                          █     █ ███████ █     █ █     █                             
                          ██   ██ █       ██    █ █     █                             
                          █ █ █ █ █       █ █   █ █     █                             
                          █  █  █ █████   █  █  █ █     █                             
                          █     █ █       █   █ █ █     █                             
                          █     █ █       █    ██ █     █                             
                          █     █ ███████ █     █  █████                              
                                                                                      
   █████  █     █    █    █       █       ███████ █     █  █████  ███████     █████   
  █     █ █     █   █ █   █       █       █       ██    █ █     █ █          █     █  
  █       █     █  █   █  █       █       █       █ █   █ █       █                █  
  █       ███████ █     █ █       █       █████   █  █  █ █  ████ █████       █████   
  █       █     █ ███████ █       █       █       █   █ █ █     █ █          █        
  █     █ █     █ █     █ █       █       █       █    ██ █     █ █          █        
   █████  █     █ █     █ ███████ ███████ ███████ █     █  █████  ███████    ███████  ";  
    
    echo -e "\tEl directorio de trabajo es:";
    echo -e "\t$proyectoActual";

    echo -e "";
    echo -e "\tOpciones:";
    echo "";
    echo -e "\ta.  Ejecutar script Ejercicio 1 - Manejo de archivos";
    echo -e "\tb.  Ejecutar script Ejercicio 2 - Manejo de contenido de archivos";
    echo -e "\tc.  Ejecutar script Ejercicio 3 - Argumentos del script";
    echo -e "\td.  Ejecutar script Ejercicio 4 - Opcional";
    echo "";
    echo -e "\tq.  Salir";
    echo "";
    echo -e "Escriba la opción y presione ENTER";
}

#------------------------------------------------------
# FUNCTIONES AUXILIARES
#------------------------------------------------------

imprimir_encabezado () {
    clear;
    #Se le agrega formato a la fecha que muestra
    #Se agrega variable $USER para ver que usuario está ejecutando
    echo -e "`date +"%d-%m-%Y %T" `\t\t\t\t\t\t USERNAME:$USER";
    echo "";
    #Se agregan colores a encabezado
    echo -e "${bg_blue}${purple}${bold}╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍${reset}";
    echo -e "${bold}${bg_blue}${purple}$1${reset}";
    echo -e "${bg_blue}${purple}${bold}╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍${reset}";
    echo "";
}

esperar () {
    echo "";
    echo -e "Presione enter para continuar";
    read ENTER ;
}

malaEleccion () {
    echo -e "Selección Inválida ..." ;
}

decidir () {
	echo $1;
	while true; do
		echo "desea ejecutar? (s/n)";
    		read respuesta;
    		case $respuesta in
        		[Nn]* ) break;;
       			[Ss]* ) eval $1
				break;;
        		* ) echo "Por favor tipear S/s ó N/n.";;
    		esac
	done
}

#------------------------------------------------------
# FUNCTIONES del MENU
#------------------------------------------------------

a_funcion () {
  	imprimir_encabezado "            Opción a.                                                                 
                Ejercicio 1 - Manejo de archivos                                      ";
    decidir "./scripts/r1e1.sh";
}

b_funcion () {
   	imprimir_encabezado "            Opción b.                                                                 
                Ejercicio 2 - Manejo de contenido de archivos                         ";
    decidir "./scripts/r1e2.sh";

}

c_funcion () {
   	imprimir_encabezado "            Opción c.                                                                 
                Ejercicio 3 - Argumentos del script                                   ";
   	echo -e "Ingrese un mensaje"
    read mensaje;
    decidir "./scripts/r1e3.sh $mensaje";
}

d_funcion () {
    imprimir_encabezado "            Opción d.                                                                 
                Ejercicio 4 - Opcional                                                ";
    echo -e "Ingrese una URL a descargar"
    read url;
    echo -e "Ingrese el nombre con que guardar el archivo"
    read file;
    echo -e "Ingrese una palabra a buscar"
    read search;
    decidir "./scripts/r1e4.sh $url $file $search";
}

q_funcion () {
	clear;
	exit;
}

#------------------------------------------------------
# LOGICA PRINCIPAL
#------------------------------------------------------

while  true
do
    # 1. mostrar el menu
    imprimir_menu;
    # 2. leer la opcion del usuario
    read opcion;

    case $opcion in
        a|A) a_funcion;;
        b|B) b_funcion;;
        c|C) c_funcion;;
        d|D) d_funcion;;
        q|Q) q_funcion;;

        *) malaEleccion;;
    esac
    esperar;
done
