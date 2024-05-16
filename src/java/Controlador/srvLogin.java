package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.*;
import Modelo.Usuario;
import javax.servlet.http.HttpSession;

@WebServlet(name = "srvLogin", urlPatterns = {"/srvLogin"})
public class srvLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String accion = request.getParameter("accion");
               
        try {
            if(accion!=null){
                switch (accion) {
                    case "verificar": VerificarLogin(request,response); break;
                    case "cerrar": CerrarSesion(request,response); break;
                    default: response.sendRedirect("login.jsp");
                }
            }else{
                response.sendRedirect("login.jps"); //regresa al login
            }
        } catch (Exception e) {
            System.out.println("ERROR.. "+e.getMessage());
        }
    }//fin processRequest

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    private void CerrarSesion(HttpServletRequest request, HttpServletResponse response){
        try{
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario",null);
            sesion.invalidate();
            response.sendRedirect("login.jsp");
        }catch(Exception ex){
            System.out.println("ERROR al cerrar sesion..."+ex.getMessage());
       }
    }//fin cerrar sesion
    
    private void VerificarLogin(HttpServletRequest request, HttpServletResponse response){
        try {
            HttpSession sesion;
            UsuarioDAO dao;
            Usuario user = new Usuario();
            user.setUsuario(request.getParameter("txtusuario"));
            user.setClave(request.getParameter("txtclave"));
            dao = new UsuarioDAO();
            Usuario usuario = dao.VerificarUsuario(user);
            if(usuario!=null){
                // Si el usuario es válido, redirigir a la página principal
                request.getSession().setAttribute("rol", usuario.getRol());
                response.sendRedirect("vista/index.jsp");
            }else{
                // Si el usuario no es válido, redirigir de vuelta a la página de inicio de sesión con un mensaje de error
                request.setAttribute("mensaje","Credenciales incorrectas...");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("ERROR al verificar sesión..."+e.getMessage());
        }
    }
}
