package Logica;
import Persistencia.ControladoraPersistencia;
import Persistencia.exceptions.NonexistentEntityException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.time.LocalDate;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraLogica {
    
    // TIPO HABITACIONES
    ControladoraPersistencia Cp = new ControladoraPersistencia();
    
    public String crearObjetoTipoHabitacion(String nombreTipo, int capacidadPersonas) {
        String error;
        TipoHabitacion objetoTipoHabitacion = new TipoHabitacion();
        objetoTipoHabitacion.setNombreHabitacion(nombreTipo);
        objetoTipoHabitacion.setCapacidadPersonas(capacidadPersonas);
        error = Cp.persistirTipoHabitacion(objetoTipoHabitacion);
        return error;
    }

    public List listaTiposHabitaciones() {
        List objetosHabitacion = Cp.getTiposHabitaciones();
        return objetosHabitacion;
    }

    public TipoHabitacion obtenerTipoHabitacion (String tipoHabitacionID){
        TipoHabitacion hab = Cp.getTipoHabitacion(tipoHabitacionID);
        return hab; 
    }
    
    public void eliminarObjetoTipoHabitacion(String tipoHabitacion) throws NonexistentEntityException{
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
            String apellido, LocalDate fechaNac, String direccion, String telefono) {
        Empleado objetoEmpleado = new Empleado();
        objetoEmpleado.setCargo(cargo);
        objetoEmpleado.setDni(dni);
        objetoEmpleado.setNombre(nombre);
        objetoEmpleado.setApellido(apellido);
        objetoEmpleado.setFechaNac(fechaNac);
        objetoEmpleado.setDireccion(direccion);
        objetoEmpleado.setTelefono(telefono);
        objetoEmpleado.setEstado(true);
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
            String apellido, LocalDate fechaNac, String direccion, String telefono) throws Exception {
        Empleado objetoEmpleado = obtenerEmpleado(dni);
        objetoEmpleado.setCargo(cargo);
        objetoEmpleado.setNombre(nombre);
        objetoEmpleado.setApellido(apellido);
        objetoEmpleado.setFechaNac(fechaNac);
        objetoEmpleado.setDireccion(direccion);
        objetoEmpleado.setTelefono(telefono);
        Cp.editarEmpleado(objetoEmpleado);
    }
    
    public void eliminarObjetoEmpleado(int idEmp) throws NonexistentEntityException {
        Cp.eliminarEmpleado(idEmp);
    }
    
    // CARGO
    public String crearObjetoCargo(String nombre, int sueldo) {
        String error;
        Cargo objetoCargo = new Cargo();
        objetoCargo.setCargo(nombre);
        objetoCargo.setSueldo(sueldo);
        System.out.println(objetoCargo);
        error = Cp.persistirCargo(objetoCargo);
        return error;
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
    
    
    // USUARIO
    public String crearObjetoUsuario(String nombreUser, String passw, Empleado emp) {
        String error;
        Usuario objetoUsuario = new Usuario();
        objetoUsuario.setNombreUsuario(nombreUser);
        objetoUsuario.setPassUsuario(passw);
        objetoUsuario.setEmpleadoAsoc(emp);
        error = Cp.persistirUser(objetoUsuario);
        return error;
    }
    
    public Usuario obtenerUser (String nombreUser){
        Usuario user = Cp.getUser(nombreUser);
        return user; 
    }
    
    public List listaUsers() {
        List objetosUsuario = Cp.getUsuarios();
        return objetosUsuario;
    }
    
    public void eliminarObjetoUsuario(String nombreUser) throws NonexistentEntityException {
        Cp.eliminarUsuario(nombreUser);
    }
    
    public void modificarObjUsuario(String nombreUser, String passw, Empleado emp) throws Exception {
        Usuario objUsuario = obtenerUser(nombreUser);
        objUsuario.setPassUsuario(passw);
        objUsuario.setEmpleadoAsoc(emp);
        Cp.editarUsuario(objUsuario);
    }
    
    public Usuario obtenerUsuarioPorDNI(Empleado emp) {
        Usuario objetoUsuario = ControladoraPersistencia.getUsuarioByEmpDNI(emp);
        return objetoUsuario;
    }
    
    
    // HUESPED
    public void crearObjetoHuesped(String profesion, int dni, String nombre,
            String apellido, LocalDate fechaNac, String direccion, String telefono) {
        Huesped objetoHuesped = new Huesped();
        objetoHuesped.setProfesion(profesion);
        objetoHuesped.setDni(dni);
        objetoHuesped.setNombre(nombre);
        objetoHuesped.setApellido(apellido);
        objetoHuesped.setFechaNac(fechaNac);
        objetoHuesped.setDireccion(direccion);
        objetoHuesped.setTelefono(telefono);
        Cp.persistirHuesped(objetoHuesped);
    }
    
    public Huesped obtenerHuesped(int dni){
        Huesped hues = Cp.getHuesped(dni);
        return hues; 
    }
    
    public List listaHuespedes() {
        List objetosHuesped = Cp.getHuespedes();
        return objetosHuesped;
    }
    
    public void modificarObjetoHuesped(String profesion, int dni, String nombre,
            String apellido, LocalDate fechaNac, String direccion, String telefono) throws Exception {
        Huesped objetoHuesped = obtenerHuesped(dni);
        objetoHuesped.setProfesion(profesion);
        objetoHuesped.setNombre(nombre);
        objetoHuesped.setApellido(apellido);
        objetoHuesped.setFechaNac(fechaNac);
        objetoHuesped.setDireccion(direccion);
        objetoHuesped.setTelefono(telefono);
        Cp.editarHuesped(objetoHuesped);
    }
    
    public void eliminarObjetoHuesped(int idHues) throws NonexistentEntityException {
        Cp.eliminarHuesped(idHues);
    }
    
    
    // RESERVA
    public void crearObjetoReserva(LocalDate checkIn, LocalDate checkOut, int cantPersonas,
                                   int montoTotal, Huesped huespedAsoc, Habitacion habReservada) {
        Reserva objetoReserva = new Reserva();
        objetoReserva.setCheckIn(checkIn);
        objetoReserva.setCheckOut(checkOut);
        objetoReserva.setFechaCreacionReserva(LocalDate.now()); // setea fecha de creación con hora del servidor
        objetoReserva.setCantPersonas(cantPersonas);
        objetoReserva.setMontoTotal(montoTotal);
        objetoReserva.setEstado(true);                          // setea reserva como activa
        objetoReserva.setHuespedAsoc(huespedAsoc);
        objetoReserva.setHabReservada(habReservada);
        Cp.persistirReserva(objetoReserva);
    }
    
    public Reserva obtenerReserva(int id){
        Reserva reser = Cp.getReserva(id);
        return reser;
    }
    
    public List listaReservas() {
        List objetosReserva = Cp.getReservas();
        return objetosReserva;
    }
    
    public void bajaReserva(int id) throws Exception{
        Reserva objetoReserva = obtenerReserva(id);
        objetoReserva.setEstado(false);
        Cp.persistirBajaReserva(objetoReserva);
    }
    
    // falta generar el método para consulta desde-hasta por huesped
    
}
