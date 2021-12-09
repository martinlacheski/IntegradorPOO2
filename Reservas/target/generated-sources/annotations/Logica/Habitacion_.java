package Logica;

import Logica.TipoHabitacion;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-12-08T20:59:55")
@StaticMetamodel(Habitacion.class)
public class Habitacion_ { 

    public static volatile SingularAttribute<Habitacion, Integer> nroHab;
    public static volatile SingularAttribute<Habitacion, String> piso;
    public static volatile SingularAttribute<Habitacion, Boolean> estado;
    public static volatile SingularAttribute<Habitacion, TipoHabitacion> tipo;
    public static volatile SingularAttribute<Habitacion, Integer> precioNoche;

}