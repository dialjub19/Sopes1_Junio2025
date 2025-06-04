# Ejecución de archivos Bash en Linux

## ¿Qué es un archivo Bash?

Un archivo Bash es un script de texto plano que contiene comandos que pueden ser ejecutados por el intérprete de Bash en sistemas Linux.

## ¿Cómo ejecutar un archivo Bash en Linux?

1. Abre una terminal y navega a la carpeta donde está tu archivo, por ejemplo:
   ```sh
   cd /ruta/a/tu/carpeta
   ```
2. Dale permisos de ejecución al archivo (por ejemplo, para `mi_script.sh`):
   ```sh
   chmod +x mi_script.sh
   ```
   Esto permite que el sistema reconozca el archivo como ejecutable.
3. Ejecuta el archivo usando:
   ```sh
   ./mi_script.sh
   ```
   O también puedes ejecutarlo con Bash directamente:
   ```sh
   bash mi_script.sh
   ```

## Permisos necesarios

- El permiso de ejecución (`x`) es necesario para poder ejecutar el archivo directamente con `./nombre.sh`.
- Puedes ver los permisos de un archivo con:
  ```sh
  ls -l nombre.sh
  ```
- Si no tienes permiso de ejecución, usa `chmod +x nombre.sh` para otorgarlo.

## Nota

Asegúrate de que la primera línea del archivo sea:

```sh
#!/bin/bash
```

Esto indica al sistema que debe usar Bash para ejecutar el script.

## 🔗 Links de referencias

- [bash-book](https://github.com/bobbyiliev/introduction-to-bash-scripting)
- [bash-cheatsheet](https://devhints.io/bash#conditionals)
