package DAO;

import Modelo.Cliente;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO extends Conexion {
    public ClienteDAO() {}
    public void agregarCliente(Cliente cliente) throws Exception {
        String SQL = "INSERT INTO clientes (nombre, apellido, telefono, correo) VALUES (?, ?, ?, ?)";
        try {
            ps = con.prepareStatement(SQL);
            ps.setString(1, cliente.getNombre());
            ps.setString(2, cliente.getApellido());
            ps.setInt(3, cliente.getTelefono());
            ps.setString(4, cliente.getCorreo());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al agregar cliente: " + e);
        }
    }

    public void actualizarCliente(Cliente cliente) throws Exception {
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
            System.out.println("Error al actualizar cliente: " + e);
        }
    }

    public void eliminarCliente(int id) throws Exception {
        String SQL = "DELETE FROM clientes WHERE id = ?";
        try {
            ps = con.prepareStatement(SQL);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al eliminar cliente: " + e);
        }
    }

    public Cliente obtenerCliente(int id) throws Exception {
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
            System.out.println("Error al obtener cliente: " + e);
        }
        return cliente;
    }

    public List<Cliente> obtenerTodosLosClientes() throws Exception {
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
            System.out.println("Error al obtener todos los clientes: " + e);
        }
        return clientes;
    }
}

