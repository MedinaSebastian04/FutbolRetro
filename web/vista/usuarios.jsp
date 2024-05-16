<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Obtener el valor del rol desde el alcance de sesión
    String rol = (String) session.getAttribute("rol");

%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="../css/navegadorCSS.css" rel="stylesheet" type="text/css"/>
        <link href="../css/usuariosCSS.css" rel="stylesheet" type="text/css"/>
        <title>Futbol Retro - Usuarios</title>

    </head>
    <body>
        <div class="container-fuera">
            <div class="container-dentro">

                <!-- Esto es el encabezado (navegador y el boton salir) -->
                <div class="navegador">
                    <%                        
                        if (rol.equals("administrador")) {
                    %>
                    <!-- Esto es el menu de administrador -->
                    <%@ include file="menuAdmin.jsp" %>
                    <!-- -->
                    <%
                        } else {
                    %>
                    <!-- Esto es el menu de empleado -->
                    <%@ include file="menuEmpleado.jsp" %>
                    <!-- -->
                    <%
                        }
                    %>

                    <div class="exit">
                        <a href="../login.jsp">
                            <i class="fa-solid fa-arrow-right-from-bracket fa-flip-horizontal"></i>
                            <p>SALIR</p>
                        </a>
                    </div>
                </div>
                <!-- -->


                <!-- Aqui irán las diferentes ventanas (solo es copiar el mismo formato, crear un jsp con nombre "Productos" y aqui empezar a programar-->
                <!-- Aca puedes cambiar el nombre del class y hacer un css nuevo para este div que sera la ventana usuarios -->
                <div class="info">

                    <style>
                        /* Estilos para la tabla */
                        table {
                            width: 100%;
                            background-color: white; /* Color de fondo negro */
                            color: white; /* Color del texto blanco */
                        }
                    </style> 

                    <div class="container">
                        <div class="row">
                            <!-- Lado izquierdo: Formulario de registro de usuarios -->
                            <div class="col-md-6">
                                <BR>
                                <form id="formulario-usuario">
                                    <div class="form-group">
                                        <label for="nombre">NOMBRE:</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="apellido">APELLIDO:</label>
                                        <input type="text" class="form-control" id="apellido" name="apellido" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="dni">DNI:</label>
                                        <input type="number" class="form-control" id="dni" name="dni" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="usuario">USUARIO:</label>
                                        <input type="text" class="form-control" id="usuario" name="usuario" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="contrasena">CONTRASEÑA:</label>
                                        <input type="password" class="form-control" id="contrasena" name="contrasena" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="rol">ROL:</label>
                                        <select class="form-control" id="rol" name="rol" required>
                                            <option value="usuario">USUARIO</option>
                                            <option value="administrador">ADMINISTRADOR</option>
                                        </select>
                                    </div>
                                    <div class="btn-group">
                                        <button type="submit" class="btn btn-primary">Agregar</button>
                                        <button type="button" class="btn btn-danger" id="eliminar">Eliminar</button>
                                    </div>
                                </form>
                            </div>
                            <!-- Lado derecho: Tabla de usuarios -->
                            <div class="col-md-6">
                                <BR>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Usuario</th>
                                            <th>Contraseña</th>
                                            <th>Rol</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tabla-usuarios">
                                        <!-- Aquí se insertarán las filas de la tabla dinámicamente -->
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
