<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario" %>
<%@page import="DAO.*" %>
<%@page import="java.util.*" %>
<%
    // Obtener el valor del rol desde el alcance de sesión
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    String rol = usuario.getRol();

    // Obtener la lista de los usuarios
    List<Usuario> listaUsuarios = (List<Usuario>) request.getAttribute("listausuarios");

    // Obtener el usuario selecionado para editar
    Usuario usuarioSeleccionado = (Usuario) request.getAttribute("usuarioSeleccionado");

%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="css/navegadorCSS.css" rel="stylesheet" type="text/css"/>
        <link href="css/usuariosCSS.css" rel="stylesheet" type="text/css"/>
        <title>Futbol Retro - Usuarios</title>

    </head>
    <body>
        <div class="container-fuera">
            <div class="container-dentro">

                <!-- Esto es el encabezado (navegador y el boton salir) -->
                <div class="navegador">
                    <%                        if (rol.equals("administrador")) {
                    %>
                    <!-- Esto es el menu de administrador -->
                    <%@ include file="navegador/menuAdmin.jsp" %>
                    <!-- -->
                    <%
                    } else {
                    %>
                    <!-- Esto es el menu de empleado -->
                    <%@ include file="navegador/menuEmpleado.jsp" %>
                    <!-- -->
                    <%
                        }
                    %>

                    <div class="exit">
                        <a href="login.jsp">
                            <i class="fa-solid fa-arrow-right-from-bracket fa-flip-horizontal"></i>
                            <p>SALIR</p>
                        </a>
                    </div>
                </div>
                <!-- -->


                <!-- Aqui irán las diferentes ventanas (solo es copiar el mismo formato, crear un jsp con nombre "Productos" y aqui empezar a programar-->
                <!-- Aca puedes cambiar el nombre del class y hacer un css nuevo para este div que sera la ventana usuarios -->
                <div class="info">

                    <div class="container-usuarios">
                        <div class="ventana-usuarios">
                            <!-- Lado izquierdo: Formulario de registro de usuarios -->
                            <div class="izquierda">
                                <BR>
                                <form id="formulario-usuario"action="srvUsuario" method="post">
                                    <div class="form-group">
                                        <label for="nombre">NOMBRE:</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" value="<%= (usuarioSeleccionado != null ? usuarioSeleccionado.getNombre() : "")%>"required>
                                    </div>
                                    <div class="form-group">
                                        <label for="apellido">APELLIDO:</label>
                                        <input type="text" class="form-control" id="apellido" name="apellido" value="<%= (usuarioSeleccionado != null ? usuarioSeleccionado.getApellido() : "")%>" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="dni">DNI:</label>
                                        <input type="number" class="form-control" id="dni" name="dni" value="<%= (usuarioSeleccionado != null ? usuarioSeleccionado.getDni() : "")%>" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="usuario">USUARIO:</label>
                                        <input type="text" class="form-control" id="usuario" name="usuario" value="<%= (usuarioSeleccionado != null ? usuarioSeleccionado.getUsuario() : "")%>" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="contrasena">CONTRASEÑA:</label>
                                        <input type="password" class="form-control" id="contrasena" name="contrasena" value="<%= (usuarioSeleccionado != null ? usuarioSeleccionado.getClave() : "")%>" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="rol">ROL:</label>
                                        <select class="form-control" id="rol" name="rol" required>
                                            <option value="empleado" <%= (usuarioSeleccionado != null ? (usuarioSeleccionado.getRol().equals("empleado") ? "selected" : "") : "")%>>EMPLEADO</option>
                                            <option value="administrador" <%= (usuarioSeleccionado != null ? (usuarioSeleccionado.getRol().equals("administrador") ? "selected" : "") : "")%>>ADMINISTRADOR</option>
                                        </select>
                                    </div>
                                    <div class="btn-group">
                                        <button type="submit" class="btn btn-primary" name="accion" value="agregar" id="agregar">Agregar</button>
                                        <button type="submit" class="btn btn-danger" name="accion" value="actualizar" id="actualizar">Actualizar</button>
                                    </div>
                                </form>
                            </div>
                            <!-- Lado derecho: Tabla de usuarios -->
                            <div class="derecha">
                                
                                <table class="table">
                                    <thead class="cabecera">
                                        <tr>
                                            <th>ID</th>
                                            <th>NOMBRE</th>
                                            <th>APELLIDO</th>
                                            <th>DNI</th>
                                            <th>USUARIO</th>
                                            <th>CLAVE</th>
                                            <th>ROL</th>
                                            <th>ACCIONES</th>
                                        </tr>
                                    </thead>
                                    <tbody class="contenido">
                                        <%
                                            if (listaUsuarios != null) {
                                                for (Usuario usuarios : listaUsuarios) {%>
                                        <tr>
                                            <td><%= usuarios.getId()%></td>
                                            <td><%= usuarios.getNombre()%></td>
                                            <td><%= usuarios.getApellido()%></td>
                                            <td><%= usuarios.getDni()%></td>
                                            <td><%= usuarios.getUsuario()%></td>
                                            <td><%= usuarios.getClave()%></td>
                                            <td><%= usuarios.getRol()%></td>
                                            <td class="btn-group">
                                                <!-- Aquí puedes agregar botones para acciones como editar o eliminar -->
                                                <a class="btn btn-primary" href="srvUsuario?accion=editar&id=<%= usuarios.getId()%>">Editar</a>
                                                <a class="btn btn-danger" href="srvUsuario?accion=eliminar&id=<%= usuarios.getId()%>">Eliminar</a>
                                            </td>
                                        </tr>
                                        <% }
                                        } else { %>
                                        <tr>
                                            <td colspan="6">No hay usuarios disponibles</td>
                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>