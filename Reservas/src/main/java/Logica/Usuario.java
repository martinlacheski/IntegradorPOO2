package Logica;

import java.io.Serializable;
import javax.persistence.*;

@Entity
public class Usuario implements Serializable {

    @Id
    String nombreUsuario;

    @Basic
    String passUsuario;

    @OneToOne
    Empleado empleadoAsoc;

    public Usuario() {
    }

    public Usuario(String nombreUsuario, String passUsuario, Empleado empleadoAsoc) {
        this.nombreUsuario = nombreUsuario;
        this.passUsuario = passUsuario;
        this.empleadoAsoc = empleadoAsoc;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getPassUsuario() {
        return passUsuario;
    }

    public void setPassUsuario(String passUsuario) {
        this.passUsuario = passUsuario;
    }

    public Empleado getEmpleadoAsoc() {
        return empleadoAsoc;
    }

    public void setEmpleadoAsoc(Empleado empleadoAsoc) {
        this.empleadoAsoc = empleadoAsoc;
    }

    @Override
    public String toString() {
        return nombreUsuario;
    }

}
