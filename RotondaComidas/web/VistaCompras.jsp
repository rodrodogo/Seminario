<%-- 
    Document   : Compras
    Created on : 3/06/2018, 02:36:20 PM
    Author     : Rodrigon
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="Logica.Mediador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="scripts/jquery-3.2.1.min.js"></script>
        <script src ="scripts/popper.js"></script>
        <script src="scripts/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <% Mediador m = (Mediador) application.getAttribute("mediadorP");%>
        <h1>Realiza tu carrito de comras</h1>
        <h2>Menus</h2>
        <nav class="navbar navbar-expand-lg navbar-light "  style="background-color: #e3f2fd;">
            <a class="navbar-brand" href="index.jsp">Tu Rotonda</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-na navbar navbar-dark ">
                    <a class="nav-item nav-link" href="VistaRestaurante.jsp">Gestion Restaurantes</a>                        
                    <a class="nav-item nav-link" href="VistaMenu.jsp">Gestionar menu</a>
                    <a class="nav-item nav-link" href="VistaProducto.jsp">Gestionar productos</a>
                    <a class="nav-item nav-link " href="VistaIngrediente.jsp">Gestion de ingredientes </a>
                    <a class="nav-item nav-link " href="VistaConsultarColaPedidos.jsp">Consultar Cola de pedidos</a>
                </div>
            </div>
        </nav>
        <section class="container">
            <form>

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre </th>
                            <th scope="col">Productos</th>
                            <th scope="col">Precio</th>


                        </tr>
                    </thead>
                    <tbody>


                        <%
                            ArrayList<String> datos = m.obtenerMenus();

                            for (int i = 0; i < datos.size(); i += 3) {
                                out.println("<tr>");
                                out.println("<th scope=\"col\">" + (i + 1) + "</th>");
                                out.println("<th scope=\"col\">" + datos.get(i) + "</th>");
                                out.println("<th scope=\"col\">" + datos.get(i + 1) + "</th>");
                                out.println("<th scope=\"col\">" + datos.get(i + 2) + "</th>");
                                out.println("<th scope=\"col\"> <button name =\"" + i + "\" class=\"btn btn-primary bg-success\" type =\"submit\" data-toggle=\"collapse\" data-target=\"#collapseOne\" aria-expanded=\"true\" aria-controls=\"collapseOne\"> Añadir </button>" + "</th>");
                                out.println("<th scope=\"col\"><input name =\"c" + i + "\"  type=\"number\"  placeholder=\"cantidad\" value=\"\"></th>");
                                out.println("</tr>");

                            }


                        %>
                        <%                            for (int i = 0; i < datos.size(); i++) {
                                if (request.getParameter("" + i) != null) {
                                    out.println(datos.get(i));
                                    m.añadirProductoCarrito(datos.get(i), request.getParameter("c" + i));

                                }
                            }


                        %>




                    </tbody>
                </table>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col" >#</th>
                            <th scope="col">Nombre </th>
                            <th scope="col">Menu</th>
                            <th scope="col">Precio</th>


                        </tr>
                    </thead>
                    <tbody>


                        <%                            ArrayList<String> temp = m.tempCarrito();
                            if (!temp.isEmpty()) {
                                for (int i = 0; i < temp.size(); i++) {
                                    out.println("<tr>");
                                    out.println("<th scope=\"col\">" + (i + 1) + "</th>");
                                    out.println("<th scope=\"col\">" + temp.get(i) + "</th>");
                                    out.println("<th scope=\"col\"> <button name =\"x" + i + "\" class=\"btn btn-primary bg-success\" type =\"submit\" data-toggle=\"collapse\" data-target=\"#collapseOne\" aria-expanded=\"true\" aria-controls=\"collapseOne\" \"> X </button>" + "</th>");
                                    out.println("</tr>");

                                }
                            }
                            for (int i = 0; i < temp.size(); i++) {
                                if (request.getParameter("x" + i) != null) {
                                    m.eliminarProductoCarrito(i);
                                    out.println("dos");

                                }
                            }


                        %>




                    </tbody>
                </table>
                <button name ="finalizar" class="btn btn-primary bg-success" type ="submit" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    Finalizar Orden
                </button> 
                <%                    if (request.getParameter("finalizar") != null) {
                        m.finalizarOrden();
                        String redirectURL = "index.jsp";
                        response.sendRedirect(redirectURL);
                    }
                %>
            </form>
        </section> 
    </body>
</html>
