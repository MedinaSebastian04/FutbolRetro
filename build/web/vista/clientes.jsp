<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String tipoCuenta = "admin";

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="../css/indexCSS.css">
        <link href="../css/Cliente.css" rel="stylesheet" type="text/css"/>
        <title>Futbol Retro - Clientes</title>
    </head>
    <body>
        <div class="container-fuera">
            <div class="container-dentro">
                
                <!-- Esto es el encabezado (navegador y el boton salir) -->
                <div class="navegador">
                    <% 
                        if (tipoCuenta=="admin"){
                    %>
                    <!-- Esto es el menu de administrador -->
                    <%@ include file="menuAdmin.jsp" %>
                    <!-- -->
                    <%
                        }else{
                    %>
                    <!-- Esto es el menu de empleado -->
                    <%@ include file="menuEmpleado.jsp" %>
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
                    <h1> Registro de Cliente </h1>

                    <label for="dni">DNI:</label>
                    <input type="text" id="dni" name="dni" required><br>

                    <label for="nombre">Nombre:</label><input 
                        type="text" id="nombre" name="nombre" required><br>

                    <label for="apellido">Apellido:</label>
                    <input type="text" id="apellido" name="apellido" required><br>

                    <label for="telefono">Teléfono:</label>
                    <input type="text" id="telefono" name="telefono" required><br>

                    <label for="direccion">Dirección</label>
                    <input type="text" id="direccion" name="direccion " required><br>

                    <button type="submit">Agregar</button>
                </div>
            </div>
        </div>
    </body>
</html>
