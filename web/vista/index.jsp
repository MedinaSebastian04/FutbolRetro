<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String tipoCuenta = "admin";

%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="../css/indexCSS.css">
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        img {
            max-width: 100%;
            border-radius: 10px;
            margin-top: 20px;
        }
    </style>
        <title>Futbol Retro</title>
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
                <div class="info">
                    <div class="container">
                        <h1>Bienvenidos a la plataforma Futbol Retro</h1>
                        <p>Este aplicativo se creó con la finalidad de solucionar sus problemas y que no tenga estrés al realizar diversas tareas.</p>
                        <img src="../img/giphy.gif" alt="Futbol Retro">
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
