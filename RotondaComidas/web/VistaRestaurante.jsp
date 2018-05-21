<%-- 
    Document   : vistaRestaurante
    Created on : 20/05/2018, 10:17:41 AM
    Author     : fcher
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Logica.Mediador"%>
<%@page import="Logica.GestorRestaurante"%>
<%@page import="Logica.Restaurante"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="estilos/bootstrap.min.css" />
    </head>
    <body>
        <% Mediador m = (Mediador) application.getAttribute("mediadorP");%>

        <section class="container">
            <form>
                <div class="form-group">
                    <label for="direccion">Direccion restaurante</label>
                    <input name ="dir" type="text" class="form-control" id="direccion" required ="true" placeholder="Ingrese la direccion del restaurante">

                </div>
                <div class="form-group">
                    <label for="dueño">Dueño restaurante</label>
                    <input name ="owner" type="text" class="form-control" id="dueño" required ="true" placeholder="Ingrese el nombre del dueño del rest...">

                </div>
                <div class="form-group">
                    <label for="nit">Nit restaurante</label>
                    <input name ="nit"  type="number" class="form-control" id="nit" required ="true" placeholder="Ingrese el nit del restaurante">

                </div>
                <div class="form-group">
                    <label for="nombre">Nombre restaurante</label>
                    <input name ="nombre"  type="text" class="form-control" id="nombre" required ="true" placeholder="Ingrese el nombre del restaurante">

                </div>
                <div class="form-group">
                    <label for="tel">telefono restaurante</label>
                    <input name ="tel"  type="number" class="form-control" id="nit"  required ="true" placeholder="Ingrese el telefono del restaurante">

                </div>
                <button type="submit" class="btn btn-primary" name="registrar">Registrar</button>
                <button type="submit" class="btn btn-primary" name="mod">Modificar Datos</button>
                <% if (request.getParameter("registrar") != null) {
                        String[] actualizacion = new String[6];
                        actualizacion[0] = request.getParameter("dir");
                        actualizacion[1] = request.getParameter("owner");
                        actualizacion[2] = request.getParameter("nit");
                        actualizacion[3] = request.getParameter("nombre");
                        actualizacion[4] = request.getParameter("tel");
                        boolean res = m.registrarRestaurante(actualizacion, 1);
                        if (res == false) {
                            out.println("<br>Registro Fallido el restaurante ya ha sido creado");
                        } else {
                            out.println("<br>Registro exitoso");
                        }
                    }
                    if (request.getParameter("mod") != null) {
                        String[] actualizacion = new String[6];
                        actualizacion[0] = request.getParameter("dir");
                        actualizacion[1] = request.getParameter("owner");
                        actualizacion[2] = request.getParameter("nit");
                        actualizacion[3] = request.getParameter("nombre");
                        actualizacion[4] = request.getParameter("tel");
                        boolean res = m.registrarRestaurante(actualizacion, 2);
                        if (res == false) {
                            out.println("<br>Registro Fallido el restaurante no existe");
                        } else {
                            out.println("<br>Modificacion extosa");
                        }
                    }
                %>
            </form>
            <form>

                <button name ="ver" class="btn btn-link" type ="submit" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    Ver restaurante
                </button>




                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre </th>
                            <th scope="col">Nit</th>
                            <th scope="col">Dueño</th>
                        </tr>
                    </thead>
                    <tbody>
                        

                            <%if (request.getParameter("ver") != null) {
                                    ArrayList<String> datos = m.obtenerRestaurantes();
                                    for (int i = 0; i < datos.size(); i+=3) {
                                             out.println("<tr>");
                                             out.println("<th scope=\"col\">" +(i+1)+ "</th>");
                                             out.println("<th scope=\"col\">" +datos.get(i)+ "</th>");
                                             out.println("<th scope=\"col\">" +datos.get(i+1)+ "</th>");
                                             out.println("<th scope=\"col\">" +datos.get(i+2)+ "</th>");
                                             out.println("</tr>");
                                        }
                                   
                                }
                            %>


                        

                    </tbody>
                </table>



            </form>

        </section>       
        <script src="scripts/jquery-3.2.1.min.js"></script>
        <script src ="scripts/popper.js"></script>
        <script src="scripts/bootstrap.min.js"></script>
    </body>
</html>
