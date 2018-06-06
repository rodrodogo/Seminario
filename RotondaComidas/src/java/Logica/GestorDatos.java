/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import com.sun.org.apache.bcel.internal.generic.AALOAD;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Luis
 */
public class GestorDatos {

    public Connection realizaConexion() {
        Connection conn = null;
        String urlDatabase = "jdbc:postgresql://127.0.0.1/ecommerce";
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(urlDatabase, "postgres", "admin");
        } catch (Exception e) {
            System.out.println("Ocurrio un error : " + e.getMessage());
        }
        System.out.println("La conexión se realizo sin problemas! =) ");
        return conn;
    }

    public ArrayList<String> leerIngredientes() {
        Connection c = realizaConexion();
        Statement stmt = null;
       ArrayList<String> ingredientes = new ArrayList();
        try {
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM ingrediente;");
            while (rs.next()) {
                String ingrediente = new String();
                int id = rs.getInt("idingrediente");
                String nombre = rs.getString("nombre");
                String categoria = rs.getString("categoria");
                String caracteristicas = rs.getString("caracteristicas");
                int precio = rs.getInt("precio");
                boolean cambiable = rs.getBoolean("cambiable");
                int cantidad = rs.getInt("cantidad");
                ingrediente=""+nombre+","+categoria+","+cantidad+","+precio+","+cambiable+","+caracteristicas;
                ingredientes.add(ingrediente);
            }
            rs.close();
            stmt.close();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
        return ingredientes;
    }
    
    public ArrayList<String> leerProductos() {
        Connection c = realizaConexion();
        Statement stmt = null;
        ArrayList<String> productos = new ArrayList();
        try {
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM producto;");
            while (rs.next()) {
                String producto = new String();
                int id = rs.getInt(1);
                String nombre = rs.getString(2);
                boolean personalizable = rs.getBoolean(3);
                int precio = rs.getInt(4);
                producto =""+nombre+","+personalizable+","+precio+"";
                productos.add(producto);
            }
            rs.close();
            stmt.close();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
        return productos;
    }
    
    public ArrayList<String> leerMenus() {
        Connection c = realizaConexion();
        Statement stmt = null;
        ArrayList<String> menus = new ArrayList();
        try {
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM menu;");
            while (rs.next()) {
                String menu = new String();
                int id = rs.getInt(2);
                int precio = rs.getInt(3);
                String nombre = rs.getString(4);
                int idRestaurante = rs.getInt(1);
                menu= nombre+","+precio+"";
                menus.add(menu);
            }
            rs.close();
            stmt.close();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
        return menus;
    }
    
    public ArrayList<String> leerRestaurante() {
        Connection c = realizaConexion();
        Statement stmt = null;
        ArrayList<String> restaurantes = new ArrayList();
        try {
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM restaurante;");
            while (rs.next()) {
                String restaurante = new String();
                int id = rs.getInt(1);
                String descripcion = rs.getString(2);
                String direccion = rs.getString(3);
                String dueno = rs.getString(4);
                String nit = rs.getString(5);
                String nombre = rs.getString(6);
                String telefono = rs.getString(7);

                restaurante = ""+direccion+","+dueno+","+nit+","+nombre+","+telefono;
                restaurantes.add(restaurante);
            }
            rs.close();
            stmt.close();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
        return restaurantes;
    }
    
     public ArrayList<String> leerFactura() {
        Connection c = realizaConexion();
        Statement stmt = null;
        ArrayList<String> facturas = new ArrayList();
        try {
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM factura;");
            while (rs.next()) {
                String factura = new String();
                int id = rs.getInt(1);
                int idproducto = rs.getInt(2);
                String numOrden = rs.getString(3);
                String descripcion = rs.getString(4);
                boolean despachado = rs.getBoolean(5);
                String fecha = rs.getString(6);
                String nombreComprador = rs.getString(7);
                int valorCompra = rs.getInt(8);
                factura = ""+id+","+idproducto+","+numOrden+","+descripcion+","+despachado+","+fecha+","+nombreComprador+","+valorCompra;
                facturas.add(factura);
            }
            rs.close();
            stmt.close();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
        return facturas;
    }

      public ArrayList<String> leerProductoIngredientes() {
        Connection c = realizaConexion();
        Statement stmt = null;
        ArrayList<String> producIngres = new ArrayList();
        try {
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("select nombrep, nombre from producto, ingrediente,productoingrediente where ingrediente.idingrediente=productoingrediente.idingrediente and producto.idproducto=productoingrediente.idproducto ;;");
            while (rs.next()) {
                String producIngre = new String();
                String producto = rs.getString(1);
                String ingrediente= rs.getString(2);
                producIngre=""+producto+","+ingrediente+"";
                producIngres.add(producIngre);
            }
            rs.close();
            stmt.close();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
        return producIngres;
    }
      
      public ArrayList<String> leerMenuProducto() {
        Connection c = realizaConexion();
        Statement stmt = null;
        ArrayList<String> menuProdus = new ArrayList();
        try {
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("select nombrem, nombrep from producto, menu,menuproducto where menu.idmenu=menuproducto.idmenu and producto.idproducto=menuproducto.idproducto ;");
            while (rs.next()) {
                String menuProdu = new String();
                String menu = rs.getString(1);
                String producto= rs.getString(2);
                menuProdu = ""+menu+","+producto+"";
                menuProdus.add(menuProdu);
            }
            rs.close();
            stmt.close();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
        return menuProdus;
    }
     
   
}
