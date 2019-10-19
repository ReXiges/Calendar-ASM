# Calendar-ASM
Un pequeño programa con funciones de calendario para la clase de Arquitectura de computacion
Manual de Usuario
este es un programa de calendario que tiene varias funciones diversas con fechas
para este programa se utilizo la maquina virtual DOS BOX, se recomienda tenerla para facilitar el empleo del programa
para iniciar el programa se debe pasar el archivo a la carpeta en la que el DOS BOX esta montada
se deben tener los TASM.EXE, TD.EXE y TLINK.EXE dentro de la carpeta del DOS BOX
luego se debe digitar en la linea de comandos la instruccion: tasm 16138296
esto genera el codigo objeto, luego se pone la instruccion: tlink 16138296
este programa cuenta con 6 comandos difenrentes que se pueden utilizar son -A,-H,-D,-F,-R,-S
con -A se despliega la ayuda, tambien se puede dejar la linea de comandos en blanco (solo con el .exe) para deplegar la ayuda
con -H se despliega en la salida estandard una hoja de calendario del mes que se haya solicitado el formato es: 16138296 -H mes año
con -D se despliega el dia de la semana que cae/cayo una fecha especificada en la salida estandard su formato es: 16138296 -D dia mes año
con -F se despliega en la salida estandard el numero de dia del año que es una fecha su formato: 16138296 -F dia mes año
con -R se despliega en la salida estandard la cantidad de dias entre dos fechas su formato: 16138296 -R dia mes año dia mes año
con -S se despliega en la salida estandard el numero de dia del siglo que es una fecha su formato: 16138296 -S dia mes año
no es case sensitive en ningun sentido, y estan validados los espaciadores.
