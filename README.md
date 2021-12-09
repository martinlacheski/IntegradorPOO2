# Sistema de Reservas de Habitaciones

Este repositorio contiene el trabajo integrador refererido a la cátegra Programación Orientada a Objetos II de la carrera de Licenciatura en Sistemas.
Dicho sistema cumplirá el propósito de reservar habitaciones en un complejo de cabañas para diferentes huespedes permitiendo la carga de los datos de este último como tambien la carga de habitaciones, empleados, tipos de habitaciones, etc.
<br>
A continuación se detallan las tecnologias a usar: 

- **JSP** (JavaServer Pages) para front-end.
- **Boostrap** y **Jquery** para hacer uso de plantillas pre-diseñadas.
- **JPA** (Java Persistence API) para la persistencia de datos.Z
- **MySQL** como motor de base de datos. 
- **Java Servlets** como gestor de vistas. 
- **Java 11** como lenguaje principal en el backend. 
- **Tomcat 8** como servidor.
- **docker-compose** para pase de datos y phpmyadmin.
- **Netbeans 14** en adelante.

## Instalación del sistema 

### Requerimientos

- Tener descargadas/instaladas las tecnologías mencionadas.

### Pasos
1. Clonar el repositorio [git clone url_del_repo].
2. Dirigirse al path donde se clonó el repo y ejecutar **sudo docker-compose up**
3. Dirigirse a localhost:8081 y crear una base de datos llamada "sistReservas".
4. A la base de datos creada, asignarle un usuario con su nombre y con todos los permisos. 
5. Dentro de NetBeans:
  - Abrir el proyecto [File -> Open Project].
  - En el apartado de Dependencies, click derecho en "Dependencias" y en "Download Declared Dependencies".
  - En el apartado de Services, click derecho en "Databases". Configurar la base de datos creada en el paso 3 (con el usuario creado) y utilizar el puerto 3308.
  - En el apartado de Services, click derecho en "Servers". Indicar a netbeans el path en donde se tenga ubicado el Tomcat. Usuario y contraseña a elección.
  - Realizar un Cleand and Build utilizando el botón determinado para ello. 
  - Hacer click en el botón RUN. El proyecto debería iniciarse en su navegador por defecto. 
