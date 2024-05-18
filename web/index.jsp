<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario" %>
<%
    // Obtener el valor del rol desde el alcance de sesión
    Usuario usuario2 = (Usuario) session.getAttribute("usuario");
    String rol = usuario2.getRol();
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link href="css/navegadorCSS.css" rel="stylesheet" type="text/css"/>
        <link href="css/indexCSS.css" rel="stylesheet" type="text/css"/>
        <title>Futbol Retro</title>
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
                        <a href="srvLogin?accion=cerrar">
                            <i class="fa-solid fa-arrow-right-from-bracket fa-flip-horizontal"></i>
                            <p>SALIR</p>
                        </a>
                    </div>
                </div>
                <!-- -->
                
                
                <!-- Aqui irán las diferentes ventanas (solo es copiar el mismo formato, crear un jsp con nombre "Productos" y aqui empezar a programar-->
                <div class="info">
                    <div class="container">
                        <h1>Bienvenidos a la plataforma Futbol Retro</h1>
                        <p>Este aplicativo se creó con la finalidad de solucionar sus problemas y que no tenga estrés al realizar diversas tareas.</p>
                        <img src="img/giphy.gif" alt="Futbol Retro">
                        
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
