
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.*;
import Modelo.Producto;
import java.util.List;

@WebServlet(name = "srvProductos", urlPatterns = {"/srvProductos"})
public class srvProductos extends HttpServlet{
    
    int idProducto;
    ProductosDAO productodao = new ProductosDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");
        
        ProductosDAO productoDAO = new ProductosDAO();
        Producto producto = new Producto();
        
        if (accion != null) {
            switch (accion) {
                case "Listar":
                    List lista = productodao.RecuperarProducto();
                    request.setAttribute("listaproductos", lista);
                    request.getRequestDispatcher("productos.jsp").forward(request, response);
                    break;
                    
                case "agregar":
                    String descripcion = request.getParameter("descripcion");
                    int precio = Integer.parseInt(request.getParameter("precio"));
                    int stock = Integer.parseInt(request.getParameter("stock"));
                    String categoria = request.getParameter("categoria"); 
                    producto.setDescripcion(descripcion);
                    producto.setPrecio(precio);
                    producto.setStock(stock);
                    producto.setCategoria(categoria);
                    request.getRequestDispatcher("srvPrductos?accion=Listar").forward(request, response); 
                    break; 
                case "editar":
                    idProducto = Integer.parseInt(request.getParameter("id"));
                    Producto productoid = productodao.MostrarProducto(idProducto);
                    request.setAttribute("productoSeleccionado", productoid);
                    request.getRequestDispatcher("srvProductos?accion=Listar").forward(request, response);
                    
                    break;
                
                case "actualizar":
                    String descripcionUpdate = request.getParameter("descripcion");
                    int precioUpdate = Integer.parseInt(request.getParameter("precio"));
                    int stockUpdate = Integer.parseInt(request.getParameter("stock"));
                    String categoriaUpdate = request.getParameter("categoria");
                    producto.setDescripcion(descripcionUpdate);
                    producto.setPrecio(precioUpdate);
                    producto.setStock(stockUpdate);
                    producto.setCategoria(categoriaUpdate);
                    producto.setIdProd(idProducto);
                    productoDAO.ActualizarProducto(producto);
                    request.getRequestDispatcher("srvProductos?accion=Listar").forward(request, response);
                    
                    break;
                
                case "eliminar":
                    idProducto = Integer.parseInt(request.getParameter("id"));
                    productoDAO.EliminarProducto(idProducto);
                    request.getRequestDispatcher("srvProdcutos?accion=Listar").forward(request, response);
                    
                    break;

                default: request.getRequestDispatcher("srvProductos?accion=Listar").forward(request, response);
            }
            
        } else {
            response.sendRedirect("productos.jsp");
        }

    }
    
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
    
    
}
