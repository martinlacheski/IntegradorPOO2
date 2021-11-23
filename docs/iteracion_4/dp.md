# Documento de diseño y planificación 
Este documento posee el diseño y la planificación tentativa para el desarrollo del sistema a lo largo de la iteración 4.

**Lider de la iteración**: Lacheski, Martín Aníbal.

## Backlog de iteración
Conforme a lo que respecta la iteración 4, se han elegido las siguientes historias de usuario.

__Correspondientes a iteración 4__:<br>
**E1**: Como empleado, quiero poder registrar una nueva reserva de habitación para poder saber qué huespedes serán hospedados y quien será el responsable de la misma. <br>
**E2**: Como empleado, quiero poder registrar cuándo cerá el chek-in de una reserva y cuando será el check-out de manera que se pueda saber el periodo de tiempo en el que las habitaciones estarán ocupadas.
<br>
**E3**: Como empleado, quiero poder saber si un rango de fechas de reservación para una habitación determinada se solapa con otra reservación, de manera tal que se pueda redirecionar al huesped hacia otra habitación.<br>
**E4**: Como empleado, quiero poder saber si la cantidad de personas en una reserva sobrepasa la capacidad de la habitación para poder informarle al huesped que debe elegir otra habitación, o que haga otra reserva. <br>
**E5**: Como empleado, quiero saber el monto de la reserva concorde al tipo de habitación y a la cantidad de días de estancia en el establecimiento. <br>
**E6**: Como empleado, quiero poder cancelar una reserva en casos en donde el huesped decida hacerlo. <br>
**E12**: Como empleado quiero poder obtener un listado de todas las reservas realizadas por un determinado huesped en un periodo desde/hasta.
**A4**: Como administrador, quiero poder dar de baja a un usuario del sistema de manera tal que pueda revocar completo acceso a dicho Empleado/Gerente asociado al usuario en cuestión.

> Adicional a las historias de usuario, se ponen en marcha dos manejos de errores importantes dentro del sistema. La nomenclatura de ambos será ER seguido de un número.<br><br>
**ER1**: Hacer transparente al usuario el ingreso de registros repetidos, con algún mensaje de error.<br>
**ER2**: Hacer transparente al usuario la dependencia de registros, en caso de que se quiera eliminar uno que dependa de otro.


Dichas historias de usuario (y tareas sobre manejo de errores) conforman un ABM complejo de reserva, como así tambien la implementación de los primeros reportes.

## Trabajo en equipo y Tareas
Las tareas, desarrolladas en equipo, se dividen de la siguiente manera, siendo cada columna un miembro del equipo.

| Quiroga Leonardo | Martin Lacheski | José Luis Montejano|
| -----------| ------------------|-----------------|
|Codificacón de formulario de reserva en capa template | Codificación en capa Servlets para obtención y tratado de datos de Reservas | Creación de clase Reservas |
| Codificación en capa Persistencia y Lógica para instancia de objetos Reserva y almacenamiento. | Codificación en capa template para Cancelación de Reserva | Codificación en capa template de visualización de informe|
 Codificación en capa de templates para baja de Usuario| Codificación en capa Logica y Persistencia de búsqueda y filtro de datos para informes |Codificación en capa logica y persistencia referente al tratado de errores de duplicidad y de eliminación de registros dependientes |
 | Codificación en capa template de muestra al usuario respecto a los errores de duplicidad y eliminación de registros dependientes |

## Diseño OO

![alt text](../../img/diagrama_clases_it3.png)


## WireFrame

- Lista de huespedes *(refleja tambien lista de usuarios)*
![alt text](../../img/Diagrama_de_clases_Iteracion_4.png)

- Agregar Huesped <br>
![alt text](../../img/img_aux_add_hues.png)

- Modificar Huesped <br>
![alt text](../img/img_aux_edit_hues.png)

- Eliminar Huesped **(se excluye pantalla de eliminación de usuairo debido a su similaridad con ésta)** <br>
![alt text](../img/img_aux_delete_hues.png)

- Agregar Usuario **(se excluye pantalla de edición debido a su similaridad con ésta)** <br>
![alt text](../../img/img_aux_add_user.png)


## Casos de Uso

1. Agregar un Huesped
    - El usuario visita la página web y se dirige a la sección de Huespedes, haciendo clic en el dropbox de Administación > Gestión de Huesped.
    - El sistema lo redirecciona a la pantalla apropiada.
    - El usuario hace clic en el botón "Agregar Nuevo Huesped". 
    - El sistema despliega un formulario tipo modal con los datos necesarios para un Huesped.
    - El usuario completa los campos requeridos en el formulario desplegado y hace clic en "Agregar Huesped".
    - El sistema esconde el modal y actualiza la página para que la nueva habitación se vea reflejada en el listado.

2. Modificar un Huesped
    - El usuario, en la sección de Huespedes, hace clic en el botón de edición que se encuentra en cada renglón el cual representa un huesped cargado.
    - El sistema despliega un formulario tipo modal con los datos precargados del huesped elegido.
    - El usuario modifica los campos que cree apropiados modificar y hace clic en el botón "Guardar Modificación"
    - El sistema esconde el modal, modifica los datos en la base de datos y actualiza la página para reflejar los datos modificados en el listado.

3. Dar de baja a un huesped.
    - El usuario, en la sección de huespedes, hace clic en el botón de eliminación que se encuentra en cada renglón el cual representa un huesped cargado.
    - El sistema despliega un modal a modo de confirmación indicando en un mensaje si se está seguro de eliminar los datos del huesped.
    - El usuario hace clic en el botón "Eliminar". 
    - El sistema esconde el modal, da de baja al huesped y actualiza la página para reflejar los datos modificados en el listado.

4. Agregar un nuevo Usuario
     - El usuario visita la página web y se dirige a la sección de Usuarios, haciendo clic en el dropbox de Administación > Gestión de Usuarios.
    - El sistema lo redirecciona a la pantalla apropiada.
    - El usuario hace clic en el botón "Agregar Nuevo Usuario". 
    - El sistema despliega un formulario tipo modal con los datos necesarios para un Usuario.
    - El usuario completa los campos requeridos en el formulario desplegado y hace clic en "Agregar Usuario".
    - El sistema esconde el modal y actualiza la página para que el nuevo usuario se vea reflejada en el listado.


5. Modificar un Huesped
    - El usuario, en la sección de Usuarios, hace clic en el botón de edición que se encuentra en cada renglón el cual representa un usuario cargado.
    - El sistema despliega un formulario tipo modal con los datos precargados del usuario elegido.
    - El usuario modifica los campos que cree apropiados modificar y hace clic en el botón "Guardar Modificación"
    - El sistema esconde el modal, modifica los datos en la base de datos y actualiza la página para reflejar los datos modificados en el listado.

6. Dar de baja a un huesped.
    - El usuario, en la sección de Usuarios, hace clic en el botón de eliminación que se encuentra en cada renglón el cual representa un usuario cargado.
    - El sistema despliega un modal a modo de confirmación indicando en un mensaje si se está seguro de eliminar los datos del usuario.
    - El usuario hace clic en el botón "Eliminar". 
    - El sistema esconde el modal, da de baja al usuario y actualiza la página para reflejar los datos modificados en el listado.