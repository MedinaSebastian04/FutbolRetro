<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/loginCSS.css" rel="stylesheet" type="text/css"/>
        <title>Futbol Retro - Login</title>
    </head>
    <body>
        <div class="container">
            <div class="login">
                <h2>LOGIN</h2>
                <div class="logo">
                    <img src="img/logo2.png" alt="logo.png"/>
                </div>
                <form action="srvLogin" method="post">
                    <h3>User</h3>
                    <input class="controls" type="text" name="txtusuario" placeholder="Usuario" required>
                    <h3>Password</h3>
                    <input class="controls" type="password" name="txtclave" placeholder="Contraseña" required>
                    <input class="buttons" type="submit" name="accion" value="INGRESAR">
                    <br>
                    <%
                        String mensaje = (String) request.getAttribute("mensaje");
                        if (mensaje != null) {
                            out.print(mensaje);
                        }
                    %>
                </form>
            </div>
            <div class="publicidad">
                <img src="img/loginFondo.jpg" alt="loginFondo.jpg"/>
            </div>
        </div>
    </body>
</html>

