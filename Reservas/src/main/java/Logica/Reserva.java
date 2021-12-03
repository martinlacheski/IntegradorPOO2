package Logica;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;
import javax.persistence.*;

@Entity
public class Reserva implements Serializable {
    @Id @GeneratedValue(strategy = GenerationType.SEQUENCE) int idReserva;
    
    private LocalDate checkIn;
    private LocalDate checkOut;
    private LocalDate fechaCreacionReserva;
    private int cantPersonas;
    private int montoTotal;
    private boolean estado;
            
    @OneToOne
    private Usuario usuarioAlta;

    @OneToOne
    private Huesped huespedAsoc;
    
    @OneToOne
    private Habitacion habReservada;

    public Reserva() {
    }

    public Reserva(int idReserva, LocalDate checkIn, LocalDate checkOut,
            LocalDate fechaCreacionReserva, int cantPersonas, int montoTotal,
            boolean estado, Usuario usuarioAlta, Huesped huespedAsoc, Habitacion habReservada) {
        this.idReserva = idReserva;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.fechaCreacionReserva = fechaCreacionReserva;
        this.cantPersonas = cantPersonas;
        this.montoTotal = montoTotal;
        this.estado = estado;
        this.usuarioAlta = usuarioAlta;
        this.huespedAsoc = huespedAsoc;
        this.habReservada = habReservada;
    }

    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public LocalDate getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(LocalDate checkIn) {
        this.checkIn = checkIn;
    }

    public LocalDate getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(LocalDate checkOut) {
        this.checkOut = checkOut;
    }

    public LocalDate getFechaCreacionReserva() {
        return fechaCreacionReserva;
    }

    public void setFechaCreacionReserva(LocalDate fechaCreacionReserva) {
        this.fechaCreacionReserva = fechaCreacionReserva;
    }

    public int getCantPersonas() {
        return cantPersonas;
    }

    public void setCantPersonas(int cantPersonas) {
        this.cantPersonas = cantPersonas;
    }

    public int getMontoTotal() {
        return montoTotal;
    }

    public void setMontoTotal(int montoTotal) {
        this.montoTotal = montoTotal;
    }

    public boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public Usuario getUsuarioAlta() {
        return usuarioAlta;
    }

    public void setUsuarioAlta(Usuario usuarioAlta) {
        this.usuarioAlta = usuarioAlta;
    }

    public Huesped getHuespedAsoc() {
        return huespedAsoc;
    }

    public void setHuespedAsoc(Huesped huespedAsoc) {
        this.huespedAsoc = huespedAsoc;
    }

    public Habitacion getHabReservada() {
        return habReservada;
    }

    public void setHabReservada(Habitacion habReservada) {
        this.habReservada = habReservada;
    }  
    
    @Override
    public String toString(){
        return "Reserva nro: " + this.getIdReserva() + " -- Habitación " + this.getHabReservada() + "-- E" + this.getCheckIn() + " S" + this.getCheckOut();
    }
    
    public boolean checkOutAfter (){
        return this.checkOut.isAfter(this.checkIn);
    }
    
    public boolean capacidadOk(){
        int cantPers = this.getCantPersonas();
        int capacidadHab = this.getHabReservada().getTipo().getCapacidadPersonas();
        return cantPers <= capacidadHab;
    }
    
}