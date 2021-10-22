package Logica;

import Persistencia.ControladoraPersistencia;
import Persistencia.exceptions.NonexistentEntityException;
import java.time.LocalDate;
import java.util.List;

public class ControladoraLogica {
    
    // TIPO HABITACIONES
    ControladoraPersistencia Cp = new ControladoraPersistencia();
    
    public void crearObjetoTipoHabitacion(String nombreTipo, int capacidadPersonas) {
        TipoHabitacion objetoTipoHabitacion = new TipoHabitacion();

        objetoTipoHabitacion.setNombreHabitacion(nombreTipo);
        objetoTipoHabitacion.setCapacidadPersonas(capacidadPersonas);

        Cp.persistirTipoHabitacion(objetoTipoHabitacion);
    }

    
    public List listaTiposHabitaciones() {
        List objetosHabitacion = Cp.getTiposHabitaciones();
        return objetosHabitacion;
    }
    

    public TipoHabitacion obtenerTipoHabitacion (String tipoHabitacionID){
        TipoHabitacion hab = Cp.getTipoHabitacion(tipoHabitacionID);
        return hab; 
    }

    
    // HABITACIONES
    public void crearObjetoHabitacion(int nroHab, String piso, TipoHabitacion tipoHab, int precioNoche) {
        Habitacion objetoHabitacion = new Habitacion();
        objetoHabitacion.setNroHab(nroHab);
        objetoHabitacion.setPiso(piso);
        objetoHabitacion.setPrecioNoche(precioNoche);
        objetoHabitacion.setTipo(tipoHab);
        Cp.persistirHabitacion(objetoHabitacion);
    }
    
    public List listaHabitaciones() {
        List objetosHabitacion = Cp.getHabitaciones();
        return objetosHabitacion;
    }
    
    public Habitacion obtenerHabitacion (int habitacionID){
        Habitacion hab = Cp.getHabitacion(habitacionID);
        return hab; 
    }
    
    public void modificarObjHabitacion(int nroHab, String piso, TipoHabitacion tipoHab, int precioNoche) throws Exception {
        Habitacion objetoHabitacion = obtenerHabitacion(nroHab);
        objetoHabitacion.setPiso(piso);
        objetoHabitacion.setPrecioNoche(precioNoche);
        objetoHabitacion.setTipo(tipoHab);
        System.out.println(objetoHabitacion.getPiso());
        System.out.println(objetoHabitacion.getPrecioNoche());
        System.out.println(objetoHabitacion.getTipo());
        Cp.editarHabitacion(objetoHabitacion);
    }
    
    public void eliminarObjetoHabitacion(int idHab) throws NonexistentEntityException {
        Cp.eliminarHabitacion(idHab);
    }
    
}
