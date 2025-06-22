# Documentación de Docker Compose - Clase6

## ¿Qué es Docker Compose?

Docker Compose es una herramienta que permite definir y ejecutar aplicaciones multicontenedor en Docker. Utilizando un archivo `docker-compose.yml`, puedes describir los servicios (por ejemplo, un backend y un frontend), sus imágenes, puertos, dependencias y más, facilitando la orquestación y el despliegue de entornos completos con un solo comando.

---

## Subir imágenes a DockerHub

1. **Inicia sesión en DockerHub:**
   ```sh
   docker login
   ```
2. **Construir imagen a partir del Dockerfile**
   ```sh
   docker build -t <nombre_imagen> .
   ```

4. **Etiqueta la imagen (si es necesario):**
   ```sh
   docker tag <nombre_imagen_local> <tu_usuario>/<nombre_imagen>:<version>
   ```

5. **Sube la imagen:**
   ```sh
   docker push <tu_usuario>/<nombre_imagen>:<version>
   ```

---

## Explicación del archivo `docker-compose.yml`

```yaml
services:
  server_py:
    image: dialjub/server:v1
    container_name: py_container
    ports: 
      - "5000:5000"

  app-web:
    image: dialjub/web:v1
    container_name: react_container
    ports: 
      - "${PORT_WEB}:5173"
    depends_on:
      - server_py
```

### Desglose de cada sección:

- **services:** Define los servicios (contenedores) que se van a ejecutar.

#### Servicio `server_py`
- **image:** Usa la imagen descargada desde Docker Hub`<tu_usuario>/<nombre_imagen>:<version>` (debe estar construida o disponible en DockerHub/local).
- **container_name:** Asigna el nombre `py_container` al contenedor.
- **ports:** Mapea el puerto 5000 del host al 5000 del contenedor (acceso externo al backend Python).

#### Servicio `app-web`
- **image:** Usa la imagen descargada desde Docker Hub`<tu_usuario>/<nombre_imagen>:<version>`.
- **container_name:** Asigna el nombre `react_container` al contenedor.
- **ports:** Mapea el puerto definido en la variable de entorno `PORT_WEB` (por defecto 5173) al puerto 5173 del contenedor (frontend React).
- **depends_on:** Indica que este servicio debe iniciarse después de que el servicio `server_py` esté listo.

---

## Comandos básicos de Docker Compose

- **Levantar los servicios:**
  ```sh
  docker-compose up
  ```
  O en segundo plano:
  ```sh
  docker-compose up -d
  ```

- **Detener los servicios:**
  ```sh
  docker-compose down
  ```

- **Ver los logs:**
  ```sh
  docker-compose logs
  ```

- **Reconstruir imágenes y levantar servicios:**
  ```sh
  docker-compose up --build
  ```

---

## ¿Cómo iniciar la app web y el server?

1. **Construye las imágenes Docker para ambos servicios:**

   Desde la carpeta de cada servicio:
   - Para el backend (server_py):
     ```sh
     docker build -t dialjub/server:v1 ./pyApp
     ```
   - Para el frontend (app-web):
     ```sh
     docker build -t dialjub/web:v1 ./web
     ```

2. **Levanta ambos servicios con Docker Compose:**
   ```sh
   docker-compose up
   ```
   O en segundo plano:
   ```sh
   docker-compose up -d
   ```

3. **Accede a las aplicaciones:**
   - Backend: http://localhost:5000
   - Frontend: http://localhost:5173 (o el puerto definido en `.env`)

---

## Resumen

- Docker Compose simplifica la gestión de múltiples contenedores.
- El archivo `docker-compose.yml` define los servicios, imágenes y puertos.
- Los comandos permiten construir, levantar, detener y monitorear los servicios fácilmente.
- Puedes subir tus imágenes a DockerHub para compartirlas o desplegarlas en otros entornos.
