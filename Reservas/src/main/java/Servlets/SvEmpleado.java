package Servlets;

import com.google.gson.Gson;
import Logica.ControladoraLogica;
import Logica.Cargo;
import Logica.Empleado;
import Persistencia.exceptions.NonexistentEntityException;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "SvEmpleado", urlPatterns = {"/SvEmpleado"})
public class SvEmpleado extends HttpServlet {

    ControladoraLogica Cl = new ControladoraLogica();
    Gson gson = new Gson();
    List<String> respuestaAjax = new ArrayList<>();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String action = request.getParameter("action");
            if ("get_empleado_data".equals(action)){
                int dni = Integer.parseInt(request.getParameter("id_empleado"));
                Empleado empObj = Cl.obtenerEmpleado(dni);
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(empObj));
            }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        boolean ajax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
        if (ajax){
            String action = request.getParameter("action");
            // Obtiene idObj, lo elimina y devuelve el link hacia donde ir.
            if ("delete".equals(action)) {
                int dni = Integer.parseInt(request.getParameter("id_empleado"));
                try {
                    Cl.eliminarObjetoEmpleado(dni);
                    respuestaAjax.add("/Reservas/GESTION/LIST/Empleados.jsp");
                    response.setContentType("application/json;charset=UTF-8");
                    response.getWriter().write(gson.toJson(respuestaAjax));
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(SvHabitacion.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
            if ("edit".equals(action)){
                int dni = Integer.parseInt(request.getParameter("dni"));
                LocalDate fechaNac = LocalDate.parse(request.getParameter("fechaNac"));
                String apellido = request.getParameter("apellido");
                String nombre = request.getParameter("nombre");
                String telefono = request.getParameter("telefono");
                String direccion = request.getParameter("direccion");
            
                String cargo = request.getParameter("cargo");
                Cargo cargoObj = Cl.obtenerCargo(cargo);
                
                try {
                    Cl.modificarObjetoEmpleado(cargoObj, dni, nombre, apellido, fechaNac, direccion, telefono);
                    respuestaAjax.add("/Reservas/GESTION/LIST/Empleados.jsp");
                    response.setContentType("application/json;charset=UTF-8");
                    response.getWriter().write(gson.toJson(respuestaAjax));
                } catch (Exception ex) {
                    Logger.getLogger(SvHabitacion.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        }else{
            int dni = Integer.parseInt(request.getParameter("dni"));
            LocalDate fechaNac = LocalDate.parse(request.getParameter("fechaNac"));
            String apellido = request.getParameter("apellido");
            String nombre = request.getParameter("nombre");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            
            String cargo = request.getParameter("cargo");
            Cargo cargoObj = Cl.obtenerCargo(cargo);
            
            Cl.crearObjetoEmpleado(cargoObj, dni, nombre, apellido, fechaNac, direccion, telefono);
            
            response.sendRedirect("/Reservas/GESTION/LIST/Empleados.jsp");
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
