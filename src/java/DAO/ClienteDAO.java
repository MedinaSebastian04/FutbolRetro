package DAO;

import Modelo.Cliente;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO extends Conexion {
    public ClienteDAO() {}

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
        } catch (SQLException e) {
            System.out.println("ERROR al agregar cliente: " + e);
        } finally {
            closeResources(); // Cerrar recursos aquí
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
        } catch (SQLException e) {
            System.out.println("ERROR al actualizar cliente: " + e);
        } finally {
            closeResources(); // Cerrar recursos aquí
        }
    }

    // Método para eliminar cliente
    public void eliminarCliente(int id) {
        String SQL = "DELETE FROM clientes WHERE id = ?";
        try {
            ps = con.prepareStatement(SQL);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("ERROR al eliminar cliente: " + e);
        } finally {
            closeResources(); // Cerrar recursos aquí
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
        } catch (SQLException e) {
            System.out.println("ERROR al obtener cliente: " + e);
        } finally {
            closeResources(); // Cerrar recursos aquí
        }
        return cliente;
    }

    // Método para obtener todos los clientes
    public List obtenerTodosLosClientes() {
        List clientes = new ArrayList<>();
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
        } catch (SQLException e) {
            System.out.println("ERROR al obtener todos los clientes: " + e);
        } finally {
            closeResources(); // Cerrar recursos aquí
        }
        return clientes;
    }

    private void closeResources() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}



