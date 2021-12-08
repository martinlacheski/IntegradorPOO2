package Servlets;

import Logica.ControladoraLogica;
import Logica.Huesped;
import Persistencia.exceptions.NonexistentEntityException;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.RollbackException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvHuesped", urlPatterns = {"/SvHuesped"})
public class SvHuesped extends HttpServlet {
    
    ControladoraLogica Cl = new ControladoraLogica();
    Gson gson = new Gson();
    List<String> respuestaAjax = new ArrayList<>();
    String error;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String action = request.getParameter("action");
            if ("get_huesped_data".equals(action)){
                int dni = Integer.parseInt(request.getParameter("id_empleado"));
                Huesped huesObj = Cl.obtenerHuesped(dni);
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(huesObj));
            }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        boolean ajax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
        if (ajax){
            String action = request.getParameter("action");
            
            if ("add".equals(action)){
                int dni = Integer.parseInt(request.getParameter("dni"));
                LocalDate fechaNac = LocalDate.parse(request.getParameter("fechaNac"));
                String apellido = request.getParameter("apellido");
                String nombre = request.getParameter("nombre");
                String telefono = request.getParameter("telefono");
                String direccion = request.getParameter("direccion");
                String profesion = request.getParameter("profesion");
                error = Cl.crearObjetoHuesped(profesion, dni, nombre, apellido,
                        fechaNac, direccion, telefono);
                if ("repetido".equals(error)){
                    respuestaAjax.add(error);
                }else{
                    respuestaAjax.add("/Reservas/GESTION/LIST/Huespedes.jsp");
                }
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(respuestaAjax));
            }
            
            // Obtiene idObj, lo elimina y devuelve el link hacia donde ir.
            if ("delete".equals(action)) {
                int dni = Integer.parseInt(request.getParameter("id_huesped"));
                try {
                    Cl.eliminarObjetoHuesped(dni);
                    respuestaAjax.add("/Reservas/GESTION/LIST/Huespedes.jsp");
                    
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(SvHabitacion.class.getName()).log(Level.SEVERE, null, ex);
                } catch (RollbackException e){                                                      // Controla la ex que indica que otros obj dependen de él.
                    respuestaAjax.add("dependencia"); 
                }
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(respuestaAjax));
            }
            
            if ("edit".equals(action)){
                int dni = Integer.parseInt(request.getParameter("dni"));
                LocalDate fechaNac = LocalDate.parse(request.getParameter("fechaNac"));
                String apellido = request.getParameter("apellido");
                String nombre = request.getParameter("nombre");
                String telefono = request.getParameter("telefono");
                String direccion = request.getParameter("direccion");
                String profesion = request.getParameter("profesion");
                try {
                    Cl.modificarObjetoHuesped(profesion, dni, nombre, apellido, fechaNac, direccion, telefono);
                    respuestaAjax.add("/Reservas/GESTION/LIST/Huespedes.jsp");
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
            String profesion = request.getParameter("profesion");
            Cl.crearObjetoHuesped(profesion, dni, nombre, apellido, fechaNac, direccion, telefono);
            response.sendRedirect("/Reservas/GESTION/LIST/Huespedes.jsp");
        }
        
    }
    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}
