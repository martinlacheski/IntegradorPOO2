
package Persistencia;

import Logica.Cargo;
import Logica.Empleado;
import Logica.Habitacion;
import Logica.Huesped;
import Logica.TipoHabitacion;
import Logica.Usuario;
import Persistencia.exceptions.NonexistentEntityException;
import Persistencia.exceptions.PreexistingEntityException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.RollbackException;
import javax.validation.ConstraintViolationException;

public class ControladoraPersistencia {
    static TipoHabitacionJpaController tipoHabJPA = new TipoHabitacionJpaController();
    static HabitacionJpaController habJPA = new HabitacionJpaController();
    static EmpleadoJpaController empJPA = new EmpleadoJpaController();
    static CargoJpaController cargoJPA = new CargoJpaController();
    static UsuarioJpaController userJPA = new UsuarioJpaController();
    static HuespedJpaController huesJPA = new HuespedJpaController();

    public ControladoraPersistencia() {
    }
    
    // TIPO DE HABITACIÓN
    public String persistirTipoHabitacion(TipoHabitacion objetoTipoHabitacion) {
        try {
            tipoHabJPA.create(objetoTipoHabitacion);
            return "ok";
        }catch (PreexistingEntityException e){
            return "repetido";
        }catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
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
    
    public void eliminarTipoHabitacion(String tipoHabitacion){
        try {
            tipoHabJPA.destroy(tipoHabitacion);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void editarTipoHabitacion(TipoHabitacion objTipohab) throws Exception {
        tipoHabJPA.edit(objTipohab);
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
    
    // EMPLEADO
    public void persistirEmpleado(Empleado objEmp) {
        try {
            empJPA.create(objEmp);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void bajaEmpleadoBd(Empleado objEmp) throws Exception {
        empJPA.edit(objEmp);
    }

    public Empleado getEmpleado(int dni) {
        Empleado empDesdeBD = empJPA.findEmpleado(dni);
        return empDesdeBD;
    }

    public List getEmpleados() {
        List<Empleado> EmpleadosDesdeBD = empJPA.findEmpleadoEntities();
        return EmpleadosDesdeBD;
    }

    public void altaEmpleadoBd(Empleado objEmp) throws Exception {
         empJPA.edit(objEmp);
    }

    public void editarEmpleado(Empleado objEmp) throws Exception {
         empJPA.edit(objEmp);
    }
    
    public void eliminarEmpleado(int idEmp) throws NonexistentEntityException {
        empJPA.destroy(idEmp);
    }

    
    // CARGO
    public void persistirCargo(Cargo objetoCargo){
        try {
            cargoJPA.create(objetoCargo);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Cargo getCargo(String nombre) {
        Cargo cargoDesdeBD = cargoJPA.findCargo(nombre);
        return cargoDesdeBD;
    }

    public List getCargos() {
        List<Cargo> CargosDesdeBD = cargoJPA.findCargoEntities();
        return CargosDesdeBD;
    }

    public void eliminarCargo(String nombre) throws NonexistentEntityException {
         cargoJPA.destroy(nombre);
    }

    public void editarCargo(Cargo objCargo) throws Exception {
         cargoJPA.edit(objCargo);
    }
    
    
    // USUARIO
    public void persistirUser(Usuario objetoUsuario) {
        try {
            userJPA.create(objetoUsuario);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario getUser(String nombreUser) {
        Usuario userDesdeBD = userJPA.findUsuario(nombreUser);
        return userDesdeBD;
    }

    public List getUsuarios() {
        List<Usuario> usuariosDesdeBD = userJPA.findUsuarioEntities();
        return usuariosDesdeBD;
    }

    public void eliminarUsuario(String nombreUser) throws NonexistentEntityException {
        userJPA.destroy(nombreUser);
    }

    public void editarUsuario(Usuario objUsuario) throws Exception {
        userJPA.edit(objUsuario);
    }
    
    public static Usuario getUsuarioByEmpDNI(Empleado emp) {
        Usuario usuarioDesdeBD;
        usuarioDesdeBD = userJPA.getUsuarioByEmpDNI(emp);
        return usuarioDesdeBD;
    }

    
    // HUESPED
    public void persistirHuesped(Huesped objHuesped) {
        try {
            huesJPA.create(objHuesped);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Huesped getHuesped(int dni) {
        Huesped huesDesdeBD = huesJPA.findHuesped(dni);
        return huesDesdeBD;
    }

    public List getHuespedes() {
        List<Huesped> HuespedesDesdeBD = huesJPA.findHuespedEntities();
        return HuespedesDesdeBD;
    }


    public void editarHuesped(Huesped objHues) throws Exception {
         huesJPA.edit(objHues);
    }
    
    public void eliminarHuesped(int idHues) throws NonexistentEntityException {
        huesJPA.destroy(idHues);
    }
    
    
}
