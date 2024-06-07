<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Obtener el valor del rol desde el alcance de sesión
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    String rol = usuario.getRol();


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="css/navegadorCSS.css" rel="stylesheet" type="text/css"/>
        <link href="css/guiaCSS.css" rel="stylesheet" type="text/css"/>
        <title>Futbol Retro - Guia</title>
    </head>
    <body>
        <div class="container-fuera">
            <div class="container-dentro">
                <!-- Esto es el encabezado (navegador y el boton salir) -->
                <div class="navegador">
                    <% if (rol.equals("administrador")) { %>
                    <!-- Esto es el menu de administrador -->
                    <%@ include file="navegador/menuAdmin.jsp" %>
                    <% } else { %>
                    <!-- Esto es el menu de empleado -->
                    <%@ include file="navegador/menuEmpleado.jsp" %>
                    <% }%>
                    <div class="exit">
                        <a href="login.jsp">
                            <i class="fa-solid fa-arrow-right-from-bracket fa-flip-horizontal"></i>
                            <p>SALIR</p>
                        </a>
                    </div>
                </div>
                <!-- Aqui irán las diferentes ventanas -->
                <div class="info">
                    <h1>Guía de Uso del Sistema de Control de Ventas</h1>
                    <p>Bienvenido al sistema de control de ventas para apuestas. Esta guía te ayudará a navegar y utilizar las diferentes funcionalidades del sistema. Sigue las instrucciones a continuación según tu rol (Administrador o Empleado).</p>

                    <h2>Funciones para Administradores</h2>
                    <ul>
                        <li><strong>Gestión de Usuarios:</strong> Permite agregar, editar y eliminar usuarios del sistema. Para acceder a esta función, navega a <i>Gestionar Usuarios</i> en el menú de administrador.</li>
                        <li><strong>Reportes:</strong> Genera reportes detallados de ventas y actividad del sistema. Esta opción está disponible en <i>Reportes</i>.</li>
                        <li><strong>Configuración del Sistema:</strong> Modifica las configuraciones generales del sistema, como parámetros de seguridad y preferencias de usuario.</li>
                    </ul>

                    <h2>Funciones para Empleados</h2>
                    <ul>
                        <li><strong>Registro de Ventas:</strong> Permite registrar nuevas ventas en el sistema. Esta función está disponible en <i>Ventas</i> en el menú de empleado.</li>
                        <li><strong>Consulta de Ventas:</strong> Consulta el historial de ventas realizadas. Accede a esta función en el apartado <i>Historial de Ventas</i>.</li>
                    </ul>

                    <h2>Instrucciones Generales</h2>
                    <ol>
                        <li><strong>Inicio de Sesión:</strong> Utiliza tus credenciales proporcionadas para iniciar sesión en el sistema.</li>
                        <li><strong>Navegación:</strong> Usa el menú de la parte superior para acceder a las diferentes secciones según tu rol.</li>
                        <li><strong>Cerrar Sesión:</strong> Para salir del sistema, haz clic en el botón <i>SALIR</i> ubicado en la esquina superior derecha.</li>
                    </ol>

                </div>
            </div>
        </div>
    </body>
</html>
