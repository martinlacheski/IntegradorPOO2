package Logica;
import Persistencia.ControladoraPersistencia;
import Persistencia.exceptions.NonexistentEntityException;
import java.time.LocalDate;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    
    public void eliminarObjetoTipoHabitacion(String tipoHabitacion) throws NonexistentEntityException {
        Cp.eliminarTipoHabitacion(tipoHabitacion);
    }
    
    public void modificarObjTipoHabitacion(String tipoHab, int capacidad) throws Exception {
        TipoHabitacion objTipohab = obtenerTipoHabitacion(tipoHab);
        objTipohab.setCapacidadPersonas(capacidad);
        Cp.editarTipoHabitacion(objTipohab);
    }

    
    // HABITACIONES
    public void crearObjetoHabitacion(int nroHab, String piso,
            TipoHabitacion tipoHab, int precioNoche) {
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
    
    public void modificarObjHabitacion(int nroHab, String piso, TipoHabitacion
            tipoHab, int precioNoche) throws Exception {
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
    
    
    // EMPLEADOS
    public void crearObjetoEmpleado(Cargo cargo, int dni, String nombre,
            String apellido, LocalDate fechaNac, String direccion, int telefono) {
        Empleado objetoEmpleado = new Empleado();
        objetoEmpleado.setCargo(cargo);
        objetoEmpleado.setDni(dni);
        objetoEmpleado.setNombre(nombre);
        objetoEmpleado.setApellido(apellido);
        objetoEmpleado.setFechaNac(fechaNac);
        objetoEmpleado.setDireccion(direccion);
        objetoEmpleado.setTelefono(telefono);
        Cp.persistirEmpleado(objetoEmpleado);
    }
    
    public Empleado obtenerEmpleado (int dni){
        Empleado emp = Cp.getEmpleado(dni);
        return emp; 
    }
    
    public void bajaEmpleado(int dni) throws Exception {
        Empleado objEmp = obtenerEmpleado(dni);
        objEmp.setEstado(false);
        Cp.bajaEmpleadoBd(objEmp);
    }
    
    public List listaEmpleados() {
        List objetosEmpleado = Cp.getEmpleados();
        return objetosEmpleado;
    }
    
    public void altaEmpleado(int dni) throws Exception {
        Empleado objEmp = obtenerEmpleado(dni);
        objEmp.setEstado(true);
        Cp.altaEmpleadoBd(objEmp);
    }
    
    public void modificarObjetoEmpleado(Cargo cargo, int dni, String nombre,
            String apellido, LocalDate fechaNac, String direccion, int telefono) throws Exception {
        Empleado objetoEmpleado = obtenerEmpleado(dni);
        objetoEmpleado.setCargo(cargo);
        objetoEmpleado.setNombre(nombre);
        objetoEmpleado.setApellido(apellido);
        objetoEmpleado.setFechaNac(fechaNac);
        objetoEmpleado.setDireccion(direccion);
        objetoEmpleado.setTelefono(telefono);
        Cp.editarEmpleado(objetoEmpleado);
    }
    
    // CARGO
    public void crearObjetoCargo(String nombre, int sueldo) {
        Cargo objetoCargo = new Cargo();
        objetoCargo.setCargo(nombre);
        objetoCargo.setSueldo(sueldo);
        System.out.println(objetoCargo);
        Cp.persistirCargo(objetoCargo);
    }
    
    public Cargo obtenerCargo (String nombre){
        Cargo cargo = Cp.getCargo(nombre);
        return cargo; 
    }
    
    public List listaCargos() {
        List objetosCargo = Cp.getCargos();
        return objetosCargo;
    }
    
    public void eliminarObjetoCargo(String nombre) throws NonexistentEntityException {
        Cp.eliminarCargo(nombre);
    }
    
    public void modificarObjCargo(String nombre, int sueldo) throws Exception {
        Cargo objCargo = obtenerCargo(nombre);
        objCargo.setSueldo(sueldo);
        Cp.editarCargo(objCargo);
    }
    
    
    
}
