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
import javax.persistence.RollbackException;
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
            if ("delete".equals(action)) {
                String cargoId = request.getParameter("id_cargo");
                try {
                    Cl.eliminarObjetoCargo(cargoId);
                    respuestaAjax.add("/Reservas/GESTION/LIST/Cargos.jsp");
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(SvTipoHabitacion.class.getName()).log(Level.SEVERE, null, ex);
                } catch (RollbackException e){                                                      // Controla la ex que indica que otros obj dependen de él.
                    respuestaAjax.add("dependencia"); 
                }
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(respuestaAjax));
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
            
            if ("add".equals(action)){
                String nombreCargo = request.getParameter("cargo");
                int sueldo = Integer.parseInt(request.getParameter("sueldo"));
                System.out.println(nombreCargo);
                System.out.println(sueldo);
                error = Cl.crearObjetoCargo(nombreCargo, sueldo);
                if ("repetido".equals(error)){
                    respuestaAjax.add(error);
                }else{
                    respuestaAjax.add("/Reservas/GESTION/LIST/TiposHabitaciones.jsp");
                }
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(respuestaAjax));
            }
        } else {
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
