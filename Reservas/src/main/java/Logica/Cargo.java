package Logica;

import java.io.Serializable;
import javax.persistence.*;

@Entity
public class Cargo implements Serializable {
    
    @Id
    private String cargo; 
    
    @Basic
    private int sueldo;

    public Cargo() {
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public int getSueldo() {
        return sueldo;
    }

    public void setSueldo(int sueldo) {
        this.sueldo = sueldo;
    }
    
    @Override
    public String toString(){
        return this.getCargo();
    }
    
}
