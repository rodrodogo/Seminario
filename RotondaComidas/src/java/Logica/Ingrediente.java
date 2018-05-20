/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

/**
 *
 * @author Rodrigon
 */
public class Ingrediente {
    private boolean cambiable;
    private int cantidad;
    private String caracteristicas;
    private String categoria;
    private String nombre;
    private int precio;

    public Ingrediente(int cantidad, String caracteristicas, String categoria, String nombre, int precio) {
        this.cantidad = cantidad;
        this.caracteristicas = caracteristicas;
        this.categoria = categoria;
        this.nombre = nombre;
        this.precio = precio;
    }

    public boolean isCambiable() {
        return cambiable;
    }

    public void setCambiable(boolean cambiable) {
        this.cambiable = cambiable;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getCaracteristicas() {
        return caracteristicas;
    }

    public void setCaracteristicas(String caracteristicas) {
        this.caracteristicas = caracteristicas;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    
    
    
    
    
                            
}
