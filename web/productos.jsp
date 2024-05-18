<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Modelo.Usuario" %>
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
        <link href="css/productosCSS.css" rel="stylesheet" type="text/css"/>
        <title>Futbol Retro - Productos</title>
        

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
                <!-- Aca puedes cambiar el nombre del class y hacer un css nuevo para este div que sera la ventana productos -->
                <div class="info">
                    <!--AVISAN PLIS SI ESTA BIEN :'( -->
                    
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
                            <!-- Lado izquierdo: Formulario de registro de productos -->
                            <div class="col-md-6">
                                <h2 class="text-center">Registro de Productos</h2>
                                <form id="formulario-producto">
                                    <div class="form-group">
                                        <label for="codigoProd">Código de Producto:</label>
                                        <input type="text" class="form-control" id="codigoProd" name="codigoProd" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="descripcion">Descripción:</label>
                                        <input type="text" class="form-control" id="descripcion" name="descripcion" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="precio">Precio:</label>
                                        <input type="number" class="form-control" id="precio" name="precio" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="stock">Stock:</label>
                                        <input type="number" class="form-control" id="stock" name="stock" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="categoria">Categoría:</label>
                                        <select class="form-control" id="categoria" name="categoria" required>
                                            <option value="cam_club">CAM CLUB</option>
                                            <!-- Agrega más opciones de categorías aquí si es necesario -->
                                        </select>
                                    </div>
                                    <div class="btn-group">
                                        <button type="submit" class="btn btn-primary">Agregar</button>
                                        <button type="button" class="btn btn-danger" id="eliminar">Eliminar</button>
                                    </div>
                                </form>
                            </div>
                            <!-- Lado derecho: Tabla de productos -->
                            <div class="col-md-6">
                                <h2 class="text-center">Lista de Productos</h2>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Código de Producto</th>
                                            <th>Descripción</th>
                                            <th>Precio</th>
                                            <th>Stock</th>
                                            <th>Categoría</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tabla-productos">
                                        <!-- Aquí se insertarán las filas de la tabla dinámicamente -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <script>
                        // Capturar el formulario de registro de productos
                        const formProducto = document.getElementById('formulario-producto');
                        // Agregar evento de envío para el formulario de registro de productos
                        formProducto.addEventListener('submit', function(event) {
                            event.preventDefault();
                            // Obtener los datos del formulario de registro de productos
                            const formData = new FormData(formProducto);
                            const rowData = [];
                            formData.forEach(value => {
                                rowData.push(value);
                            });
                            // Crear una nueva fila para la tabla de productos
                            const newRow = document.createElement('tr');
                            rowData.forEach(value => {
                                const cell = document.createElement('td');
                                cell.textContent = value;
                                newRow.appendChild(cell);
                            });
                            // Agregar la nueva fila a la tabla de productos
                            const tableBody = document.getElementById('tabla-productos');
                            tableBody.appendChild(newRow);
                            // Limpiar el formulario de registro después de enviar
                            formProducto.reset();
                        });
                        // Evento para eliminar fila
                        const btnEliminar = document.getElementById('eliminar');
                        btnEliminar.addEventListener('click', function() {
                            const table = document.getElementById('tabla-productos');
                            const rowCount = table.rows.length;
                            if (rowCount > 0) {
                                table.deleteRow(rowCount - 1);
                            }
                        });
                    </script>
                    
                    <!--AVISAN PLIS SI ESTA BIEN :'( -->
                </div>
            </div>
        </div>
    </body>
</html>
