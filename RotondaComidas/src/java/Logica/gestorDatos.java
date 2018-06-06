/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Luis
 */
public class gestorDatos {

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
                ingrediente=""+id+","+nombre+","+categoria+","+caracteristicas+","+precio+"";
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
                int id = rs.getInt(1);
                String nombre = rs.getString(2);
                boolean personalizable = rs.getBoolean(3);
                int precio = rs.getInt(4);
                System.out.println("ID = " + id);
                System.out.println("nombre = " + nombre);
                System.out.println("precio = " + precio);
                System.out.println("cambiable = " + personalizable);
                System.out.println();
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
    
    public void leerMenus() {
        Connection c = realizaConexion();
        Statement stmt = null;
        try {
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM menu;");
            while (rs.next()) {
                int id = rs.getInt(2);
                int precio = rs.getInt(3);
                String nombre = rs.getString(4);
                int idRestaurante = rs.getInt(1);
                System.out.println("ID = " + id);
                System.out.println("nombre = " + nombre);
                System.out.println("precio = " + precio);
                System.out.println("idrestaurante= " + idRestaurante);
                System.out.println();
            }
            rs.close();
            stmt.close();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
        
    }
    
    public void leerRestaurante() {
        Connection c = realizaConexion();
        Statement stmt = null;
        try {
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM restaurante;");
            while (rs.next()) {
                int id = rs.getInt(1);
                String descripcion = rs.getString(2);
                String direccion = rs.getString(3);
                String dueno = rs.getString(4);
                String nit = rs.getString(5);
                String nombre = rs.getString(6);
                String telefono = rs.getString(7);

                System.out.println("ID = " + id);
                System.out.println("nombre = " + nombre);
                System.out.println("descripcion = " + descripcion);
                System.out.println("direccion= " + direccion);
                System.out.println("dueno= " + dueno);
                System.out.println("nit= " + nit);
                System.out.println("telefono= " + telefono);
                System.out.println();
            }
            rs.close();
            stmt.close();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
        
    }
    
     public void leerFactura() {
        Connection c = realizaConexion();
        Statement stmt = null;
        try {
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM factura;");
            while (rs.next()) {
                int id = rs.getInt(1);
                int idproducto = rs.getInt(2);
                String numOrden = rs.getString(3);
                String descripcion = rs.getString(4);
                boolean despachado = rs.getBoolean(5);
                String fecha = rs.getString(6);
                String nombreComprador = rs.getString(7);
                int valorCompra = rs.getInt(8);

                System.out.println("ID = " + id);
                System.out.println("idproducto = " + idproducto);
                System.out.println("numOrden = " + numOrden);
                System.out.println("descripcion= " + descripcion);
                System.out.println("despachado= " + despachado);
                System.out.println("fecha= " + fecha);
                System.out.println("nombreComprador= " + nombreComprador);
                System.out.println("valorCompra= " + valorCompra);
                System.out.println();
            }
            rs.close();
            stmt.close();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
        
    }

      public void leerProductoIngredientes() {
        Connection c = realizaConexion();
        Statement stmt = null;
        try {
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("select nombrep, nombre from producto, ingrediente,productoingrediente where ingrediente.idingrediente=productoingrediente.idingrediente and producto.idproducto=productoingrediente.idproducto ;;");
            while (rs.next()) {
                String producto = rs.getString(1);
                String ingrediente= rs.getString(2);
                System.out.println("producto = " + producto);
                System.out.println("ingrediente = " + ingrediente);
                System.out.println();
            }
            rs.close();
            stmt.close();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
        
    }
      
      public void leerMenuProducto() {
        Connection c = realizaConexion();
        Statement stmt = null;
        try {
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("select nombrem, nombrep from producto, menu,menuproducto where menu.idmenu=menuproducto.idmenu and producto.idproducto=menuproducto.idproducto ;");
            while (rs.next()) {
                String menu = rs.getString(1);
                String producto= rs.getString(2);
                System.out.println("menu = " + menu);
                System.out.println("producto = " + producto);
                System.out.println();
            }
            rs.close();
            stmt.close();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
        
    }
     
    public static void main(String[] args) {
        gestorDatos gestor = new gestorDatos();
        System.out.println(gestor.leerIngredientes().get(0));
    } 
}
