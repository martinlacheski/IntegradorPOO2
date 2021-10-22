package Logica;

import java.io.Serializable;
import javax.persistence.*;


@Entity
public class TipoHabitacion implements Serializable {
    
    @Id
    String nombreHabitacion;
    
    @Basic
    int capacidadPersonas;

    public TipoHabitacion() {
    }

    public TipoHabitacion(String nombreHabitacion, int capacidadPersonas) {
        this.nombreHabitacion = nombreHabitacion;
        this.capacidadPersonas = capacidadPersonas;
    }

    public String getNombreHabitacion() {
        return nombreHabitacion;
    }

    public void setNombreHabitacion(String nombreHabitacion) {
        this.nombreHabitacion = nombreHabitacion;
    }

    public int getCapacidadPersonas() {
        return capacidadPersonas;
    }

    public void setCapacidadPersonas(int capacidadPersonas) {
        this.capacidadPersonas = capacidadPersonas;
    }
    
    
    @Override
    public String toString() {
        return this.nombreHabitacion;
    }
      
    
}