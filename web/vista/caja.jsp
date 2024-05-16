<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario" %>
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
        <link href="../css/cajaCSS.css" rel="stylesheet" type="text/css"/>
        <title>Futbol Retro - Caja</title>
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
                        <a href="../login.jsp">
                            <i class="fa-solid fa-arrow-right-from-bracket fa-flip-horizontal"></i>
                            <p>SALIR</p>
                        </a>
                    </div>
                </div>
                <!-- -->
                
                
                <!-- Aqui irán las diferentes ventanas (solo es copiar el mismo formato, crear un jsp con nombre "Productos" y aqui empezar a programar-->
                <!-- Aca puedes cambiar el nombre del class y hacer un css nuevo para este div que sera la ventana caja -->
                <div class="info">
                    <!--AVISAN PLIS SI ESTA BIEN :'( -->
                                
                <div class="container">
                        <h2 class="text-center">Registro de Ventas</h2>
                        
                        <div class="row">
                            <!-- Formulario de venta en el lado izquierdo -->
                            <div class="col-md-6">
                                <form id="formulario-venta">
                                    <div class="form-group">
                                        <label for="codCliente">COD CLIENTE:</label>
                                        <input type="text" class="form-control" id="codCliente" name="codCliente" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="codProducto">COD PRODUCTO:</label>
                                        <input type="text" class="form-control" id="codProducto" name="codProducto" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="precio">PRECIO:</label>
                                        <input type="number" class="form-control" id="precio" name="precio" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="cantidad">CANTIDAD:</label>
                                        <input type="number" class="form-control" id="cantidad" name="cantidad" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="cliente">CLIENTE:</label>
                                        <input type="text" class="form-control" id="cliente" name="cliente" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="producto">PRODUCTO:</label>
                                        <input type="text" class="form-control" id="producto" name="producto" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Registrar Venta</button>
                                </form>
                            </div>
                            <!-- Tabla de ventas en el lado derecho -->
                            <div class="col-md-6">
                                <table class="table">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">COD CLIENTE</th>
                                            <th scope="col">COD PRODUCTO</th>
                                            <th scope="col">PRECIO</th>
                                            <th scope="col">CANTIDAD</th>
                                            <th scope="col">CLIENTE</th>
                                            <th scope="col">PRODUCTO</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tabla-ventas">
                                        <!-- Aquí se insertarán las filas de la tabla dinámicamente -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                <script>
                        // Capturar el formulario
                        const form = document.getElementById('formulario-venta');

                        // Agregar evento de envío
                        form.addEventListener('submit', function(event) {
                            // Evitar que el formulario se envíe normalmente
                            event.preventDefault();

                            // Obtener los datos del formulario
                            const formData = new FormData(form);
                            const rowData = [];

                            formData.forEach(value => {
                                rowData.push(value);
                            });

                            // Crear una nueva fila para la tabla
                            const newRow = document.createElement('tr');
                            rowData.forEach(value => {
                                const cell = document.createElement('td');
                                cell.textContent = value;
                                newRow.appendChild(cell);
                            });

                            // Agregar la nueva fila a la tabla
                            const tableBody = document.getElementById('tabla-ventas');
                            tableBody.appendChild(newRow);

                            // Limpiar el formulario después de enviar
                            form.reset();
                        });
                    </script>
                    
                    <!--AVISAN PLIS SI ESTA BIEN :'( -->
                </div>
            </div>
        </div>
    </body>
</html>
