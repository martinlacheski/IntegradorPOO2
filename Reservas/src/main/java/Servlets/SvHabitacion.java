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
            // Obtiene idObj, lo elimina y devuelve el link hacia donde ir.
            if ("delete".equals(action)) {
                int nroHab = Integer.parseInt(request.getParameter("id_habitacion"));
                try {
                    System.out.println("llego a sv");
                    Cl.eliminarObjetoHabitacion(nroHab);
                    respuestaAjax.add("/Reservas/GESTION/LIST/Habitaciones.jsp");
                    response.setContentType("application/json;charset=UTF-8");
                    response.getWriter().write(gson.toJson(respuestaAjax));
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(SvHabitacion.class.getName()).log(Level.SEVERE, null, ex);
                }
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
        } else {
            // Crea el objeto habitación y lo almacena
            int IdHabitacion = Integer.parseInt(request.getParameter("nroHabitacion"));
            String pisoHabitacion = request.getParameter("pisoHabitacion");
            String tipoHabitacion = request.getParameter("tipoHabitacion");
            int precionoche = Integer.parseInt(request.getParameter("precioNocheHabitacion"));
            TipoHabitacion tipoHabObj = Cl.obtenerTipoHabitacion(tipoHabitacion);
            Cl.crearObjetoHabitacion(IdHabitacion, pisoHabitacion, tipoHabObj, precionoche);
            response.sendRedirect("/Reservas/GESTION/LIST/Habitaciones.jsp");
        }
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
}