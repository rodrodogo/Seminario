/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.util.ArrayList;

/**
 *
 * @author Rodrigon
 */
public class Menu {

    private String nombre;
    private ArrayList<String> productos;    
    private int precio;

    public Menu(String nombre, String productos, int precio) {
        this.nombre = nombre;
        this.productos = new ArrayList<>();
        this.productos.add(productos);
        this.precio = precio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public ArrayList<String> getProductos() {
        return productos;
    }

    public void setProductos(ArrayList<String> productos) {
        this.productos = productos;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }
    public void agregarProducto(String p){
        productos.add(p);
    }
    

}
