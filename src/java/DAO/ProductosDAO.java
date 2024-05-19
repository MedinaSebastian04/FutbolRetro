
package DAO;

import Modelo.Producto;
import java.util.ArrayList;
import java.util.List;

public class ProductosDAO extends Conexion{
    public ProductosDAO(){}
    
     public List RecuperarProducto() {
        String SQL = "select idProd, descripcion, precio, stock, categoria from productos;";
        List<Producto> lista = new ArrayList();
        try {
            ps = con.prepareStatement(SQL);
            rs = ps.executeQuery();//ejecutamos la consulta
            while (rs.next()) { //recorremos todos los registros
                Producto prod = new Producto();//creamos el objeto
                prod.setIdProd(rs.getInt(1));
                prod.setDescripcion(rs.getString(2));
                prod.setPrecio(rs.getInt(3));
                prod.setStock(rs.getInt(4));
                prod.setCategoria(rs.getString(5));
                lista.add(prod); //agregamos el objeto a la lista
            }
        } catch (Exception ex) {
            System.out.println("ERROR no se puede traer la lista de productos a la base de datos. " + ex);
        }
        return lista; // retornamos la lista con todos los registros
    }
    
     public void InsertarProducto (Producto prod){
        String SQL = "insert into productos( descripcion, precio, stock, categoria) values (?, ?, ?, ?, ?, ?);";
        try {
            ps = con.prepareStatement(SQL);
            ps.setString(1, prod.getDescripcion());
            ps.setInt(2, prod.getPrecio());
            ps.setInt(3, prod.getStock());
            ps.setString(4, prod.getCategoria());
            ps.close();
            con.close();
        } catch (Exception ex) {
            System.out.println("ERROR al insertar productos. " + ex);
        }
    }
     //metodo para eliminar 
    public void EliminarProducto(int idProducto){
        String SQL = "DELETE FROM productos  WHERE idProd = ?;";
        try {
            ps = con.prepareStatement(SQL);
            ps.setInt(1, idProducto);
            ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println("ERROR al eliminar prodcutos... " + ex);
        }
    }
    //metodo para listar el prodcuto a editar por id
    public Producto MostrarProducto(int idProducto){
        Producto producto = new Producto();
        String SQL = "SELECT * FROM productos WHERE idProd = ?;";
        try {
            ps = con.prepareStatement(SQL);
            ps.setInt(1, idProducto);
            rs = ps.executeQuery();
            if (rs.next()) {
                producto.setDescripcion(rs.getString(2));
                producto.setPrecio(rs.getInt(3));
                producto.setStock(rs.getInt(4));
                producto.setCategoria(rs.getString(5));
            }
        } catch (Exception ex) {
            System.out.println("ERROR al obtener el productos por ID... "+ex);
        }
        return producto;
    }
     //metodo para actualizar usuario
    public void ActualizarProducto(Producto prod){
        String SQL = "UPDATE producto SET descripcion = ?, precio = ?, stock = ?, categoria = ? WHERE idProd = ?;";
        try {
            ps = con.prepareStatement(SQL);
            ps.setString(1, prod.getDescripcion());
            ps.setInt(2, prod.getPrecio());
            ps.setInt(3, prod.getStock());
            ps.setString(4, prod.getCategoria());
            ps.setInt(5, prod.getIdProd());
            ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println("ERROR al actualizar producto... " + ex);
        }
    }

    
}
