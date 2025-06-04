#!/bin/bash
# #################################################
# SCRIPT PARA AUTOMATIZAR COMANDOS BÁSICOS DE GIT
# #################################################

# Leer mensaje de commit como argumento o pedirlo
if [ -z "$1" ]; then
  read -p "Escribe el mensaje para el commit: " mensaje
else
  mensaje="$1"
fi

# Mostrar el estado del repositorio
echo ">>> Estado actual del repositorio:"
git status

# Agregar todos los cambios al área de staging
echo ">>> Agregando todos los archivos modificados..."
git add .

# Confirmar cambios con el mensaje
echo ">>> Realizando commit con el mensaje: $mensaje"
git commit -m "$mensaje"

# Obtener la rama actual
rama=$(git symbolic-ref --short HEAD)

# Subir los cambios al repositorio remoto en la rama actual
echo ">>> Subiendo a la rama remota '$rama'..."
git push origin "$rama"

echo ">>> ¡Cambios subidos con éxito a '$rama'!"
