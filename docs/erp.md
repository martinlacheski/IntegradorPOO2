# Requisitos funcionales 

A continuación se detallan los requisitos funcionales para el sistema de reservas de habitaciones solicitado concorde a las especificaciones del cliente. 

1. El sistema requiere que se puedan registrar habitaciones con los siguientes datos
    - Número identificativo 
    - Piso en donde se encuentra la habitación.
    - Nombre de la temática de la habitación.
    - Tipo de habitación (single, doble, triple, múltiple)
    - Precio de habitación por noche. 
<br>
<br>
2. El sistema requiere que se puedan registrar tipos de habitación con los siguientes datos
    - Nombre
    - Capacidad 
<br>
<br>
3. El sistema requiere que se puedan registrar reservas de las habitaciones cargadas.
<br>
<br>
4. El sistema requiere que las reservas tengan una fecha chek-in y una fecha check-out
<br>
<br>
5. El sistema requiere que antes de confirmar la reserva, se verifique si la habitació6 solicitada no está reservada en el periodo de tiempo que se haya elegido para dicha reserva.
<br>
<br>
6. El sistema requiere que conforme a la cantidad de días de la reserva y al tipo de habitación, se informe el monto total de lo que costará la estadía.
<br>
<br>
7. El sistema requiere que se verifique la cantidad de personas que se hospedarán en una habitación, teniendo en cuenta que no se supere la cantidad establecida por el tipo de habitación (single, doble, triple, múltiple).
<br>
<br>
8. El sistema requiere que se puedan registrar los datos del huesped el cual estará a cargo de la reserva
    - Dni
    - Nombre
    - Apellido
    - Fecha de Nacimiento
    - Dirección (dónde vive)
    - Profesión 
<br>
<br>
9. *El sistema requiere que se puedan marcar a un huesped como no admitido el cual no va a poder realizar nuevas reservas.*
<br>
<br>
10. El sistema requiere que los empleados tengan un usuario y una contraseña para poder ingresar al sistema. Para cada usuario se requieren los siguientes datos.
    - Dni
    - Nombre
    - Apellido
    - Fecha de Nacimiento
    - Dirección 
    - Cargo
<br>
<br>
11. El sistema requiere que se conozca qué usuario dio de alta qué reserva y cuándo lo hizo.
<br>
<br>
12. El Sistema requiere que se puedan realizar las siguientes consultas: 
    - Todas las reservas realizadas en un determinado día.
    - Todos los huéspedes registrados en el sistema.
    - Lista de las reservas realizadas por un determinado empleado.
    - Listas de todas las reservas realizadas por un determinado huésped en un período desde/hasta
    - *Todas las habitaciones disponibles en el momento de la consulta.*
    - *Todas las habitacioes ocupadas en el momento de la consulta.*
<br>
<br>
13. El sistema requiere que se den a conocer las ganancias diarias y/o mensuales conforme a las reservas realizadas de las habitaciones.