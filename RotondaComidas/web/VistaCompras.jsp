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

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="estilos/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="estilos/estilos.css" />
    </head>
    <body>

        <% Mediador m = (Mediador) application.getAttribute("mediadorP");%>
       
        <section class="container">

<article class="jumbotron">
            <h1>Realiza tu carrito de compras</h1>
            </article>
            
            <h2>Menus</h2>


            <form action="#">

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
                                out.println("<th scope=\"col\"> <button name =\"" + i + "\" class=\"btn btn-primary bg-success\" type =\"submit\"> Añadir </button>" + "</th>");
                                out.println("<th scope=\"col\"><input name =\"c" + i + "\"  type=\"number\"  placeholder=\"cantidad\" value=\"\"></th>");
                                out.println("</tr>");
                                          
                            }


                        %>
                        <% 
                            for (int i = 0; i < datos.size(); i++) {
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

                    
                        <%  
                            ArrayList<String> temp = m.tempCarrito();
                            
                            for (int i = 0; i < temp.size(); i++) {
                                if (request.getParameter("x" + i) != null) {
                                    m.eliminarProductoCarrito(i);
                                    out.println("Eliminacion exitosa");
                                    temp.remove(i);
                                }
                            }
                            if (!temp.isEmpty()) {
                                for (int i = 0; i < temp.size(); i++) {
                                    out.println("<tr>");
                                    out.println("<th scope=\"col\">" + (i + 1) + "</th>");
                                    out.println("<th scope=\"col\">" + temp.get(i) + "</th>");
                                    out.println("<th scope=\"col\"> <button name =\"x" + i + "\" class=\"btn btn-primary bg-success\" type =\"submit\"  \"> X </button>" + "</th>");
                                    out.println("</tr>");

                                }
                            }

                        %>
                    



                    </tbody>
                    
                </table>
                <button name ="finalizar" class="btn btn-primary bg-success" type ="submit" >
                    Finalizar Orden
                </button> 
                <%  if (request.getParameter("finalizar") != null) {
                        m.finalizarOrden();
                        String redirectURL = "index.jsp";
                        response.sendRedirect(redirectURL);
                    }
                %>
            </form>
        </section> 
        <script src="scripts/jquery-3.2.1.min.js"></script>
        <script src ="scripts/popper.js"></script>
        <script src="scripts/bootstrap.min.js"></script>
    </body>
</html>
