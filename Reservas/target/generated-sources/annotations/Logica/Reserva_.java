package Logica;

import Logica.Habitacion;
import Logica.Huesped;
import Logica.Usuario;
import java.time.LocalDate;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-12-01T19:48:30")
@StaticMetamodel(Reserva.class)
public class Reserva_ { 

    public static volatile SingularAttribute<Reserva, Boolean> estado;
    public static volatile SingularAttribute<Reserva, LocalDate> checkIn;
    public static volatile SingularAttribute<Reserva, LocalDate> fechaCreacionReserva;
    public static volatile SingularAttribute<Reserva, Habitacion> habReservada;
    public static volatile SingularAttribute<Reserva, Integer> cantPersonas;
    public static volatile SingularAttribute<Reserva, LocalDate> checkOut;
    public static volatile SingularAttribute<Reserva, Usuario> usuarioAlta;
    public static volatile SingularAttribute<Reserva, Integer> idReserva;
    public static volatile SingularAttribute<Reserva, Integer> montoTotal;
    public static volatile SingularAttribute<Reserva, Huesped> huespedAsoc;

}