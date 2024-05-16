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
        <link href="../css/clienteCSS.css" rel="stylesheet" type="text/css"/>
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
                                        <input type="text" class="form-control" id="codCliente" name="codCliente" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="nombre">NOMBRE:</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="apellido">APELLIDO:</label>
                                        <input type="text" class="form-control" id="apellido" name="apellido" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="telefono">TELÉFONO:</label>
                                        <input type="tel" class="form-control" id="telefono" name="telefono" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="correo">CORREO:</label>
                                        <input type="email" class="form-control" id="correo" name="correo" required>
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
                                        <!-- Aquí se insertarán las filas de la tabla dinámicamente -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <script>
                        // Capturar el formulario de registro
                        const formCliente = document.getElementById('formulario-cliente');
                        // Agregar evento de envío para el formulario de registro
                        formCliente.addEventListener('submit', function(event) {
                            event.preventDefault();
                            // Obtener los datos del formulario de registro
                            const formData = new FormData(formCliente);
                            const rowData = [];
                            formData.forEach(value => {
                                rowData.push(value);
                            });
                            // Crear una nueva fila para la tabla de clientes
                            const newRow = document.createElement('tr');
                            rowData.forEach(value => {
                                const cell = document.createElement('td');
                                cell.textContent = value;
                                newRow.appendChild(cell);
                            });
                            // Agregar la nueva fila a la tabla de clientes
                            const tableBody = document.getElementById('tabla-clientes');
                            tableBody.appendChild(newRow);
                            // Limpiar el formulario de registro después de enviar
                            formCliente.reset();
                        });
                        // Evento para eliminar fila
                        const btnEliminar = document.getElementById('eliminar');
                        btnEliminar.addEventListener('click', function() {
                            const table = document.getElementById('tabla-clientes');
                            const rowCount = table.rows.length;
                            if (rowCount > 0) {
                                table.deleteRow(rowCount - 1);
                            }
                        });
                    </script>
                    
                    <!--PRUEBAS AVISANNNNN-->
                </div>
            </div>
        </div>
    </body>
</html>
