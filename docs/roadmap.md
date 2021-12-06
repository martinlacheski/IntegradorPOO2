#  Roadmap - Plan tentantivo de historias de usuario

En este documento se desarrola un plan tentativo que abarca las historias de usuario que componen el proyecto. Primeramente, se expondrán la historias en un lenguaje coloquial y luego se dividirán en grupos concorde a la prioridad/tiempo estimado de cada una.

> Las etiquetas para cada historia de usuario están compuestas por una letra y un número donde la letra indica el actor, por ejemplo Gerente, y el número su correspondiente número en el listado. <br><br>
*Historia* **G1** corresponde a la historia #1 del listado de historias del actor Gerente. 
<br>

## Historias de usuarios

### Administrador

1. Como administrador, quiero poder crear nuevos usuarios en el sistema de manera tal que si un Gerente o Empleado no tiene usuario, no pueda usar el sistema. 
2. Como Administrador, quiero poder asociar un usuario a un empleado o Gerente de manera tal que se sepa qué usuario pertenece a qué trabajor.
3. Como administrador, quiero poder modificar los datos de los usuarios en el sistema en caso de que los Empleados o Gerentes se olviden, pierdan o comprometan sus contraseñas o nombre de usuario.
4. Como administrador, quiero poder dar de baja a un usuario del sistema de manera tal que pueda revocar completo acceso a dicho Empleado/Gerente asociado al usuario en cuestión.
5. Como administrador, quiero poder visualizar una lista de los usuarios que se tienen registrados para poder ver rápidamente a los que se tienen registrados. Dicha lista debe tener a qué empleado o Gerente está asociado cada usuario.   

### Gerente
1. Como gerente, quiero poder agregar habitaciones al sistema para poder tener un registro de las mismas. 
2. Como gerente, quiero poder eliminar una habitación del sistema en caso de que la misma no se utilice más o se haya cargado incorrectamente. 
3. Como gerente, quiero poder modificar los datos de una habitación en caso de que las mismas sufran cambios dentro del establecimiento.
4. Como gerente, quiero poder obtener un listado de las habitaciones ocupadas para poder ver rápidamente a qué capacidad está el establecimiento
5. Como gerente, quiero poder obtener un listado de las habitaciones disponibles para poder rápidamente asignarlas a nuevos huespedes. 
6. Como gerente, quiero poder agregar nuevos tipos de habitaciones de manera tal que las habitaciones sean clasificables. 
7. Como gerente, quiero poder modificar tipos de habitaciones llegado al caso de que las características de éstas varíen en el tiempo. 
8. Como gerente quiero poder asociar una habitación a un tipo de habitación para poder clasificarlas.
9. Como gerente quiero poder eliminar un tipo de habitación en caso de que este no se utilice más. 
10. Como gerente quiero poder listar los tipos de habitaciones que tenga registradas para poder verlas rápidamente. 
11. Como gerente, quiero poder marcar a un huesped como no admitido en caso de que el mismo pierda el derecho de adminisión al establecimiento de manera tal que éste no pueda realizar nuevas reservas.
12. Como gerente, quiero poder agregar a nuevos empleados para poder registrar a quienes trabajan en el establecimiento. 
13. Como gerente, quiero poder modificar los datos de empleados ya registrados llegado al caso que se carguen incorrectamente o los mismos cambien sus datos personales.
14. Como gerente, quiero poder dar de baja a empleados registrados llegado al caso de que dejen de trabajar en el establecimiento.
15. Como gerente, quiero poder visualizar una lista de los empleados que se tienen registrados para poder ver rápidamente quienes conforman el equipo de trabajo actual. 
16. Como gerente quiero obtener un informe en donde se den a conocer todas las ganancias diarios y/o mensuales conforme a las reservas realizadas de las habitaciones.




### Empleado
1. Como empleado, quiero poder registrar una nueva reserva de habitación para poder saber qué huespedes serán hospedados y quien será el responsable de la misma. 
2. Como empleado, quiero poder registrar cuándo cerá el *chek-in* de una reserva y cuando será el *check-out* de manera que se pueda saber el periodo de tiempo en el que las habitaciones estarán ocupadas. 
3. Como empleado, quiero poder saber si un rango de fechas de reservación para una habitación determinada se solapa con otra reservación, de manera tal que se pueda redirecionar al huesped hacia otra habitación. 
4. Como empleado, quiero poder saber si la cantidad de personas en una reserva sobrepasa la capacidad de la habitación para poder informarle al huesped que debe elegir otra habitación, o que haga otra reserva.
5. Como empleado, quiero saber el monto de la reserva concorde al tipo de habitación y a la cantidad de días de estancia en el establecimiento.
6. Como empleado, quiero poder cancelar una reserva en casos en donde el huesped decida hacerlo.
7. Como empleado quiero poder agregar nuevos huspedes de manera tal que se pueda tener un registro de los mismos. 
8. Como empelado quiero poder modificar datos de huespedes llegado al caso que se carguen incorrectamente o los mismos cambien sus datos personales.
9. Como empleado quiero poder dar de baja a huespedes en caso de que sus datos ya no sean necesarios en el establecimiento.
10. Como empleado quiero poder obtener un listado de todos los huespedes registrados en el sistema hasta la fecha actual.
11. Como empleado quiero poder obtener un listado de todas las reservas realizadas en un determinado día. 
12. Como empleado quiero poder obtener un listado de todas las reservas realizadas por un determinado huesped en un periodo desde/hasta. 


### Comunes
1. Como usuario quiero poder ingresar en el sistema para poder hacer uso de las funcionalidades del mismo.
2. Como sistema, es deseable que los usuarios unicamente tengan acceso a datos/funcionalidades concorde a su nivel de privilegios. 

___

## Backlog

| Debe tener | Es bueno tenerlas | Fuera de alcance|
| -----------| ------------------|-----------------|
|G1 * | G4  |
|G2 *| G5  |
|G3 *| G10 |
|G6 * | G11 |
|G7 *| G16 |
|G8 *| G10 *|
|G9 *| G11 |
|G12 *| E10 *|
|G13 *| E11 |
|G14 *| |
|G15 *| |
|E1 *| |
|E2 *| |
|E3 *| |
|E4 *| |
|E5 *| |
|E6 *| |
|E7 *| |
|E8 *| |
|E9 *| |
|E12 *| |
| A1 *| |C1 |
| A2 *| |C2 |
| A3 *| | |
| A4 | | |
| A5 *| | |
