<%-- 
    Document   : ConsultarColaPedidos
    Created on : 22/05/2018, 06:42:25 PM
    Author     : Luis
--%>

<%@page import="Logica.Mediador"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <link rel="stylesheet" type="text/css" media="screen" href="estilos/bootstrap.min.css" />
    </head>
    <body>
        <% Mediador m = (Mediador) application.getAttribute("mediadorP");%>
        <%!
            String[] consulta = new String[4];

        %>
         <section class="container">
            <article class="jumbotron">
                <h1>Cola de pedidos</h1>
            </article>

            <script src="scripts/jquery-3.2.1.min.js"></script>
            <script src ="scripts/popper.js"></script>
            <script src="scripts/bootstrap.min.js"></script>
            <form>

                <button name ="ver" class="btn btn-link" type ="submit" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    Ver Productos
                </button>




                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Numero de compra</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Productos</th>
                        </tr>
                    </thead>
                    <tbody>


                        <%if (request.getParameter("ver") != null) {
                                ArrayList<String> datos = m.obtenerOrdenes();
                                for (int i = 0; i < datos.size(); i += 3) {
                                    out.println("<tr>");
                                    out.println("<th scope=\"col\">" + datos.get(i) + "</th>");
                                    out.println("<th scope=\"col\">" + datos.get(i + 1) + "</th>");
                                    out.println("<th scope=\"col\">" + datos.get(i + 2) + "</th>");
                                    out.println("</tr>");
                                }

                            }
                        %>




                    </tbody>
                </table>




            </form>
        </section>
    </body>
</html>
