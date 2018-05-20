<%-- 
    Document   : newjsp
    Created on : 19/05/2018, 05:59:57 PM
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
        
        <h1>Hello World!</h1>
        <form name="form" action="VistaIngrediente.jsp" method="get">
                    
            Nombre:<input type="text" name="nombre"> 
                        </br>

            <input type="submit" value="Enviar">
            
        </form>
    </body>
</html>
