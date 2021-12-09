package Logica;

import Logica.Empleado;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-12-08T20:59:55")
@StaticMetamodel(Usuario.class)
public class Usuario_ { 

    public static volatile SingularAttribute<Usuario, Boolean> estado;
    public static volatile SingularAttribute<Usuario, Empleado> empleadoAsoc;
    public static volatile SingularAttribute<Usuario, String> passUsuario;
    public static volatile SingularAttribute<Usuario, String> nombreUsuario;

}