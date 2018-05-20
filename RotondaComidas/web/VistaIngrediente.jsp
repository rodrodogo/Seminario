<%-- 
    Document   : VistaIngrediente
    Created on : 19/05/2018, 08:34:54 PM
    Author     : Rodrigon
--%>

<%@page import="Logica.Mediador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar ingredientes</title>
    </head>
    <body>
        <h1>ingrediente</h1>
        
        <%
            Mediador m = new Mediador();
            String nom=request.getParameter("nombre");
            out.println( m.consultarIng(nom));
               
            
        %>
    </body>
</html>
