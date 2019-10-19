 ; Nombre del estudiante: Sergie Salas Rojas
 ; Carnet: 2016138296
 ; Profesor: Kirstein Gätjens Soto
 ; Curso: Arquitectura de computadores
 ; Escuela de computación
 ; Fecha de entrega: 14/09/16
 ; Instituto tecnológico de Costa Rica
 ; Tarea: Estavezsilovoyahacer
 ; Tarea de varias funciones de calendario
 
 
; Manual de Usuario
; este es un programa de calendario que tiene varias funciones diversas con fechas
; para este programa se utilizo la maquina virtual DOS BOX, se recomienda tenerla para facilitar el empleo del programa
; para iniciar el programa se debe pasar el archivo a la carpeta en la que el DOS BOX esta montada
; se deben tener los TASM.EXE, TD.EXE y TLINK.EXE dentro de la carpeta del DOS BOX
; luego se debe digitar en la linea de comandos la instruccion: tasm 16138296
; esto genera el codigo objeto, luego se pone la instruccion: tlink 16138296
; este programa cuenta con 6 comandos difenrentes que se pueden utilizar son -A,-H,-D,-F,-R,-S
; con -A se despliega la ayuda, tambien se puede dejar la linea de comandos en blanco (solo con el .exe) para deplegar la ayuda
; con -H se despliega en la salida estandard una hoja de calendario del mes que se haya solicitado el formato es: 16138296 -H mes año
; con -D se despliega el dia de la semana que cae/cayo una fecha especificada en la salida estandard su formato es: 16138296 -D dia mes año
; con -F se despliega en la salida estandard el numero de dia del año que es una fecha su formato: 16138296 -F dia mes año
; con -R se despliega en la salida estandard la cantidad de dias entre dos fechas su formato: 16138296 -R dia mes año dia mes año
; con -S se despliega en la salida estandard el numero de dia del siglo que es una fecha su formato: 16138296 -S dia mes año
; no es case sensitive en ningun sentido, y estan validados los espaciadores.


;Analisis de Resultados:
;Uso de Matrices: A
;Uso de vectores: A
;Reconocimiento de comandos: A
;Obtener datos de la linea de comandos: A
;Encontrar que dia cae una fecha: A
;Imprimir hoja de calendario de un mes: A
;Encontrar e imprimir que dia de la semana fue o es una fecha:A
;Encontrar e imprimir que dia del año que es: A
;Encontrar e imprimir la diferencia entre dos  fechas: A
;Encontrar e imprimir  el dia del siglo que es: A
;Desplegar ayuda: A
;Desplegar acerca de: A
;




datos segment
domingo db "Domingo$"
lunes db "Lunes$"
martes db "Martes$"
miercoles db "Miercoles$"
jueves db "Jueves$"
viernes db "Viernes$"
sabado db "Sabado$"
enero db 05h,"enero"
febrero db 07h,"febrero"
marzo db 05h,"marzo"
abril db 05h,"abril"
mayo db 04h,"mayo"
junio db 05h,"junio"
julio db 05h,"julio"
agosto db 06h,"agosto"
setiembre db 09h, "setiembre"
septiembre db 0Ah,"septiembre"
octubre db 07h,"octubre"
noviembre db 09h, "noviembre"
diciembre db 09h, "diciembre"   
desplazamiento dw 0
numeroDelMes dw 0
boolbiciesto dw 0
boolValidaH db 1
boolSumaOResta dw 0
diaDelAnhoVar dw 0
paraRestar dw 0
paraSumar dw 0
dias dw 0
diasEnSiglo dw 0
diaActual dw 0
diaActual2 dw 0
diasEnMedio dw 0
Linea db    "__________________________________________________$" 
	DiasS db "|  Do  |  Lu  |  Ma  |  Mi  |  Ju  |  Vi  |  Sa  |$"
	matrizDias  db 0,0,0,0,0,0,0
				db 0,0,0,0,0,0,0
				db 0,0,0,0,0,0,0
				db 0,0,0,0,0,0,0
				db 0,0,0,0,0,0,0
				db 0,0,0,0,0,0,0
   diasMeses dw 31,28,31,30,31,30,31,31,30,31,30,31
   variableParaImprimir db 10 dup (?)
   comandoD  db 'A'
   mesActual db 13 dup(?)
   añoActual dw 0
   añoActual2 dw 0
   mesActual2 db 13 dup(?)
   sigloActual dw 0
   msgayuda db "Bienvenido a la ayuda para El Calendario Estavezsilovoyahacer",10,13
   db "Los comandos disponiblos son -A,-H,-D,-F,-R,-S",10,13
   db "Utilize el comando -A para desplegar esta ayuda denuevo",10,13
   db "Comando H Formato: -H mes a",164,"o, despliega el calendario del mes",10,13
   db "Comando D Formato: -D dia mes a",164,"o, despliega el dia de la semana de la fecha",10,13
   db "Comando F Formato: -F dia mes a",164,"o, despliega la cantidad de dias del a",164,"o de la",10,13,"fecha",10,13
   db "Comando R Formato: -R dia mes a",164,"o dia mes a",164,"o, despliesga la cantidad de dias ",10,13,"entre las dos fechas ingresadas",10,13
   db "Comando S Formato: -S dia mes a",164,"o, despliega la cantidad de dias del siglo de lafecha",10,13,10,13
   Msgexito db "Se completo la operacion con exito",'$'
   acercade1 db "Programa de funciones de calendario por Sergie Salas",'$'
   acercade2 db "Clase de Arquitectura de computadores, grupo:01",'$'
   errorMsgComando db "Error: Su comando no esta en mi lista",'$'
   errorMsgIntervalo db "Error: El intervalo entre fechas es demasiado grande",'$'
   errorMsgMesMal db "Error: El mes ingresado no existe",'$'
   errorMsgDia db "Error: Uno de sus dias no existe",'$'
   errorMsgMuchosCaracteres db "Error: Se dijitaron mas cosas de la cuenta",'$'
   errorMsgOF db "Error: año demasiado grande",'$'
   GrandeNumMes db "Error: El mes que escogio no tiene tantos dias",'$'
   errorMsgFaltaDatos db "Error:Faltan datos en la linea de comandos",'$'
   errorMsgNumInvalid db "Error: su a",164,"o no es valido",'$'
   errorMsgNoaño db "Error: Falta un a",164,"o en su linea de comandos",'$'
   errorMsgComandoNadaMas db "Error: Solo se puso el comando",'$'
   errorVoid db "Error: No hay nada en la linea de comando",'$'
datos ends; termina el segemento de datos

pila segment stack 'stack'

    dw 256 dup (?) ; se define la pila
    

pila ends

codigo segment; inicio del codigo

    assume  cs:codigo, ds:datos, ss:pila
	
	
	inicio:	
			
			mov ax, ds ; esta seccion mueve todos los datos que se necesitan y pone en cero los registros que se van a usar
			mov es, ax
			mov ax, datos
			mov ds, ax
			mov ax, pila
			mov ss, ax
			mov si, 82h ; se pone en el si el inicio de la linea de comandos
			mov cl, byte ptr es:[si] ; se pone en el cl el byte con el caracter actualmente en el puntero
			xor ch, ch
			xor ax,ax
			xor bx,bx
			xor di,di
			xor dx,dx
			call acercade
			call IgnorarEspacios
			call definircomando
			call IgnorarEspacios
			cmp comandoD,'H'
			jne sigCom1
			jmp ComH
			sigCom1:
			cmp comandoD,'D'
			jne sigCom2
			jmp ComD
			sigCom2:
			cmp comandoD,'F'
			jne sigCom3
			jmp ComF
			sigCom3:
			cmp comandoD,'R'
			jne sigCom4
			jmp ComR
			sigCom4:
			jmp ComS
			ComH:
			mov boolValidaH,0
			Call validaH
			call diaQueFue
			call imprimirTabla
			jmp terminarProgra
			ComD:
			mov boolValidaH,0
			call validaDia
			call IgnorarEspacios
			call validaH
			lea si, mesActual
			call numeritoDelMes
			mov ax,dias
			cmp diaActual,ax
			jbe proseguirD
			call NumMesGrande
			proseguirD:
			call diaQueFue
			call nuevalinea
			call nuevalinea
			call diaQueEs
			jmp terminarProgra
			ComF:
			mov boolValidaH,0
			call validaDia
			call IgnorarEspacios
			call validaH
			lea si, mesActual
			call numeritoDelMes
			mov ax,dias
			cmp diaActual,ax
			jbe proseguirF
			call NumMesGrande
			proseguirF:
			mov boolValidaH,0
			call diaDelAnho
			mov ax, diaDelAnhoVar
			call ConvChar
			call ImprimirVar
			jmp terminarProgra
			ComR:
			call validaDia
			call IgnorarEspacios
			call validaH
			call IgnorarEspacios
			call validaDia2
			call IgnorarEspacios
			call validaH2
			lea si, mesActual
			call numeritoDelMes
			mov ax,dias
			cmp diaActual,ax
			jbe proseguirR1
			call NumMesGrande
			proseguirR1:
			lea si, mesActual2
			call numeritoDelMes
			mov ax,dias
			cmp diaActual2,ax
			jbe proseguirR2
			call NumMesGrande
			proseguirR2:
			call diferenciaDefechas
			call ImprimirVar
			jmp terminarProgra
			ComS:
			mov boolValidaH,0
			call validaDia
			call IgnorarEspacios
			call validaH
			lea si, mesActual
			call numeritoDelMes
			mov ax,dias
			cmp diaActual,ax
			jbe proseguirS
			call NumMesGrande
			proseguirS:
			call diaEnELSiglo
			call ImprimirVar
			terminarProgra:
			call nuevalinea
			call Exito
			mov ax, 4C00h
			int 21h 
			

acercade Proc near; rutina para imprimir el acerca de
	call nuevalinea
	mov ah, 09h
	lea dx, acercade1
	int 21h
	call nuevalinea
	mov ah, 09h
	lea dx, acercade2
	int 21h
	call nuevalinea
	call nuevalinea; llama a la rutina que crea una linea en blanco
	ret
	endp
	

	
validaH proc near;funcion que valida la obtencion de un mes con un anho
	push dx
	push cx
	push bx
	push ax
	push di
	xor dx,dx
	xor di,di
	inc di
	mov byte ptr mesActual[0],0; los meses se ponene en formato like pascal asi que se empieza el primer byte en cero
	ciclomesH:
	mov al, byte ptr es:[si]
	cmp al, ' '
	je terminarmes
	cmp al,13
	je errorNoanho
	cmp al, 5Ah; se transforman las mayusculas en minusculas
	ja ingresarDato
	add al,20h
	ingresarDato:
	mov byte ptr mesActual[di],al
	inc byte ptr mesActual[0];se incrementan la catidad de bytes en el ascii
	cmp byte ptr mesActual[0],0Ah
	ja erroEnMes; error por tamanho del mes
	inc di
	inc si
	jmp ciclomesH
	erroEnMes: call errorMesErroneo
	errorNoanho:call errorFaltaAnho
	terminarmes:
	call IgnorarEspacios; se continua a detectar el anho
	mov cx,10
	xor bh,bh
	xor ax,ax
	cicloanhoH:
	mov bl, byte ptr es:[si]
	cmp bl, ' '
	je termirnarcicloanhoH
	cmp bl, 13
	je termirnarcicloanhoH
	sub bl,30h; se comvierte de ascii a su valor numerico
	js errorNumeroNo
	cmp bl,9
	ja errorNumeroNo; se comprueba que si sea un numero
	mov ax,añoActual
	mul cx
	cmp dx, 0
	jne errorOFnum
	add ax,bx
	mov añoActual,ax
	inc si
	jmp cicloanhoH
	errorNumeroNo: call errorNumInvalid
	errorOFnum: call errorOverflowNum
	termirnarcicloanhoH:
	cmp boolValidaH,1; se ve si debe o no haber algo mas en la linea de comandos
	je saltarseValidacion
	call IgnorarEspacios
	mov bl, byte ptr es:[si]
	cmp bl, 13
	je saltarseValidacion
	call errorMuchosCaracteres; si no debe y hay se manda un error
	saltarseValidacion:
	pop di
	pop ax
	pop bx
	pop cx
	pop dx
	ret	
endp	
	
validaDia proc near ; rutina que valida el dia en la linea de comandos dependiendo del mes, se valida que si sean dias aqui y luego se valida que si sea un dia valido para el mes en otra parte del codigo
	push ax
	push bx
	push cx
	push dx
	xor bx,bx
	mov bl, byte ptr es:[si]
	sub bl, 30h
	js errorEnDia
	cmp bl,9
	ja errorEnDia; se verifica que el ascii sea un valor numerico y se pasa de ascii a valor numerico al restarle 30h
	mov diaActual,bx
	inc si
	mov bl, byte ptr es:[si]
	cmp bl, ' '; se ve si es solo un digito o si puede ser que tenga dos
	je terminaValidaDia
	cmp bl, 13
	je errorFaltaDatos; error de falta de datos
	sub bl, 30h
	js errorEnDia
	cmp bl,9
	ja errorEnDia
	mov ax,diaActual; se multiplica lo que se tiene por diez y se le suma lo que viene (despues de validar de que si es un valor numerico)
	xor dx,dx
	mov cx,10
	mul cx
	add ax,bx
	mov diaActual,ax
	inc si
	cmp byte ptr es:[si],13
	je errorFaltaDatos
	cmp byte ptr es:[si],' '
	jne errorEnDia; se valida que el dia no tenga mas de dos digitos ya que ningun mes tiene mas de tres digitos
	terminaValidaDia:
	cmp diaActual,0
	je errorEnDia
	pop dx
	pop cx
	pop bx
	pop ax
	ret
	errorFaltaDatos: call errorFaltaDeDatos
	errorEnDia: call errorEnElDia
endp
	
validaH2 proc near; esta es una rutina que hace lo mismo que validaH solo que en vez de hacerlo con mesActual y añoActual lo hace para mesActual2 y añoActual2, solo se usa para ver la cantidad de dias entre dos fechas
	push dx
	push cx; Vease validaH para ver que hace esta, la logica y funcion es exatamente la misma el unico cambio son las variables destino
	push bx
	push ax
	push di
	xor dx,dx
	xor di,di
	inc di
	mov byte ptr mesActual2[0],0
	ciclomesH2:
	mov al, byte ptr es:[si]
	cmp al, ' '
	je terminarmes2
	cmp al,13
	je errorNoanho2
	cmp al, 5Ah
	ja ingresarDato2
	add al,20h
	ingresarDato2:
	mov byte ptr mesActual2[di],al
	inc byte ptr mesActual2[0]
	cmp byte ptr mesActual2[0],0Ah
	ja erroEnMes2
	inc di
	inc si
	jmp ciclomesH2
	erroEnMes2: call errorMesErroneo
	errorNoanho2:call errorFaltaAnho
	terminarmes2:
	call IgnorarEspacios
	mov cx,10
	xor bh,bh
	xor ax,ax
	cicloanhoH2:
	mov bl, byte ptr es:[si]
	cmp bl, ' '
	je termirnarcicloanhoH2
	cmp bl, 13
	je termirnarcicloanhoH2
	sub bl,30h
	js errorNumeroNo2
	cmp bl,9
	ja errorNumeroNo2
	mov ax,añoActual2
	mul cx
	cmp dx, 0
	jne errorOFnum2
	add ax,bx
	mov añoActual2,ax
	inc si
	jmp cicloanhoH2
	errorNumeroNo2: call errorNumInvalid
	errorOFnum2: call errorOverflowNum
	termirnarcicloanhoH2:
	call IgnorarEspacios
	mov bl, byte ptr es:[si]
	cmp bl, 13
	je saltarseValidacion2
	call errorMuchosCaracteres
	saltarseValidacion2:
	pop di
	pop ax
	pop bx
	pop cx
	pop dx
	ret	
endp	
	
validaDia2 proc near 
	push ax
	push bx
	push cx
	push dx
	xor bx,bx
	mov bl, byte ptr es:[si]
	sub bl, 30h
	js errorEnDia2
	cmp bl,9
	ja errorEnDia2
	mov diaActual2,bx
	inc si
	mov bl, byte ptr es:[si]
	cmp bl, ' '
	je terminaValidaDia2
	cmp bl, 13
	je errorFaltaDatos2
	sub bl, 30h
	js errorEnDia2
	cmp bl,9
	ja errorEnDia2
	mov ax,diaActual2
	xor dx,dx
	mov cx,10
	mul cx
	add ax,bx
	mov diaActual2,ax
	inc si
	cmp byte ptr es:[si],13
	je errorFaltaDatos2
	cmp byte ptr es:[si],' '
	jne errorEnDia2
	terminaValidaDia2:
	cmp diaActual,0
	je errorEnDia2
	pop dx
	pop cx
	pop bx
	pop ax
	ret
	errorFaltaDatos2: call errorFaltaDeDatos
	errorEnDia2: call errorEnElDia
endp

imprimirTabla Proc near;rutina que imprime el calendario del mes, basandose en la matriz creada previamente
	mov ah, 09h
	lea dx, linea
	int 21h
	call nuevalinea
	mov ah,09h
	lea dx, diasS
	int 21h
	call nuevalinea
	mov ah, 09h
	lea dx, linea
	int 21h
	mov cx, 42
	xor si,si
	call nuevalinea
	Tablita:
	mov ah, 02h
	mov dl, "|"
	int 21h
	mov dl, " "
	int 21h
	mov dl, " "
	int 21h
	mov al, byte ptr matrizDias[si]
	cmp al, 0
	je imprimirEspacio
	xor ah,ah
	push si
	push cx
	call ConvChar
	pop cx
	pop si
	mov ah, 09h
	lea dx, variableParaImprimir
	int 21h
	jmp continuarCicloTablita
	imprimirEspacio:
	mov ah, 02h
	mov dl, " "
	int 21h
	mov dl, " "
	int 21h
	continuarCicloTablita:
	mov ah, 02h
	mov dl, " "
	int 21h
	mov dl, " "
	int 21h
	inc si
	mov ax, cx
	mov bl,7
	div bl
	cmp ah, 1
	jne continuarLoopTablita
	mov ah, 02h
	mov dl, "|"
	int 21h
	call nuevalinea
	mov ah, 09h
	lea dx, linea
	int 21h
	call nuevalinea
	continuarLoopTablita:
	loop Tablita
	ret
endp
	
	
	
nuevalinea PROC NEAR ; agrega lineas nuevas para espacios
	mov ah, 02h; crea lineas nuevas
	mov dl, 0Ah ; pone un enter
	int 21h
	mov dl, 0Dh;pone un retorno de carro
	int 21h
	ret; regresa a donde se llamo la rutina
	ENDP
	
definircomando PROC NEAR; rutina que define el comando del programa
			jmp defEmpezar
			ayuda:
			cmp byte ptr es:[si+1],' '; se valida que el comando solo sea un caracter (va despues de ver que es -a)
			je empAyudarComando
			cmp byte ptr es:[si+1],13; se valida que el comando solo sea un caracter (va despues de ver que es -a)
			je empAyudarComando
			cmp byte ptr es:[si+1],0; se valida que el comando solo sea un caracter (va despues de ver que es -a)
			je empAyudarComando
			jne  errorEncomando
			empAyudarComando:
			call ayudar
			defEmpezar:
			mov al, byte ptr es:[si]
			cmp al,'-'; se compara que se empieze con un comando
			je seguirComando
			jmp errorComando
			seguirComando:
			inc si
			mov al, byte ptr es:[si]; se compara con los comandos disponibles y se ve si es uno valido
			cmp al, 'A'; se ve si el comando es el de ayuda para desplegarla
			je ayuda
			cmp al, 'a'
			je ayuda
			cmp al, 'H'; se ve si el comando es uno de los otros disponibles
			je comando
			cmp al, 'h'
			je comando
			cmp al, 'D'
			je comando
			cmp al, 'd'
			je comando
			cmp al, 'F'
			je comando
			cmp al, 'f'
			je comando
			cmp al, 'R'
			je comando
			cmp al, 'r'
			je comando
			cmp al, 'S'
			je comando
			cmp al, 's'
			je comando
			errorEncomando:
			call errorComando; se descubrio un comando invalido
			comando:
			cmp al, 61h
			jb moverComando
			Sub al,20h; se ve que el comando es valido pero en minuscula, por lo que se pasa a mayuscula
			moverComando:
			mov comandoD, al
			cmp byte ptr es:[si+1],13; se valida que se haya puesto algo mas que el comando
			je errorNadaComando
			cmp byte ptr es:[si+1],0; se valida que se haya puesto algo mas que el comando
			je errorNadaComando
			cmp byte ptr es:[si+1],' '; se valida que el comando sea solo una letra
			jne  errorEncomando
			inc si
			ret
			errorNadaComando:
			call errorComandoNadaMas
		
			
	endp
	
IgnorarEspacios PROC NEAR; rutina que ignora espacios en blanco 
		Ignorar:
			mov al, byte ptr es:[si]
			cmp al, ' '
			je Ignorar2
			cmp al, 11
			je Ignorar2
			cmp al, 9
			je Ignorar2
			cmp al, 13
			je posibleError
			cmp al, 0
			je posibleError
			ret
		Ignorar2:;ciclo que ignora los espacios en blanco
			inc si
			jmp Ignorar
		posibleError:; entra si la linea termino, revisa si tiene que entrar en ayuda entonces
		cmp comandoD, 'A'
		jne noayudar
		call ayudar; llama ayuda si el comando es A (sirve tanto si no se puso nada como si solo se puso -a )
		noayudar: ;tira error
		ret
	ENDP

ayudar Proc near; rutina que imprime la ayuda
			call nuevalinea
			mov ah, 09h
			lea dx, msgayuda
			int 21h
			mov ax, 4C00h
			int 21h 
	endp
ConvChar Proc near;el numero empieza en ax, esta rutina convierte el numero en ax en un strin, y lo mete a la variable para imprimir
	xor si,si
	jmp ConvHexaProces
	vuelta:
	call charts
	mov byte ptr variableParaImprimir[si],bl
	inc si
	pop ax
	cmp ax,'+'
	jne vuelta
	mov byte ptr variableParaImprimir[si],'$'
	ret
	ConvHexaProces:
		mov bx,'+'
		push bx
		xor bx, bx
		xor cx, cx
		xor dx, dx
		mov bl, 10
		inicioHexadecer:
		xor dx, dx
		Idiv bx
		push dx
		cmp ax, bx
		jae inicioHexadecer
		jmp vuelta
	endp
	
charts proc near; rutina que dependiendo del numero que haya en ax, metera en bx su correpondiente ascii (del 0 a la F)
	cmp ax,0
	je hex0
	cmp ax,1
	je hex1
	cmp ax,2
	je hex2
	cmp ax,3
	je hex3
	cmp ax,4
	je hex4
	cmp ax,5
	je hex5
	cmp ax,6
	je hex6
	cmp ax,7
	je hex7
	cmp ax,8
	je hex8
	cmp ax,9
	je hex9
	cmp ax,10
	je hexaA
	cmp ax,11
	je hexB
	cmp ax,12
	je hexC
	cmp ax,13
	je hexD
	cmp ax,14
	je hexE
	jmp hexF
	hex0: mov bx,'0'
	ret
	hex1: mov bx,'1'
	ret
	hex2: mov bx,'2'
	ret
	hex3: mov bx,'3'
	ret
	hex4: mov bx,'4'
	ret
	hex5: mov bx,'5'
	ret
	hex6: mov bx,'6'
	ret
	hex7: mov bx,'7'
	ret
	hex8: mov bx,'8'
	ret
	hex9: mov bx,'9'
	ret
	hexaA: mov bx,'A'
	ret
	hexB: mov bx,'B'
	ret
	hexC: mov bx,'C'
	ret
	hexD: mov bx,'D'
	ret
	hexE: mov bx,'E'
	ret
	hexF: mov bx,'F'
	ret
	ENDP

diaQueFue proc near; rutina que dependiendo de las variables altera la matriz para que sea correspondiente al mes que se desea
; el mes esta en mesActual
; el anho esta en añoActual
	push ax
	push dx
	push bx
	xor dx, dx
	mov ax,añoActual
	mov bx, 400
	div bx; se ejecuta un algoritmo de dezplasamiento de fechas, cada 400 anhos las fechas son iguales
	aumentar:
	cmp dx,100
	jb salirAumentar; despues de llegar lo mas cerca posible del anho con 400 se le suma un desplazamiento de 5 por cada 100 mas 
	add desplazamiento, 5
	sub dx, 100
	jmp aumentar
	salirAumentar:
	mov ax, añoActual
	xor dx,dx
	mov bx, 100
	div bx
	mov ax, dx
	cmp ax,0
	jne no99
	mov ax, 100
	no99:
	dec ax; se obtienen los ultimos dos digitos del anho menos uno (si es cero se pone un 99)
	push ax
	xor dx,dx
	mov bx,4
	div bx; se divide entre cuatro para obtener anhos bisiestos
	mov dx,ax
	pop ax
	add ax,dx; se suman los bisiestos
	xor dx,dx
	mov bx, 7
	div bx; se divide entre 7 para obtener un numero menos que 7 que sera el dia de la semana
	mov ax,dx
	push ax
	mov ax,añoActual; se pasa el anho para identificar su numero de desplazamiento
	call biciestoONo; se identifica si es biciesto
	pop ax
	lea si, mesActual
	call numeritoDelMes; se identifica el numero del mes
	add ax,numeroDelMes; se le anhade el numero del mes
	inc ax; se incrementa ax para asignarle el primero del mes
	cmp byte ptr mesActual[1],'e'
	je ignorarSumaBis; se ignora la suma del bisiesto si es enero
	cmp byte ptr mesActual[1],'f'
	je ignorarSumaBis;se ignora la suma del bisiesto si es febrero
	add ax, boolbiciesto;se le anhade si es cualquier otro mes y es bisiesto
	ignorarSumaBis:
	add ax,desplazamiento; se se anhade el desplasamiento que se calculo antes (de los 100 anhos)
	xor dx,dx
	mov bx,7
	div bx
	mov ax,dx
	push ax
	mov ax, añoActual
	xor dx,dx
	mov bx,100
	div bx
	pop ax
	cmp dx, 0;se hace una validacion de que se pierden dos o un dia en los anhos multiplos de 100
	jne ignorarthis2
	cmp boolbiciesto,1
	je solo1
	inc ax
	solo1:
	inc ax
	ignorarthis2:
	xor dx,dx
	mov bx,7
	div bx; se deja en un numero del 0 al 6 que representa de domingo a sabado
	mov ax,dx
	call meterEnMatrizFecha; se llama una funcion que altera la matriz
	pop bx
	pop dx
	pop ax
	ret
endp

meterEnMatrizFecha Proc near
	push si
	push bx
	push cx
	push dx
	mov cx,dias; se mueve al cx la cantidad de dias que tiene el mes
	xor bx,bx
	mov bl,1; se mueve el dia con el que se empieza
	mov dx,ax;se pone en el dx la columna en la que se empieza
	xor ax,ax; se empieza en la fila 0
	calculos:; ax son las filas y dx son las columnas
	push bx
	push ax
	mov bl,7
	mul bl; se multiplica la fila por la longitud de las columnas
	add ax,dx; se le suma la columna
	mov si,ax; se le pasa al si
	pop ax
	inc dx
	cmp dx,7
	jne noTerminaFila
	mov dx,0;se aumenta la fila
	inc ax
	noTerminaFila:
	pop bx
	mov byte ptr matrizDias[si],bl; se mete el valor a la matriz 
	inc bl
	loop calculos
	pop dx
	pop cx
	pop bx
	pop si
	ret
endp

numeritoDelMes proc near; rutina que obtiene de una tabla de desplazamientos el desplazamiento por mes para ver el dia de la semana que es una fecha especifica ademas de ver cuantos dias tiene cada mes
	push cx
	push di
	push ds
	pop es
	xor cx,cx
	cld
	mov cl, enero
	inc cx
	push si
	lea di,enero
	rep cmpsb
	jne seguirFeb
	pop si
	pop di
	pop cx
	mov numeroDelMes, 0
	mov dias,31
	ret
	seguirFeb:
	mov cl, febrero
	inc cx
	pop si
	push si
	lea di, febrero
	rep cmpsb
	jne seguirMar
	pop si
	pop di
	pop cx
	mov numeroDelMes, 3
	cmp boolbiciesto,1; validacion de anho bisiciesto de 28/29 dias para febrero
	je feb29
	mov dias, 28
	jmp feb28
	feb29:mov dias, 29
	feb28:ret
	seguirMar:
	mov cl, marzo
	inc cx
	pop si
	push si
	lea di, marzo
	rep cmpsb
	jne seguirAbr
	pop si
	pop di
	pop cx
	mov numeroDelMes, 3
	mov dias,31
	ret
	seguirAbr:
	mov cl, abril
	inc cx
	pop si
	push si
	lea di, abril
	rep cmpsb
	jne seguirMay
	pop si
	pop di
	pop cx
	mov numeroDelMes, 6
	mov dias,30
	ret
	seguirMay:
	mov cl, mayo
	inc cx
	pop si
	push si
	lea di, mayo
	rep cmpsb
	jne seguirJun
	pop si
	pop di
	pop cx
	mov numeroDelMes, 1
	mov dias,31
	ret
	seguirJun:
	mov cl, junio
	inc cx
	pop si
	push si
	lea di, junio
	rep cmpsb
	jne seguirJul
	pop si
	pop di
	pop cx
	mov numeroDelMes,4 
	mov dias,30
	ret
	seguirJul:
	mov cl, julio
	inc cx
	pop si
	push si
	lea di, julio
	rep cmpsb
	jne seguirAgo
	pop si
	pop di
	pop cx
	mov numeroDelMes,6
	mov dias,31
	ret
	seguirAgo:
	mov cl, agosto
	inc cx
	pop si
	push si
	lea di, agosto
	rep cmpsb
	jne seguirSet
	pop si
	pop di
	pop cx
	mov numeroDelMes,2 
	mov dias,31
	ret
	seguirSet:
	mov cl, setiembre
	inc cx
	pop si
	push si
	lea di, setiembre
	rep cmpsb
	jne seguirSep
	pop si
	pop di
	pop cx
	mov numeroDelMes,5
	mov dias,30
	ret
	seguirSep:
	mov cl, septiembre
	inc cx
	pop si
	push si
	lea di, septiembre
	rep cmpsb
	jne seguirOct
	pop si
	pop di
	pop cx
	mov numeroDelMes,5
	mov dias,30
	ret
	seguirOct:
	mov cl, octubre
	inc cx
	pop si
	push si
	lea di, octubre
	rep cmpsb
	jne seguirNov
	pop si
	pop di
	pop cx
	mov numeroDelMes,0 
	mov dias, 31
	ret
	seguirNov:
	mov cl, noviembre
	inc cx
	pop si
	push si
	lea di, noviembre
	rep cmpsb
	jne seguirDec
	pop si
	pop di
	pop cx
	mov numeroDelMes,3 
	mov dias,30
	ret
	seguirDec:
	mov cl, diciembre
	inc cx
	pop si
	push si
	lea di, diciembre
	rep cmpsb
	jne errormes
	pop si
	pop di
	pop cx
	mov numeroDelMes,5
	mov dias,31
	ret
	errormes:call errorMesErroneo
endp

biciestoONo proc near; rutina que dice si el anho en ax es bisiesto o no
	mov boolbiciesto,0
	push dx
	push bx
	push ax
    xor dx,dx
	mov bx,4
	div bx
	cmp dx,0
	je validarBici1; si se puede dividir entre 4 hay que ver si se puede dividir entre 100
	pop ax
	pop bx
	pop dx
	ret
	validarBici1:
	pop ax
	push ax
    xor dx,dx
	mov bx,100
	div bx
	cmp dx,0
	je validarBici2; si no se puede entonce es bisiesto pero si si se puede hay que ver si se puede por 400
	mov boolbiciesto,1
	pop ax
	pop bx
	pop dx
	ret
	validarBici2:
	pop ax
	push ax
    xor dx,dx
	mov bx,400
	div bx
	cmp dx,0
	je esBiciesto;si se puede por 400 es bisisesto, si no se puede no es bisiesto
	pop ax
	pop bx
	pop dx
	ret
	esBiciesto:
	mov boolbiciesto,1
	pop ax
	pop bx
	pop dx
	ret
endp

diaQueEs proc near; rutina que busca en la matriz un dia en especifico y dice que dia de la semana cae/cayo
;se tiene que haber creado la matriz primero, esta se llama despues de la rutina diaQueFue
	push ax
	push bx
	push si
	xor si,si
	mov ax,diaActual
	buscarDiaEnMaTriz:
	cmp matrizDias[si],al
	jne noEsElDia
	mov ax,si
	mov bl,7
	div bl
	mov bl,ah
	call imprimirDiaSemana; se encontro el dia, se manda a imprimir
	pop si
	pop bx
	pop ax
	ret
	noEsElDia:; se incrementa el si hasta encontrar la posicion en el vector con el valor que se busca
	inc si
	jmp buscarDiaEnMaTriz
	
endp
	
imprimirDiaSemana proc near; imprime el dia de la semana con un condigo que va del 0 al 6 (de Domingo a Sabado), se resibe en bl el valor, el 6 siempre se asume si no es del 0 al 5
	push ax
	push dx
	cmp bl,0
	jne probarL
	mov ah, 09h
	lea dx,domingo
	int 21h
	jmp termimprimmirDiaSemana
	probarL:
	cmp bl,1
	jne probarK
	mov ah, 09h
	lea dx,lunes
	int 21h
	jmp termimprimmirDiaSemana
	probarK:
	cmp bl,2
	jne probarM
	mov ah, 09h
	lea dx,martes
	int 21h
	jmp termimprimmirDiaSemana
	probarM:
	cmp bl,3
	jne probarJ
	mov ah, 09h
	lea dx,miercoles
	int 21h
	jmp termimprimmirDiaSemana
	probarJ:
	cmp bl,4
	jne probarV
	mov ah, 09h
	lea dx,jueves
	int 21h
	jmp termimprimmirDiaSemana
	probarV:
	cmp bl,5
	jne probarS
	mov ah, 09h
	lea dx,viernes
	int 21h
	jmp termimprimmirDiaSemana
	probarS:
	mov ah, 09h
	lea dx, sabado
	int 21h
	termimprimmirDiaSemana:
	pop dx
	pop ax
	ret
endp
	
diaDelAnho proc near;rutina que usando instrucciones de hileras consigue el dia del anho que es una fecha especificada en las variables de diaActual, mesActual y añoActual
	push ax
	push bx
	push cx
	push ds
	pop es
	xor bx,bx
	xor ax,ax
	cld
	mov diaDelAnhoVar,0
	xor cx,cx
	mov cl, enero
	inc cx
	lea si, mesActual
	lea di,enero
	rep cmpsb
	jne IncEne; se compara con todos los meses hasta encontrar el que es, si no es se le agrega la cantidad total de dias que tiene el mes
	jmp esDec
	IncEne:
	mov ax,word ptr diasMeses[bx]
	add diaDelAnhoVar,ax
	inc bx
	inc bx
	mov cl, febrero
	inc cx
	lea si, mesActual
	lea di,febrero
	rep cmpsb
	jne IncFeb
	jmp esDec
	IncFeb:
	mov ax,word ptr diasMeses[bx]
	add diaDelAnhoVar,ax
	inc bx
	inc bx
	mov ax,añoActual
	call biciestoONo; se tiene que añadir si es bisiesto o no
	mov ax,boolbiciesto
	add diaDelAnhoVar,ax
	mov cl, marzo
	inc cx
	lea si, mesActual
	lea di,marzo
	rep cmpsb
	jne IncMar
	jmp esDec
	IncMar:
	mov ax,word ptr diasMeses[bx]
	add diaDelAnhoVar,ax
	inc bx
	inc bx
	mov cl, abril
	inc cx
	lea si, mesActual
	lea di,abril
	rep cmpsb
	jne IncAbr
	jmp esDec
	IncAbr:
	mov ax,word ptr diasMeses[bx]
	add diaDelAnhoVar,ax
	inc bx
	inc bx
	mov cl, mayo
	inc cx
	lea si, mesActual
	lea di,mayo
	rep cmpsb
	jne IncMay
	jmp esDec
	IncMay:
	mov ax,word ptr diasMeses[bx]
	add diaDelAnhoVar,ax
	inc bx
	inc bx
	mov cl, junio
	inc cx
	lea si, mesActual
	lea di,junio
	rep cmpsb
	jne IncJun
	jmp esDec
	IncJun:
	mov ax,word ptr diasMeses[bx]
	add diaDelAnhoVar,ax
	inc bx
	inc bx
	mov cl, julio
	inc cx
	lea si, mesActual
	lea di,julio
	rep cmpsb
	jne IncJul
	jmp esDec
	IncJul:
	mov ax,word ptr diasMeses[bx]
	add diaDelAnhoVar,ax
	inc  bx
	inc bx
	mov cl, agosto
	inc cx
	lea si, mesActual
	lea di, agosto
	rep cmpsb
	jne IncAgo
	jmp esDec
	IncAgo:
	mov ax,word ptr diasMeses[bx]
	add diaDelAnhoVar,ax
	inc bx
	inc bx
	mov cl, setiembre
	inc cx
	lea si, mesActual
	lea di, setiembre
	rep cmpsb
	jne Incset
	jmp esDec
	Incset:
	mov cl, septiembre
	inc cx
	lea si, mesActual
	lea di, septiembre
	rep cmpsb
	jne Incsep
	jmp esDec
	Incsep:; validacion para si se escribe tanto setiembre como septiembre
	mov ax,word ptr diasMeses[bx]
	add diaDelAnhoVar,ax
	inc bx
	inc bx
	mov cl, octubre
	inc cx
	lea si, mesActual
	lea di, octubre
	rep cmpsb
	jne IncOct
	jmp esDec
	IncOct:
	mov ax,word ptr diasMeses[bx]
	add diaDelAnhoVar,ax
	inc bx
	inc bx
	mov cl, noviembre
	inc cx
	lea si, mesActual
	lea di, noviembre
	rep cmpsb
	jne IncNov
	jmp esDec
	IncNov:
	mov ax,word ptr diasMeses[bx]
	add diaDelAnhoVar,ax
	esDec:
	mov ax, diaActual; cuando se encuentra el mes que se busca o se llega aqui por defecto (se asume que es diciembre si asi es)se le agrega el numero de dia del mes actual y eso se guarda en la vairable
	add diaDelAnhoVar,ax
	pop cx
	pop bx
	pop ax
	ret
endp
	
diaEnELSiglo proc near; rutina que consigue que numero de dia es en el siglo
	push ax
	push bx
	push dx
	xor dx, dx
	mov ax, añoActual
	mov bx,100
	div bx
	mul bx
	mov sigloActual,ax; se pone siglo actual en el inicio del siglo
	enElSiglo:
	mov ax, sigloActual
	cmp ax, añoActual
	je salirEnSiglo
	call biciestoONo
	add diasEnSiglo,365
	mov ax, boolbiciesto
	add diasEnSiglo,ax; se le añade a la variable los dias hasta llegar al año en el que se pidio
	inc sigloActual
	jmp enElSiglo
	salirEnSiglo:
	call diaDelAnho; se calcula el numero de dia en el año que corresponde
	mov ax,diaDelAnhoVar
	add diasEnSiglo,ax; se suman los dos resultados
	mov ax,diasEnSiglo
	call ConvChar; se pasa a string
	pop dx
	pop bx
	pop ax
	ret
endp

diferenciaDefechas proc near; rutina que consigue la cantidad de dias que hay de distancia entre dos fechas
	push cx
	push ax
	push si
	push di
	push ds
	pop es
	mov ax,añoActual
	cmp ax,añoActual2
	ja alRevez; primero se ve cual de los dos años es mas grande y se pone un booleano
	mov boolSumaOResta,1
	alRevez:
	call diaDelAnho
	mov ax,diaDelAnhoVar
	mov paraRestar,ax; se calcula el numero de dia del primero y se pone en un variable
	cmp boolSumaOResta,0; si el segundo es menor que el primero se realiza un cuenta contraria
	je cicloDiasEnMedioAlRevez
	cicloDiasEnMedio:
	mov ax, añoActual
	cmp ax, añoActual2; se cuentan los dias entre el año menor y el año mayor-1
	je Ultimoanho
	call biciestoONo
	add diasEnMedio,365
	jc errorMuchoIntervalo
	mov ax, boolbiciesto
	add diasEnMedio,ax
	jc errorMuchoIntervalo
	inc añoActual
	jmp cicloDiasEnMedio
	errorMuchoIntervalo: call errorIntervaloInmenzo; si se salen del rango de word tira error
	cicloDiasEnMedioAlRevez:; se detecto que el año en segundo lugar es mas pequeño por lo que se toma alrevez
	mov ax, añoActual2
	cmp ax, añoActual; se cuentan los dias entre el año menor y el año mayor-1
	je Ultimoanho
	call biciestoONo
	add diasEnMedio,365
	jc errorMuchoIntervalo
	mov ax, boolbiciesto
	add diasEnMedio,ax
	jc errorMuchoIntervalo
	inc añoActual2
	jmp cicloDiasEnMedioAlRevez
	Ultimoanho:
	mov ax,diaActual2
	mov diaActual,ax
	xor cx,cx
	mov cl,mesActual2
	inc cx
	cld
	lea si, mesActual2
	lea di, mesActual
	rep  movsb
	call diaDelAnho
	mov ax,diaDelAnhoVar
	mov paraSumar, ax; se pasa la cantidad de dias de la segunda fecha a otra variable
	cmp boolSumaOResta,0; se ve cual se tiene que sumar y cual se tiene que restar, la fecha mas futura se suma y la fecha mas pasada se resta (la cantidad de dias)
	je HacerOpuesto
	mov ax, paraSumar
	add diasEnMedio,ax
	jc errorMuchoIntervalo
	mov ax, paraRestar
	sub diasEnMedio,ax
	jnc Nocomplementar
	not diasEnMedio; validacion cuando abos años son iguales pero las fechas no estan ordenadas cronologicamentes
	inc diasEnMedio
	Nocomplementar:
	mov ax,diasEnMedio
	call ConvChar
	jmp terminarRestaFechas
	HacerOpuesto:
	mov ax, paraRestar
	add diasEnMedio,ax
	jc errorMuchoIntervalo
	mov ax, paraSumar
	sub diasEnMedio,ax
	mov ax,diasEnMedio
	call ConvChar
	jmp terminarRestaFechas
	terminarRestaFechas:
	pop di
	pop si
	pop ax
	pop cx
	ret
endp


errorComando PROC NEAR; rutina que imprime error de comando
			call nuevalinea
			mov ah, 09h
			lea dx, errorMsgComando
			int 21h
			mov ax, 4C00h
			int 21h 
	endp
errorComandoNadaMas PROC NEAR; rutina que imprime error de que solo se puso comando
			call nuevalinea
			mov ah, 09h
			lea dx, errorMsgComandoNadaMas
			int 21h
			mov ax, 4C00h
			int 21h 
	endp
errorFaltaAnho PROC NEAR; rutina que imprime error de que falta año
			call nuevalinea
			mov ah, 09h
			lea dx, errorMsgNoaño
			int 21h
			mov ax, 4C00h
			int 21h 
	endp
errorMesErroneo PROC NEAR; rutina que imprime error en el mes
			call nuevalinea
			mov ah, 09h
			lea dx, errorMsgMesMal
			int 21h
			mov ax, 4C00h
			int 21h 
	endp
errorOverflowNum PROC NEAR; rutina que imprime error el numero es muy grande
			call nuevalinea
			mov ah, 09h
			lea dx, errorMsgOF
			int 21h
			mov ax, 4C00h
			int 21h 
	endp
	
errorNumInvalid PROC NEAR; rutina que imprime error de numero invalido
			call nuevalinea
			mov ah, 09h
			lea dx, errorMsgNumInvalid
			int 21h
			mov ax, 4C00h
			int 21h 
	endp
errorFaltaDeDatos PROC NEAR; rutina que imprime error de falta de datos en la linea de comandos
			call nuevalinea
			mov ah, 09h
			lea dx, errorMsgFaltaDatos
			int 21h
			mov ax, 4C00h
			int 21h 
	endp
	
errorEnElDia PROC NEAR; rutina que imprime error en el dia
			call nuevalinea
			mov ah, 09h
			lea dx, errorMsgDia
			int 21h
			mov ax, 4C00h
			int 21h 
	endp
	
errorMuchosCaracteres PROC NEAR; rutina que imprime error de que se puso mas cosas de las que se deberia en la linea d ecomandos
			call nuevalinea
			mov ah, 09h
			lea dx, errorMsgMuchosCaracteres
			int 21h
			mov ax, 4C00h
			int 21h 
	endp
	
NumMesGrande PROC NEAR; rutina que imprime error que el dia no pertenece al mes por ser demasiado grande
			call nuevalinea
			mov ah, 09h
			lea dx, GrandeNumMes
			int 21h
			mov ax, 4C00h
			int 21h 
	endp
	
ImprimirVar PROC NEAR; rutina que imprime la variable para impresion
			call nuevalinea
			mov ah, 09h
			lea dx, variableParaImprimir
			int 21h
			ret

	endp

Exito PROC NEAR; rutina que imprime error de comando
			call nuevalinea
			call nuevalinea
			mov ah, 09h
			lea dx, Msgexito
			int 21h
			ret
		
	endp
errorIntervaloInmenzo PROC NEAR; rutina que imprime error de intervalo entre dos fechas que no cabe en un word
			call nuevalinea
			mov ah, 09h
			lea dx, errorMsgIntervalo
			int 21h
			mov ax, 4C00h
			int 21h 
		
	endp
	
	
	

	
codigo ends
 end inicio