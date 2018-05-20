<%-- 
    Document   : Exito
    Created on : 19/05/2018, 10:24:22 PM
    Author     : Rodrigon
--%>

<%@page import="Logica.Mediador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Operacion con exito</h1>
         <%
            Mediador ma = new Mediador();
            String[] actualizacion = new String[6];
            actualizacion[0] =request.getParameter("nom");
            actualizacion[1] =request.getParameter("categoria");
            actualizacion[2] =request.getParameter("cantidad");
            actualizacion[3] =request.getParameter("precio");
            actualizacion[4] =request.getParameter("cambiable");
            actualizacion[5] =request.getParameter("caracteristicas");
            
            
            
            
        %>
        
    </body>
</html>
