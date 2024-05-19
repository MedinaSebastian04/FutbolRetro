package DAO;

import Modelo.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO extends Conexion {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public ClienteDAO() {
        this.con = this.getConnection(); 
    }

    // Método para agregar cliente
    public void agregarCliente(Cliente cliente) {
        String SQL = "INSERT INTO clientes (nombre, apellido, telefono, correo) VALUES (?, ?, ?, ?)";
        try {
            ps = con.prepareStatement(SQL);
            ps.setString(1, cliente.getNombre());
            ps.setString(2, cliente.getApellido());
            ps.setInt(3, cliente.getTelefono());
            ps.setString(4, cliente.getCorreo());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("ERROR al agregar cliente: " + e.getMessage());
        } finally {
            closeResources();
        }
    }

    // Método para actualizar cliente
    public void actualizarCliente(Cliente cliente) {
        String SQL = "UPDATE clientes SET nombre = ?, apellido = ?, telefono = ?, correo = ? WHERE id = ?";
        try {
            ps = con.prepareStatement(SQL);
            ps.setString(1, cliente.getNombre());
            ps.setString(2, cliente.getApellido());
            ps.setInt(3, cliente.getTelefono());
            ps.setString(4, cliente.getCorreo());
            ps.setInt(5, cliente.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("ERROR al actualizar cliente: " + e.getMessage());
        } finally {
            closeResources();
        }
    }

    // Método para eliminar cliente
    public void eliminarCliente(int id) {
        String SQL = "DELETE FROM clientes WHERE id = ?";
        try {
            ps = con.prepareStatement(SQL);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("ERROR al eliminar cliente: " + e.getMessage());
        } finally {
            closeResources();
        }
    }

    // Método para obtener un cliente por ID
    public Cliente obtenerCliente(int id) {
        Cliente cliente = null;
        String SQL = "SELECT * FROM clientes WHERE id = ?";
        try {
            ps = con.prepareStatement(SQL);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                cliente = new Cliente();
                cliente.setId(rs.getInt("id"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setApellido(rs.getString("apellido"));
                cliente.setTelefono(rs.getInt("telefono"));
                cliente.setCorreo(rs.getString("correo"));
            }
        } catch (Exception e) {
            System.out.println("ERROR al obtener cliente: " + e.getMessage());
        } finally {
            closeResources();
        }
        return cliente;
    }

    // Método para obtener todos los clientes
    public List<Cliente> obtenerTodosLosClientes() {
        List<Cliente> clientes = new ArrayList<>();
        String SQL = "SELECT * FROM clientes";
        try {
            ps = con.prepareStatement(SQL);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("id"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setApellido(rs.getString("apellido"));
                cliente.setTelefono(rs.getInt("telefono"));
                cliente.setCorreo(rs.getString("correo"));
                clientes.add(cliente);
            }
        } catch (Exception e) {
            System.out.println("ERROR al obtener todos los clientes: " + e.getMessage());
        } finally {
            closeResources();
        }
        return clientes;
    }

    // Método para cerrar recursos
    private void closeResources() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception e) {
            System.out.println("ERROR al cerrar recursos: " + e.getMessage());
        }
    }

    private Connection getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
