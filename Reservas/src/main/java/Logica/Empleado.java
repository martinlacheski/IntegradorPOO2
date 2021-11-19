package Logica;

import java.io.Serializable;
import java.time.LocalDate;
import javax.persistence.*;

@Entity
public class Empleado extends Persona implements Serializable{
    
    @Basic
    private boolean estado;
    
    @OneToOne
    private Cargo cargo;
    
    public Empleado() {
    }

    public Empleado(boolean estado, Cargo cargo, int dni, String nombre,
            String apellido, LocalDate fechaNac, String direccion, String telefono) {
        super(dni, nombre, apellido, fechaNac, direccion, telefono);
        this.estado = estado;
        this.cargo = cargo;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public Cargo getCargo() {
        return cargo;
    }

    public void setCargo(Cargo cargo) {
        this.cargo = cargo;
    }
    
    @Override
    public String toString(){
        return this.getNombre() + " " + this.getApellido();
    }
    
}