package Servlets;

import com.google.gson.Gson;
import Logica.ControladoraLogica;
import Logica.Cargo;
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


@WebServlet(name = "SvCargo", urlPatterns = {"/SvCargo"})
public class SvCargo extends HttpServlet {

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
            if ("get_cargo_data".equals(action)){
                String nombreCargo = request.getParameter("id_cargo");
                Cargo cargoObj = Cl.obtenerCargo(nombreCargo);
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(cargoObj));
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        boolean ajax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
        
        if (ajax){
            String action = request.getParameter("action");
            System.out.println(action);
            if ("delete".equals(action)) {
                String cargoId = request.getParameter("id_cargo");
                try {
                    Cl.eliminarObjetoCargo(cargoId);
                    respuestaAjax.add("/Reservas/GESTION/LIST/Cargos.jsp");
                    response.setContentType("application/json;charset=UTF-8");
                    response.getWriter().write(gson.toJson(respuestaAjax));
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(SvTipoHabitacion.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
            if ("edit".equals(action)){
                String cargoId = request.getParameter("id_cargo");
                int sueldo = Integer.parseInt(request.getParameter("sueldo"));
                try {
                    Cl.modificarObjCargo(cargoId, sueldo);
                    respuestaAjax.add("/Reservas/GESTION/LIST/Cargos.jsp");
                    response.setContentType("application/json;charset=UTF-8");
                    response.getWriter().write(gson.toJson(respuestaAjax));
                } catch (Exception ex) {
                    Logger.getLogger(SvTipoHabitacion.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } else {
            String nombreCargo = request.getParameter("cargo");
            int sueldo = Integer.parseInt(request.getParameter("sueldo"));
            System.out.println(nombreCargo);
            System.out.println(sueldo);
            Cl.crearObjetoCargo(nombreCargo, sueldo);
            response.sendRedirect("/Reservas/GESTION/LIST/Cargos.jsp");


        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
