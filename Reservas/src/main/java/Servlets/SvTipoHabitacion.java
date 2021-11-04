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

@WebServlet(name = "SvTipoHabitacion", urlPatterns = {"/SvTipoHabitacion"})
public class SvTipoHabitacion extends HttpServlet {
    
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
            
            if ("get_tipo_habitacion_data".equals(action)){
                String nombreTipo = request.getParameter("id_tipo_habitacion");
                TipoHabitacion tipoHabObj = Cl.obtenerTipoHabitacion(nombreTipo);
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(tipoHabObj));
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
            System.out.println("hola");
            // Obtiene idObj, lo elimina y devuelve el link hacia donde ir.
            if ("delete".equals(action)) {
                String tipoHab = request.getParameter("id_tipo_habitacion");
                try {
                    Cl.eliminarObjetoTipoHabitacion(tipoHab);
                    respuestaAjax.add("/Reservas/GESTION/LIST/TiposHabitaciones.jsp");
                    response.setContentType("application/json;charset=UTF-8");
                    response.getWriter().write(gson.toJson(respuestaAjax));
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(SvTipoHabitacion.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
            if ("edit".equals(action)){
                String tipoHab = request.getParameter("id_tipo_habitacion");
                int capacidad = Integer.parseInt(request.getParameter("capacidadTipoHab"));
                try {
                    Cl.modificarObjTipoHabitacion(tipoHab, capacidad);
                    respuestaAjax.add("/Reservas/GESTION/LIST/TiposHabitaciones.jsp");
                    response.setContentType("application/json;charset=UTF-8");
                    response.getWriter().write(gson.toJson(respuestaAjax));
                } catch (Exception ex) {
                    Logger.getLogger(SvTipoHabitacion.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } else {
            String nombreTipo = request.getParameter("tipoHabNombre");
            int cantPersonas = Integer.parseInt(request.getParameter("capacidadPersonas"));
            Cl.crearObjetoTipoHabitacion(nombreTipo, cantPersonas);
            response.sendRedirect("/Reservas/GESTION/LIST/TiposHabitaciones.jsp");

        }

        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
