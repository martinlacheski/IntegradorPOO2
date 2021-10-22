package Logica;

import java.io.Serializable;
import javax.persistence.*;


@Entity
public class Habitacion implements Serializable{
    
    @Id
    int nroHab;
    
    @Basic
    String piso;
    int precioNoche;
    
    @OneToOne
    TipoHabitacion tipo;

    public Habitacion() {
    }

    public Habitacion(int nroHab, String piso, int precioNoche, TipoHabitacion tipo) {
        this.nroHab = nroHab;
        this.piso = piso;
        this.precioNoche = precioNoche;
        this.tipo = tipo;
    }

    public int getNroHab() {
        return nroHab;
    }

    public void setNroHab(int nroHab) {
        this.nroHab = nroHab;
    }

    public String getPiso() {
        return piso;
    }

    public void setPiso(String piso) {
        this.piso = piso;
    }

    public int getPrecioNoche() {
        return precioNoche;
    }

    public void setPrecioNoche(int precioNoche) {
        this.precioNoche = precioNoche;
    }

    public TipoHabitacion getTipo() {
        return tipo;
    }

    public void setTipo(TipoHabitacion tipo) {
        this.tipo = tipo;
    }

    @Override
    public String toString() {
        return "Habitacion: " + this.nroHab;
    }
      
    
}