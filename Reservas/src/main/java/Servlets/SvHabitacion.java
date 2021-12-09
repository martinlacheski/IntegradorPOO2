package Servlets;

import com.google.gson.Gson;
import Logica.ControladoraLogica;
import Logica.Habitacion;
import Logica.TipoHabitacion;
import Persistencia.exceptions.NonexistentEntityException;
import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet(name = "SvHabitacion", urlPatterns = {"/SvHabitacion"})
public class SvHabitacion extends HttpServlet {
    
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
        boolean ajax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
        
        // Si la request es de tipo AJAX
        if (ajax) {
            String action = request.getParameter("action");
            if ("get_habitacion_data".equals(action)){
                int nroHab = Integer.parseInt(request.getParameter("id_habitacion"));
                Habitacion habObj = Cl.obtenerHabitacion(nroHab);
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(habObj));
            }
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        boolean ajax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
        
        if (ajax) {
            String action = request.getParameter("action");
            
            if("add".equals(action)){
                // Crea el objeto habitación y lo almacena
                int IdHabitacion = Integer.parseInt(request.getParameter("nroHabitacion"));
                String pisoHabitacion = request.getParameter("pisoHabitacion");
                String tipoHabitacion = request.getParameter("tipoHabitacion");
                int precionoche = Integer.parseInt(request.getParameter("precioNocheHabitacion"));
                TipoHabitacion tipoHabObj = Cl.obtenerTipoHabitacion(tipoHabitacion);
                error = Cl.crearObjetoHabitacion(IdHabitacion, pisoHabitacion,
                        tipoHabObj, precionoche);
                // Check en caso de que se quiera agregar un registro ya existente
                if ("repetido".equals(error)){
                    respuestaAjax.add(error);
                }else{
                    respuestaAjax.add("/Reservas/GESTION/LIST/Habitaciones.jsp");
                }
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(respuestaAjax));
                
            }
            
            // Obtiene idObj, lo elimina y devuelve el link hacia donde ir.
            if ("delete".equals(action)) {
                int nroHab = Integer.parseInt(request.getParameter("id_habitacion"));
                try {
                    Cl.eliminarObjetoHabitacion(nroHab);
                    respuestaAjax.add("/Reservas/GESTION/LIST/Habitaciones.jsp");
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(SvTipoHabitacion.class.getName()).log(Level.SEVERE, null, ex);
                } catch (RollbackException e){                                                      // Controla la ex que indica que otros obj dependen de él.
                    respuestaAjax.add("dependencia"); 
                }
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(respuestaAjax));
            }
            
            /* Obtiene id_obj y sus campos complementarios, lo modifica y almacena.
            Devuelve el link hacia donde ir. */
            if ("edit".equals(action)){
                int IdHabitacion = Integer.parseInt(request.getParameter("nroHabitacion"));
                String pisoHabitacion = request.getParameter("pisoHabitacion");
                String tipoHabitacion = request.getParameter("tipoHabitacion");
                int precionoche = Integer.parseInt(request.getParameter("precioNocheHabitacion"));
                TipoHabitacion tipoHabObj = Cl.obtenerTipoHabitacion(tipoHabitacion);
                
                try {
                    Cl.modificarObjHabitacion(IdHabitacion, pisoHabitacion, tipoHabObj, precionoche);
                    respuestaAjax.add("/Reservas/GESTION/LIST/Habitaciones.jsp");
                    response.setContentType("application/json;charset=UTF-8");
                    response.getWriter().write(gson.toJson(respuestaAjax));
                } catch (Exception ex) {
                    Logger.getLogger(SvHabitacion.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
            if ("baja".equals(action)){
                int IdHabitacion = Integer.parseInt(request.getParameter("nroHabitacion"));
                try {
                    Cl.bajaHabitacion(IdHabitacion);
                } catch (Exception ex) {
                    Logger.getLogger(SvUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
                respuestaAjax.add("/Reservas/GESTION/LIST/Habitaciones.jsp");
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(respuestaAjax));
            }
            
            if ("alta".equals(action)){
                int IdHabitacion = Integer.parseInt(request.getParameter("nroHabitacion"));
                try {
                    Cl.altaHabitacion(IdHabitacion);
                } catch (Exception ex) {
                    Logger.getLogger(SvUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
                respuestaAjax.add("/Reservas/GESTION/LIST/Habitaciones.jsp");
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(respuestaAjax));
            }
            
        }
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
}