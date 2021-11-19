package Logica;

import java.io.Serializable;
import java.time.LocalDate;
import javax.persistence.*;

@Entity
public class Huesped extends Persona implements Serializable{
    
    @Basic
    private String profesion;

    public Huesped() {
    }

    public Huesped(String profesion, int dni, String nombre, String apellido,
            LocalDate fechaNac, String direccion, String telefono) {
        super(dni, nombre, apellido, fechaNac, direccion, telefono);
        this.profesion = profesion;
    }

    public String getProfesion() {
        return profesion;
    }

    public void setProfesion(String profesion) {
        this.profesion = profesion;
    }
    
    
    @Override
    public String toString(){
        return this.getNombre() + " " + this.getApellido();
    }
    
}