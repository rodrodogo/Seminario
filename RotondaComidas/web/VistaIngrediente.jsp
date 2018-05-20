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
            String asd = request.getParameter("nombre");
            String[] consulta;
            if (request.getParameter("actualizarIng") == null) {
                
                consulta = m.consultarIng(asd);
            }else{
                consulta = new String[6];
                for (int i = 0; i < 6; i++) {
                        consulta[i] = "enviado";
                    }
            }
        %>
        <form>

            Nombre:<input type="text" name="nom" value="<%=consulta[0]%> "> 
            </br>
            Nombre:<input type="text" name="categoria"value="<%=consulta[1]%>" > 
            </br>
            Nombre:<input type="text" name="cantidad"value="<%=consulta[2]%>" > 
            </br>
            Nombre:<input type="text" name="precio"value="<%=consulta[3]%>" > 
            </br>
            Nombre:<input type="text" name="cambiable"value="<%=consulta[4]%>" > 
            </br>
            Nombre:<input type="text" name="caracteristicas"value="<%=consulta[5]%>" > 
            </br>


            <input type="submit" name="actualizarIng" value="Enviar">

        </form>  
        <%
            if (request.getParameter("actualizarIng") != null) {
                String[] actualizacion = new String[6];
                actualizacion[0] = request.getParameter("nom");
                actualizacion[1] = request.getParameter("categoria");
                actualizacion[2] = request.getParameter("cantidad");
                actualizacion[3] = request.getParameter("precio");
                actualizacion[4] = request.getParameter("cambiable");
                actualizacion[5] = request.getParameter("caracteristicas");
                out.println(actualizacion[0]);
                out.println(actualizacion[1]);
                out.println(actualizacion[2]);
                out.println(actualizacion[3]);
                out.println(actualizacion[4]);
                out.println(actualizacion[5]);

                m.actualizarIng(actualizacion);

            }

        %>

    </body>
</html>
