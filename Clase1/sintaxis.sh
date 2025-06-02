#!/bin/bash
# Este es un comentario de una línea
# Script que demuestra la sintaxis básica de Bash

#########################################
# 1. DECLARACIÓN DE VARIABLES
#########################################

# Para declarar variables no debe haber espacios alrededor del signo '='
nombre="Juan"
edad=25
pi=3.14

# Acceder al valor de una variable se hace con el símbolo $
echo "Hola, mi nombre es $nombre y tengo $edad años."
echo "El valor de pi es $pi"

#########################################
# 2. OPERADORES ARITMÉTICOS
#########################################

# Para hacer operaciones aritméticas simples usamos $((...))
a=10
b=5
suma=$((a + b))
resta=$((a - b))
multiplicacion=$((a * b))
division=$((a / b))

echo "Suma: $suma, Resta: $resta, Multiplicación: $multiplicacion, División: $division"

#########################################
# 3. OPERADORES DE COMPARACIÓN
#########################################

# Comparaciones numéricas
# -eq: igual      -ne: no igual
# -lt: menor que  -le: menor o igual
# -gt: mayor que  -ge: mayor o igual

if [ $a -eq $b ]; then
  echo "a es igual a b"
else
  echo "a no es igual a b"
fi

#########################################
# 4. CONDICIONALES
#########################################

# Sintaxis básica del if
if [ $edad -ge 18 ]; then
  echo "Eres mayor de edad"
else
  echo "Eres menor de edad"
fi

# if-elif-else
nota=75

if [ $nota -ge 90 ]; then
  echo "Excelente"
elif [ $nota -ge 60 ]; then
  echo "Falto poco :("
else
  echo "Reprobado"
fi

#########################################
# 5. COMPARACIONES DE CADENAS
#########################################

cadena1="hola"
cadena2="mundo"

if [ "$cadena1" = "$cadena2" ]; then
  echo "Las cadenas son iguales"
else
  echo "Las cadenas son diferentes"
fi

#########################################
# 6. BUCLES
#########################################

# Bucle for
echo "Bucle for:"
for i in 1 2 3 4 5; do
  echo "Número: $i"
done

# FOR
echo "Bucle for:"
for i in {1..5}; do
  echo "Número $i"
done

# WHILE
contador=1
echo "Bucle while:"
while [ $contador -le 3 ]; do
  echo "Contador: $contador"
  contador=$((contador + 1))
done

# UNTIL
contador=1
echo "Bucle until:"
until [ $contador -gt 3 ]; do
  echo "Contador: $contador"
  contador=$((contador + 1))
done

#########################################
# 7. FUNCIONES Y ARGUMENTOS POSICIONALES
#########################################

# Los argumentos que se le pasan a un script o función se acceden con:
# $1 = primer argumento, $2 = segundo, etc.

mi_funcion() {
  echo "Esta es una función"
  echo "Hola $1, tu edad es $2"
}

# Llamada a la función con dos argumentos:
mi_funcion "Carlos" 28

#########################################
# 8. ARRAYS
#########################################

# Declaración de un array
colores=("rojo" "verde" "azul")

# Acceder a elementos del array
echo "Primer color: ${colores[0]}"

# Recorrer el array
echo "Colores:"
for color in "${colores[@]}"; do
  echo "$color"
done

#########################################
# 9. ENTRADA DEL USUARIO CON READ
#########################################

# -p es una bandera para mostrar un mensaje al usuario antes de leer su entrada
read -p "Ingresa tu nombre: " usuario

# -s oculta la entrada del usuario (por ejemplo para contraseñas)
read -s -p "Ingresa tu contraseña: " password

echo "Hola $usuario"
echo "Contrasenia $password"

#########################################
# 10. CASE (SWITCH)
#########################################

read -p "Selecciona una opción (a/b/c): " opcion
case $opcion in
  a)
    echo "Seleccionaste A"
    ;;
  b)
    echo "Seleccionaste B"
    ;;
  c)
    echo "Seleccionaste C"
    ;;
  *)
    echo "Opción inválida"
    ;;
esac

#########################################
# 11. ARCHIVOS: CREAR, LEER, BORRAR
#########################################

# Escribir en un archivo (sobrescribe si existe)
echo "Primera línea" > archivo.txt

# Agregar al final del archivo
echo "Segunda línea" >> archivo.txt

# Leer línea por línea
echo "Leyendo archivo:"
while read linea; do
  echo "$linea"
done < archivo.txt

# Eliminar archivo
rm archivo.txt
echo "archivo eliminado exitosamente"

#########################################
# 12. ARGUMENTOS DEL SCRIPT ($1, $2...)
#########################################

# Puedes pasarle argumentos al ejecutar el script:
# ./script.sh Juan 25
# En ese caso:
# $1 = Juan
# $2 = 25

echo "Argumentos desde el script:"
echo "Nombre recibido: $1"
echo "Edad recibida: $2"

#########################################
# FIN DEL SCRIPT
#########################################

echo "Script terminado correctamente."