obj-m += tiempoArranque.o # obj-m es una variable que contiene el nombre del modulo a compilar

all: # all es una regla que se ejecuta por defecto si no se especifica una regla
# Se compila el modulo
# Paso a paso:
# 1. Se ejecuta el comando make en el directorio /lib/modules/$(shell uname -r)/build
# 2. Se ejecuta el comando make en el directorio actual (PWD) con la regla modules
# 3. Se compila el modulo arranque.c

	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules 

clean: # clean es una regla que se ejecuta para limpiar los archivos generados por la compilacion
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
