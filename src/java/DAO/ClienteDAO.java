package DAO;

import Modelo.Cliente;
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
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println("ERROR al agregar cliente: " + e);
        }
    }

    // Método para actualizar cliente
    public void actualizarCliente(Cliente client) {
        String SQL = "UPDATE clientes SET nombre = ?, apellido = ?, telefono = ?, correo = ? WHERE idClientes = ?";
        try {
            ps = con.prepareStatement(SQL);
            ps.setString(1, client.getNombre());
            ps.setString(2, client.getApellido());
            ps.setInt(3, client.getTelefono());
            ps.setString(4, client.getCorreo());
            ps.setInt(5, client.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("ERROR al actualizar cliente: " + e);
        }
    }

    // Método para eliminar cliente
    public void eliminarCliente(int id) {
        String SQL = "DELETE FROM clientes WHERE idClientes = ?";
        try {
            ps = con.prepareStatement(SQL);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("ERROR al eliminar cliente: " + e);
        }
    }

    // Método para obtener un cliente por ID
    public Cliente obtenerCliente(int id) {
        Cliente cliente = new Cliente();
        String SQL = "SELECT * FROM clientes WHERE idClientes = ?";
        try {
            ps = con.prepareStatement(SQL);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                cliente.setNombre(rs.getString(2));
                cliente.setApellido(rs.getString(3));
                cliente.setTelefono(rs.getInt(4));
                cliente.setCorreo(rs.getString(5));
            }
        } catch (Exception e) {
            System.out.println("ERROR al obtener cliente: " + e);
        }
        return cliente;
    }

    // Método para obtener todos los clientes
    public List obtenerTodosLosClientes() {
        String SQL = "SELECT idClientes, nombre, apellido, telefono, correo FROM clientes";
        List<Cliente> lista = new ArrayList();
        try {
            ps = con.prepareStatement(SQL);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt(1));
                cliente.setNombre(rs.getString(2));
                cliente.setApellido(rs.getString(3));
                cliente.setTelefono(rs.getInt(4));
                cliente.setCorreo(rs.getString(5));
                lista.add(cliente);
            }
        } catch (Exception e) {
            System.out.println("ERROR al obtener todos los clientes: " + e);
        }
        return lista;
    }

}



