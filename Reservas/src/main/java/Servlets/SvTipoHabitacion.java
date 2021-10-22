package Servlets;

import Logica.ControladoraLogica;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvTipoHabitacion", urlPatterns = {"/SvTipoHabitacion"})
public class SvTipoHabitacion extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ControladoraLogica Cl = new ControladoraLogica();
        boolean ajax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));

        if (ajax) {
            
        } else {
            String nombreTipo = request.getParameter("tipoHabNombre");
            int cantPersonas = Integer.parseInt(request.getParameter("capacidadPersonas"));
            Cl.crearObjetoTipoHabitacion(nombreTipo, cantPersonas);
        }

        response.sendRedirect("/Reservas/GESTION/LIST/TiposHabitaciones.jsp");
        
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
