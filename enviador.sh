#!/bin/bash
#Iniciar-Reiniciar MySQL y enviar un correo.
 
SERVICIOS=(Mysqld)
 
#Funcion para iniciar/reiniciar servicios
function servicioInit() {
	if ! service  status &>/dev/null; then
		echo -n -e " Iniciando  ..."
		service  start &>/dev/null
		echo 'Ok ...'
	else
		echo -n -e "  esta ejecutandose, pero reiniciando servicio..."
		service  restart &>/dev/null
		echo 'Ok ...'
	fi
}
 
for ((i=0; i<${#SERVICIOS[*]}; i++)) do 
	#if $estado = "start"; then if [ -z  ]; then 
		echo "Verificando servicio: ${SERVICIOS[$i]} ->"
		servicioInit ${SERVICIOS[$i]}
done
 
echo "Enviando mail para soporte"
echo "Queremos informarle que el servicio de Mysql fue reiniciado Exitosamente..." |
mail -s "Succefull MySQL restarted" soporte@Sudominio.com
 
echo "enviado"
 
