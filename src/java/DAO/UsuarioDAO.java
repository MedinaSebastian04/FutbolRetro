package DAO;

import Modelo.Usuario;

public class UsuarioDAO extends Conexion{
    public UsuarioDAO(){}
    public Usuario VerificarUsuario(Usuario user) throws Exception{
        Usuario usuario = null;
        String SQL="select * from usuario where usuario=? and clave=?";
        try {
            ps=con.prepareStatement(SQL);
            ps.setString(1, user.getUsuario());
            ps.setString(2, user.getClave());
            rs = ps.executeQuery();
            if(rs.next()){
                usuario = new Usuario();
                usuario.setId(rs.getInt(1));
                usuario.setNombre(rs.getString(2));
                usuario.setApellido(rs.getString(3));
                usuario.setDni(rs.getInt(4));
                usuario.setUsuario(rs.getString(5));
                usuario.setClave(rs.getString(6));
                usuario.setRol(rs.getString(7));
            }   
        } catch (Exception e) {
            System.out.println("ERROR al recuperar usuario: "+e);
        }
        
        return usuario;
    }
}
