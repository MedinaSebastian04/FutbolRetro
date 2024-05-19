<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Modelo.Usuario"%>
<%@page import="Modelo.Cliente"%>
<%@page import="DAO.*" %>
<%@page import="java.util.*" %>
<%
    // Obtener el valor del rol desde el alcance de sesión
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    String rol = usuario.getRol();

    // Obtener la lista de los usuarios
    List<Cliente> listaClientes = (List<Cliente>) request.getAttribute("listaclientes");

    // Obtener el usuario selecionado para editar
    Cliente clienteSeleccionado = (Cliente) request.getAttribute("clienteSeleccionado");

%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="css/navegadorCSS.css" rel="stylesheet" type="text/css"/>
        <link href="css/clienteCSS.css" rel="stylesheet" type="text/css"/>
        <title>Futbol Retro - Clientes</title>
    </head>
    <body>
        <div class="container-fuera">
            <div class="container-dentro">
                
                <!-- Esto es el encabezado (navegador y el boton salir) -->
                <div class="navegador">
                    <% 
                        if (rol.equals("administrador")){
                    %>
                    <!-- Esto es el menu de administrador -->
                    <%@ include file="navegador/menuAdmin.jsp" %>
                    <!-- -->
                    <%
                        }else{
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
                <!-- Aca puedes cambiar el nombre del class y hacer un css nuevo para este div que sera la ventana cliente -->
                <div class="info">
                    <!--PRUEBAS AVISANNNNN-->
                    
                    <style>
                        .form-group {
                            margin-bottom: 10px;
                        }
                        .btn-group {
                            margin-top: 10px;
                        }
                        #formulario-buscar {
                            display: none;
                        }
                        /* Estilos para la tabla */
                        table {
                            background-color: white;
                        }
                    </style>
                       
                    <div class="container">
                        <div class="row">
                            <!-- Lado izquierdo: Formulario de registro -->
                            <div class="col-md-6">
                     <br>
                                <form id="formulario-cliente">
                                    <div class="form-group">
                                        <label for="codCliente">COD CLIENTE:</label>
                                        <input type="text" class="form-control" id="codCliente" name="codCliente" value="<%= (clienteSeleccionado != null ? clienteSeleccionado.getId() : "")%>" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="nombre">NOMBRE:</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" value="<%= (clienteSeleccionado != null ? clienteSeleccionado.getNombre() : "")%>" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="apellido">APELLIDO:</label>
                                        <input type="text" class="form-control" id="apellido" name="apellido" value="<%= (clienteSeleccionado != null ? clienteSeleccionado.getApellido() : "")%>" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="telefono">TELÉFONO:</label>
                                        <input type="tel" class="form-control" id="telefono" name="telefono" value="<%= (clienteSeleccionado != null ? clienteSeleccionado.getTelefono() : "")%>" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="correo">CORREO:</label>
                                        <input type="email" class="form-control" id="correo" name="correo" value="<%= (clienteSeleccionado != null ? clienteSeleccionado.getCorreo() : "")%>" required>
                                    </div>
                                    <div class="btn-group">
                                        <button type="submit" class="btn btn-primary">Agregar</button>
                                        <button type="button" class="btn btn-danger" id="eliminar">Eliminar</button>
                                    </div>
                                </form>
                            </div>
                            <!-- Lado derecho: Tabla de clientes -->
                            <div class="col-md-6">
                <br>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>COD CLIENTE</th>
                                            <th>NOMBRE</th>
                                            <th>APELLIDO</th>
                                            <th>TELÉFONO</th>
                                            <th>CORREO</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tabla-clientes">
                                        <%
                                            if (listaClientes != null) {
                                                for (Cliente clientes : listaClientes) {%>
                                        <tr>
                                            <td><%= clientes.getId()%></td>
                                            <td><%= clientes.getNombre()%></td>
                                            <td><%= clientes.getApellido()%></td>
                                            <td><%= clientes.getTelefono()%></td>
                                            <td><%= clientes.getCorreo()%></td>
                                            <td class="btn-group">
                                                <!-- Aquí puedes agregar botones para acciones como editar o eliminar -->
                                                <a class="btn btn-primary" href="srvUsuario?accion=editar&id=<%= clientes.getId()%>">Editar</a>
                                                <a class="btn btn-danger" href="srvUsuario?accion=eliminar&id=<%= clientes.getId()%>">Eliminar</a>
                                            </td>
                                        </tr>
                                        <% }
                                        } else { %>
                                        <tr>
                                            <td colspan="6">No hay clientes disponibles</td>
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
