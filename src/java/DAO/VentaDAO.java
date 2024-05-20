package DAO;

import Modelo.Venta;

public class VentaDAO extends Conexion {

    public VentaDAO() {
    }
    int r;

    public String GenerarSerie() {
        String numeroserie = "";
        String SQL = "SELECT max(numeroSerie) from venta";
        try {
            ps = con.prepareStatement(SQL);
            rs = ps.executeQuery();
            if (rs.next()) {
                numeroserie = rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println("ERROR al generar numero de serie... " + e);
        }
        return numeroserie;
    }

    public String idVentas() {
        String idventas = "";
        String SQL = "SELECT max(idVenta) from ventas;";
        try {
            ps = con.prepareStatement(SQL);
            rs = ps.executeQuery();
            if (rs.next()) {
                idventas = rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println("ERROR al encontrer el id maximo de venta..." + e);
        }
        return idventas;
    }

    public int GuardarVenta(Venta ve) {
        String SQL = "insert into ventas(idCliente, idUsuario, numeroSerie, fecha, precioTotal) values(?,?,?,NOW(),?);";
        try {
            ps = con.prepareStatement(SQL);
            ps.setInt(1, ve.getIdClienteVenta());
            ps.setInt(2, ve.getIdEmpleadoVenta());
            ps.setString(3, ve.getNumeroserie());
            ps.setDouble(4, ve.getTotalventa());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }

    public int GuardarDetallerVenta(Venta venta) {
        String SQL = "insert into detalleVenta(idVenta, idProd, descripcionProd, cantidadProd, precioProd, subTotal) values (?,?,?,?,?,?);";
        try {
            ps = con.prepareStatement(SQL);
            ps.setInt(1, venta.getIdVenta());
            ps.setInt(2, venta.getIdProducto());
            ps.setString(3, venta.getDescripcionProd());
            ps.setInt(4, venta.getCantProd());
            ps.setDouble(5, venta.getPrecioProd());
            ps.setDouble(6, venta.getSubtotal());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
}

