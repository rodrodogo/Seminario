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
public class Producto {
    private String nombreP;    
    private ArrayList<String> ingredientes;
    private boolean personalisable;
    private int precio;

    public Producto(String nombreP, ArrayList<String> ingredientes, boolean personalisable, int precio) {
        this.nombreP = nombreP;
        this.ingredientes = ingredientes;
        this.personalisable = personalisable;
        this.precio = precio;
    }
    

   

    public String getNombreP() {
        return nombreP;
    }

    public void setNombreP(String nombreP) {
        this.nombreP = nombreP;
    }

    public ArrayList<String> getIngredientes() {
        return ingredientes;
    }

    public void setIngredientes(ArrayList<String> ingredientes) {
        this.ingredientes = ingredientes;
    }

    public boolean isPersonalisable() {
        return personalisable;
    }

    public void setPersonalisable(boolean personalisable) {
        this.personalisable = personalisable;
    }

    public int getPrecio() {
        return precio;
    }
    public void agregarIng(String ing){
        ingredientes.add(ing);
    }
    public void setPrecio(int precio) {
        this.precio = precio;
    }


  
    
}
