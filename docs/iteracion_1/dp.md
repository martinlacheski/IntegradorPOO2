# Documento de diseño y planificación 
Este documento posee el diseño y la planificación tentativa para el desarrollo del sistema a lo largo de la iteración 1.

**Lider de la iteración**: Quiroga, Hugo Leonardo.

## Backlog de iteración
Conforme a lo que respecta la iteración 1, se han elegido las siguientes historias de usuario.

**G1**: Como gerente, quiero poder agregar habitaciones al sistema para poder tener un registro de las mismas. <br> 
**G2**: Como gerente, quiero poder eliminar una habitación del sistema en caso de que la misma no se utilice más o se haya cargado incorrectamente. <br>
**G3**: Como gerente, quiero poder modificar los datos de una habitación en caso de que las mismas sufran cambios dentro del establecimiento. <br>
**G6**: Como gerente, quiero poder agregar nuevos tipos de habitaciones de manera tal que las habitaciones sean clasificables.<br>

Dichas historias de usuario conforman un ABM básico de una habitación como así tambien el alta de un tipo de habitación. 

## Trabajo en equipo y Tareas
Las tareas, desarrolladas en equipo, se dividen de la siguiente manera, siendo cada columna un miembro del equipo.

| Quiroga Leonardo | Martin Lacheski | Jolu ?|
| -----------| ------------------|-----------------|
| Elaborar la clase Habitación. | Establecer conexión desde el entorno de desarrollo de Java a la BD (librerías, configuraciones, etc). | Creación de formulario inicial para el alta de la habitación.
| Codificación de lógica en capa de negocio para captar datos desde el cliente| Codificación de lógica en capa de modelos para almacenar los datos captados en capa de negocio | Codificación de controles en el formulario para depuración de datos (campos con números que solamente acepten números, etc) |
| Codificación de lógica en capa de modelos y negocio para obtener las habitaciones cargadas. | Elaboración estética de listado en template | Codificación en capa de modelos para obtención de una habitación en específico|
| Codificación en capa de negocio y template para elegir una habitación en específico la cual será expuesta en el mismo formulario de alta de habitación. | Elaboración de clase tipoHabitacion y relación con clase Habitacion| Creación de formulario de alta de tipoHabitación | Codificación de lógica en capa de negocio y modelos para almacenar los datos cargados en el formulario de alta de tipoHabitacion|
| Elaboración de botón de "Eliminar", ubicado en cada renglon del listado de habitaciones | Codificación en capa de negocio y modelos para eliminación de una habitación | Codificación de control para no cargar habitaciones y/o tipos de habitaciones repetidas |

## Diseño OO

![alt text](../img/Diagrama_clases_Iteración_1.png)


## WireFrame

- Lista de habitaciones *(refleja tambien tipos de habitaciones)*
![alt text](../img/principal_habitaciones.png)

- Agregar Habitación <br>
![alt text](../img/agregar_habitacion.png)

- Modificar Habitación <br>
![alt text](../img/modificar_habitacion.png)

- Eliminar Habitación <br>
![alt text](../img/eliminar_habitacion.png)

- Agregar Tipo de Habitación <br>
![alt text](../img/agregar_tipo_habitacion.png)


## Casos de Uso

1. Agregar una Habitación
    - El usuario visita la página web y se dirige a la sección de habitaciones, haciendo clic en el dropbox de Administación > Gestión de Habitaciones.
    - El sistema lo redirecciona a la pantalla apropiada.
    - El usuario hace clic en el botón "Agregar Nueva Habitacioń". 
    - El sistema despliega un formulario tipo modal con los datos necesarios para una habitación.
    - El usuario completa los campos requeridos en el formulario desplegado y hace clic en "Agregar Habitación".
    - El sistema esconde el modal y actualiza la página para que la nueva habitación se vea reflejada en el listado.

2. Modificar una habitación
    - El usuario, en la sección de habitaciones, hace clic en el botón de edición que se encuentra en cada renglón el cual representa una habitación cargada.
    - El sistema despliega un formulario tipo modal con los datos precargados de la habitación elegida.
    - El usuario modifica los campos que cree apropiados modificar y hace clic en el botón "Guardar Modificación"
    - El sistema esconde el modal, modifica los datos en la base de datos y actualiza la página para reflejar los datos modificados en el listado.

3. Eliminar una habitación
    - El usuario, en la sección de habitaciones, hace clic en el botón de eliminación que se encuentra en cada renglón el cual representa una habitación cargada.
    - El sistema despliega un modal a modo de confirmación indicando en un mensaje si se está seguro de eliminar la habitación.
    - El usuario hace clic en el botón "Eliminar". 
    - El sistema esconde el modal, elimina los datos en la base de datos y actualiza la página para reflejar los datos modificados en el listado.

4. Agregar un Tipo de Habitación
     - El usuario visita la página web y se dirige a la sección de tipos de habitaciones, haceidno clic en el dropbox de Administación > Gestión de Tipos de Habitaciones.
    - El sistema lo redirecciona a la pantalla apropiada.
    - El usuario hace clic en el botón "Agregar Nuevo Tipo de Habitacioń". 
    - El sistema despliega un formulario tipo modal con los datos necesarios para un tipo de habitación.
    - El usuario completa los campos requeridos en el formulario desplegado y hace clic en "Agregar Tipo Habitación".
    - El sistema esconde el modal y actualiza la página para que la nueva habitación se vea reflejada en el listado.
