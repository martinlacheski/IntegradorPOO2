package Servlets;

import Logica.ControladoraLogica;
import Logica.Habitacion;
import Logica.Reserva;
import Logica.Huesped;
import com.google.gson.Gson;
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

@WebServlet(name = "SvReserva", urlPatterns = {"/SvReserva"})
public class SvReserva extends HttpServlet {
    
    ControladoraLogica Cl = new ControladoraLogica();
    Gson gson = new Gson();
    List<String> respuestaAjax = new ArrayList<>();
    String error;
    boolean superposicion;

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
        processRequest(request, response);
        boolean ajax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
        if (ajax){
            String action = request.getParameter("action");
            if ("add".equals(action)){
                superposicion = false;
                
                // Obtención de datos
                int huespedResp = Integer.parseInt(request.getParameter("huesped"));
                int cantPersonas = Integer.parseInt(request.getParameter("cant_personas"));
                int habAReservar = Integer.parseInt(request.getParameter("habAReservar"));
                LocalDate checkIn = LocalDate.parse(request.getParameter("checkIn"));
                LocalDate checkOut = LocalDate.parse(request.getParameter("checkOut"));
                int precioReser = Integer.parseInt(request.getParameter("precioReserva"));
                
                // Instanciación de objetos asociados
                Huesped huespedObj = Cl.obtenerHuesped(huespedResp);
                Habitacion habitacionObj = Cl.obtenerHabitacion(habAReservar);
                
                // Check de superposición
                List<Reserva> listaReserva = Cl.listaReservas();
                for (Reserva reser: listaReserva){
                    if (reser.getEstado()){
                        System.out.println("Reserva analizada" + reser.toString());
                        if ((checkIn.isBefore(reser.getCheckOut()) || checkIn.isEqual(reser.getCheckOut()))
                                && (reser.getCheckIn().isBefore(checkOut) || reser.getCheckIn().isEqual(checkOut))){
                            if (reser.getHabReservada().getNroHab() == (habitacionObj.getNroHab())){
                                superposicion = true;
                            }else{
                            }
                        }
                    }
                    
                }
                
                // Si existe superposición no guardamos y se lo indicamos al front-end
                if (superposicion){
                    respuestaAjax.add("superposicion"); 
                }else {
                    // Creación de reserva
                    Cl.crearObjetoReserva(checkIn, checkOut, cantPersonas,
                                          precioReser, huespedObj, habitacionObj);
                    respuestaAjax.add("/Reservas/GESTION/LIST/Reservas.jsp");
                }
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(respuestaAjax));
            }
            
            if ("baja".equals(action)){
                int idReserva = Integer.parseInt(request.getParameter("idReserva"));
                try {
                    Cl.bajaReserva(idReserva);
                } catch (Exception ex) {
                    Logger.getLogger(SvReserva.class.getName()).log(Level.SEVERE, null, ex);
                }
                respuestaAjax.add("/Reservas/GESTION/LIST/Reservas.jsp");
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(respuestaAjax));
            }
            
            if ("informe".equals(action)){
                List<Reserva> listaInfAjax = new ArrayList<>();
                int huespedResp = Integer.parseInt(request.getParameter("huesped"));
                LocalDate desde = LocalDate.parse(request.getParameter("checkIn"));
                LocalDate hasta = LocalDate.parse(request.getParameter("checkOut"));
                System.out.println(huespedResp);
                System.out.println(desde);
                System.out.println(hasta);
                
                List <Reserva> listaInforme = Cl.listaReservas();
                for (Reserva reser: listaInforme){
                    if(reser.getHuespedAsoc().getDni() == huespedResp){
                        if ((reser.getCheckIn().isAfter(desde)) || (reser.getCheckOut().isBefore(hasta))){
                            listaInfAjax.add(reser);
                        }
                    }
                }
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(listaInfAjax));
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
