package Servlets;

import Logica.ControladoraLogica;
import Logica.Empleado;
import Logica.Usuario;
import Persistencia.exceptions.NonexistentEntityException;
import com.google.gson.Gson;
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

@WebServlet(name = "SvUsuario", urlPatterns = {"/SvUsuario"})
public class SvUsuario extends HttpServlet {
    
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
            if ("get_user_data".equals(action)){
                String nombreUser = request.getParameter("id_user");
                Usuario user = Cl.obtenerUser(nombreUser);
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(user));
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
                String userId = request.getParameter("id_user");
                try {
                    Cl.eliminarObjetoUsuario(userId);
                    respuestaAjax.add("/Reservas/GESTION/LIST/Usuarios.jsp");
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(SvTipoHabitacion.class.getName()).log(Level.SEVERE, null, ex);
                } catch (RollbackException e){                                                      // Controla la ex que indica que otros obj dependen de él.
                    respuestaAjax.add("dependencia");
                }
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(respuestaAjax));
            }
            
            
            /* ACCIONES */ 
            if ("edit".equals(action)){
                String userId = request.getParameter("id_user");
                String passw = request.getParameter("new_pass");
                int empString = Integer.parseInt(request.getParameter("empleadoAsoc"));
                System.out.println(empString);
                Empleado empObj = Cl.obtenerEmpleado(empString);
                
                try {
                    Cl.modificarObjUsuario(userId, passw, empObj);
                    respuestaAjax.add("/Reservas/GESTION/LIST/Usuarios.jsp");
                    response.setContentType("application/json;charset=UTF-8");
                    response.getWriter().write(gson.toJson(respuestaAjax));
                } catch (Exception ex) {
                    Logger.getLogger(SvTipoHabitacion.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
            if ("add".equals(action)){
                String nombreUser = request.getParameter("id_user");
                String passw = request.getParameter("pass");
                int empString = Integer.parseInt(request.getParameter("empleadoAsoc"));
                Empleado empObj = Cl.obtenerEmpleado(empString);
                error = Cl.crearObjetoUsuario(nombreUser, passw, empObj);
                if ("repetido".equals(error)){
                    respuestaAjax.add(error);
                }else{
                    respuestaAjax.add("/Reservas/GESTION/LIST/Usuarios.jsp");
                }
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(respuestaAjax));
            }
            
            if ("baja".equals(action)){
                String nombreUser = request.getParameter("id_user");
                try {
                    Cl.darBajaUsuario(nombreUser);
                } catch (Exception ex) {
                    Logger.getLogger(SvUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
                respuestaAjax.add("/Reservas/GESTION/LIST/Usuarios.jsp");
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(respuestaAjax));
            }
            
            if ("alta".equals(action)){
                String nombreUser = request.getParameter("id_user");
                try {
                    Cl.darAltaUsuario(nombreUser);
                } catch (Exception ex) {
                    Logger.getLogger(SvUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
                respuestaAjax.add("/Reservas/GESTION/LIST/Usuarios.jsp");
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(respuestaAjax));
            }
            
        }else{
            
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
