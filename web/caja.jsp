<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*" %>

<%
    // Obtener el valor del rol desde el alcance de sesión
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    String rol = usuario.getRol();

%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="css/navegadorCSS.css" rel="stylesheet" type="text/css"/>
        <link href="css/cajaCSS.css" rel="stylesheet" type="text/css"/>
        <title>Futbol Retro - Caja</title>
        <style>
            @media print{
                .navegador, .izquierda, .btn, .titulo, .accion{
                    display: none;
                }
            }
            .info {
            background-image: url('img/gif3.gif');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            /* Estilos adicionales para el contenedor */
            /* Por ejemplo, puedes establecer la altura, el ancho, la alineación, etc. */
            min-height: 100vh; /* Esto asegurará que el fondo cubra todo el viewport */
            /* Añade más estilos según sea necesario */
        }
        </style>
    </head>
    <body>
        <div class="container-fuera">
            <div class="container-dentro">

                <!-- Esto es el encabezado (navegador y el boton salir) -->
                <div class="navegador">
                    <%                        if (rol.equals("administrador")) {
                    %>
                    <!-- Esto es el menu de administrador -->
                    <%@ include file="navegador/menuAdmin.jsp" %>
                    <!-- -->
                    <%
                    } else {
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
                <!-- Aca puedes cambiar el nombre del class y hacer un css nuevo para este div que sera la ventana caja -->
                <div class="info">
                    <!--AVISAN PLIS SI ESTA BIEN :'( -->

                    <div class="container-caja">
                        <h2 class="text-center titulo">Registro de Ventas</h2>

                        <div class="ventana-caja">
                            <!-- Formulario de venta en el lado izquierdo -->
                            <div class="izquierda">
                                <form id="formulario-venta" action="srvCaja" method="post">
                                    <div class="card-body">

                                        <label>Datos del Cliente</label>
                                        <div class="form-group d-flex">
                                            <div class="col-md-4 d-flex">
                                                <input type="text" name="dnicliente" value="${c.getDni()}" placeholder="DNI" class="form-control">
                                                <button type="submit" class="btn btn-outline-info" name="accion" value="BuscarCliente" id="buscarcliente">Buscar</button>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="text" name="nombrecliente" value="${c.getNombre()} ${c.getApellido()}" placeholder="Datos Cliente" class="form-control">
                                            </div>
                                        </div>

                                        <label>Datos del producto</label>
                                        <div class="form-group d-flex">
                                            <div class="col-md-4 d-flex">
                                                <input type="text" name="codigoproducto" value="${producto.getIdProd()}" placeholder="Codigo" class="form-control" >
                                                <button type="submit" class="btn btn-outline-info" name="accion" value="BuscarProducto" id="buscarproducto">Buscar</button>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="text" name="nombreproducto" value="${producto.getDescripcion()}" placeholder="Datos Producto" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group d-flex">
                                            <div class="col-md-4 d-flex">
                                                <input type="text" name="precio" value="${producto.getPrecio()}" class="form-control" placeholder="S/. 0.00" >
                                            </div>
                                            <div class="col-md-3">
                                                <input type="number" name="cant" value="1" placeholder="Cantidad" class="form-control">
                                            </div>
                                            <div class="col-md-3">
                                                <input type="text" name="stock" value="${producto.getStock()}" placeholder="Stock" class="form-control">
                                            </div>
                                        </div>
                                        <!-- BOTON PARA AGREGAR PRODUCTO AL REGISTRO -->
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-outline-info" name="accion" value="Agregar" id="agregarventa">Agregar</button>
                                        </div>
                                    </div>
                                </form>

                            </div>

                            <!-- Tabla para ver los productos-->
                            <!-- Tabla de ventas -->
                            <div class="derecha">
                                <div class="d-flex col-sm-5 ml-auto" id="nroserie">
                                    <label>Nro.Serie:</label>
                                    <input type="text" name="NroSerie" value="${nserie}" class="form-control">
                                </div>
                                <div class="scroll">
                                    <table class="table" id="tabla-ventas">
                                        <thead class="cabecera-venta">
                                            <tr>
                                                <th>Nro</th>
                                                <th>Descripcion</th>
                                                <th>Precio</th>
                                                <th>Cantidad</th>
                                                <th>SubTotal</th>
                                                <th class="accion">Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody id="contenido-venta">
                                            <c:forEach var="list" items="${listaVentas}">
                                                <tr>
                                                    <th>${list.getItem()}</th>
                                                    <th>${list.getDescripcionProd()}</th>
                                                    <th>${list.getPrecioProd()}</th>
                                                    <th>${list.getCantProd()}</th>
                                                    <th>${list.getSubtotal()}</th>
                                                    <th>
                                                        <a class="btn btn-danger" href="">Eliminar</a> 
                                                    </th>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="card-footer">
                                    <div class="col-sm-5">
                                        <a href="srvCaja?accion=GenerarVenta" class="btn btn-success" onclick="print()">Generar Venta</a>
                                        <input type="submit" name="accion" value="Cancelar" class="btn btn-danger">
                                    </div>
                                    <div class="col-sm-3 ml-auto">
                                        <input type="text" name="txtTotal" value="S/. ${totalpagar}0" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
