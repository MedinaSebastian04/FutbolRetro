<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <%
    // Obtener el parámetro idVenta de la solicitud
    String idVentaParam = (String) request.getAttribute("idVenta");
    %>
    <%
    if (idVentaParam != null && !idVentaParam.isEmpty()) {
        Connection conn = null;
        try {
            // Cargar el driver de MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Conectar a la base de datos
            String url = "jdbc:mysql://localhost:3307/FutbolRetro";
            String user = "root";
            String password = "";
            conn = DriverManager.getConnection(url, user, password);

            File reportFile = new File(application.getRealPath("reportes/Boleta.jasper"));
            Map parameters = new HashMap();
              

            //parameters.put("nombre_del_parametro_jasper", "valor que se manda");
            parameters.put("idVentaParam",idVentaParam);
            
            
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outputStream = response.getOutputStream();
            outputStream.write(bytes, 0, bytes.length);
            outputStream.flush();
            outputStream.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    } else {
        out.println("No se proporcionó el parámetro idVenta.");
    }
    %>
</body>
</html>
