
package Persistencia;

import Logica.Habitacion;
import Logica.TipoHabitacion;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistencia {
    static TipoHabitacionJpaController tipoHabJPA = new TipoHabitacionJpaController();
    static HabitacionJpaController habJPA = new HabitacionJpaController();
    
    
    public ControladoraPersistencia() {
    }
    
    // TIPO DE HABITACIÓN
    public void persistirTipoHabitacion(TipoHabitacion objetoTipoHabitacion) {
        try {
            tipoHabJPA.create(objetoTipoHabitacion);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List getTiposHabitaciones() {
        List<TipoHabitacion> tiposHabitacionesDesdeBD;
        tiposHabitacionesDesdeBD = tipoHabJPA.findTipoHabitacionEntities();
        return tiposHabitacionesDesdeBD;
    }
    
    public TipoHabitacion getTipoHabitacion(String tipoHabitacionID) {
        TipoHabitacion tipoHabitacionDesdeBD;
        tipoHabitacionDesdeBD = tipoHabJPA.findTipoHabitacion(tipoHabitacionID);
        return tipoHabitacionDesdeBD;
    }
    
    // HABITACION
    public void persistirHabitacion(Habitacion objetoHabitacion) {
        try {
            habJPA.create(objetoHabitacion);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List getHabitaciones() {
        List<Habitacion> HabitacionesDesdeBD;
        HabitacionesDesdeBD = habJPA.findHabitacionEntities();
        return HabitacionesDesdeBD;
    }
    
    public Habitacion getHabitacion(int habitacionID) {
        Habitacion habitacionDesdeBD;
        habitacionDesdeBD = habJPA.findHabitacion(habitacionID);
        return habitacionDesdeBD;
    }
    
    public void editarHabitacion(Habitacion objetoHabitacion) throws Exception {
        habJPA.edit(objetoHabitacion);
    }
    
    public void eliminarHabitacion(int idHab) throws NonexistentEntityException {
        habJPA.destroy(idHab);
    }
}
