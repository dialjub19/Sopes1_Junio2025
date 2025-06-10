# Guía de Docker y Multistage Builds

Este proyecto utiliza Docker para construir y ejecutar una aplicación Go. Aquí encontrarás información sobre los archivos Dockerfile, el concepto de multistage build y los comandos necesarios para trabajar con Docker.

---

## ¿Qué es un Dockerfile?

Un Dockerfile es un archivo de texto que contiene instrucciones para construir una imagen de Docker. Permite definir el entorno, copiar archivos, instalar dependencias y especificar cómo ejecutar la aplicación dentro de un contenedor.

---

## Multistage Build (Construcción Multietapa)

El multistage build es una técnica que permite usar varias etapas en un Dockerfile. Esto ayuda a crear imágenes más pequeñas y seguras, ya que solo se incluyen los archivos y dependencias necesarios para ejecutar la aplicación, descartando todo lo usado en la compilación.

### Ejemplo: `Dockerfile.v2`

1. **Etapa de compilación (build):**
   - Usa la imagen oficial de Go para compilar la aplicación.
   - Descarga dependencias y construye el binario.
2. **Etapa de ejecución (runtime):**
   - Usa una imagen ligera (Alpine Linux).
   - Copia solo el binario compilado y los certificados necesarios.
   - Expone el puerto y define el comando de inicio.

**Ventajas:**
- Imágenes finales más pequeñas.
- Mayor seguridad (no incluye herramientas de compilación).

---

## Comandos Docker Esenciales

### Construir una imagen

```sh
docker build -t <nombre_imagen> -f <Dockerfile> .
```

- `-t <nombre_imagen>`: Asigna un nombre y etiqueta a la imagen. Por ejemplo, `docker build -t miapp:latest .` crea una imagen llamada `miapp` con la etiqueta `latest`.
- `-f <Dockerfile>`: (Opcional) Especifica el archivo Dockerfile a usar. Si no se indica, se usa `Dockerfile` por defecto.

**Ejemplo usando multistage:**
```sh
docker build -t miapp-multistage -f Dockerfile.v2 .
```

### Listar imágenes

```sh
docker images
```

### Ejecutar un contenedor

```sh
docker run -p 6000:6000 --name <nombre_contenedor> <nombre_imagen>
```

- `-p 6000:6000`: Mapea el puerto 6000 del host al contenedor.
- `--name <nombre_contenedor>`: Asigna un nombre al contenedor.

**Ejemplo:**
```sh
docker run -p 6000:6000 --name miapp miapp-multistage
```

---

## Resumen

- Usa `Dockerfile.v2` para builds de producción eficientes.
- El flag `-t` en `docker build` sirve para nombrar y etiquetar la imagen.
- El multistage build reduce el tamaño y mejora la seguridad de la imagen final.

---

Para más información, consulta la [documentación oficial de Docker](https://docs.docker.com/engine/reference/builder/).
