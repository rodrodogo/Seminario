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
public class GestorInventario {
    
    private ArrayList<Ingrediente> ingredientes;

    public GestorInventario() {
        ingredientes = new ArrayList<Ingrediente>();
        Ingrediente a = new Ingrediente(5, "bueno", "a", "a", 1);
        Ingrediente b = new Ingrediente(5, "bueno", "b", "a", 1);
        Ingrediente c = new Ingrediente(5, "bueno", "c", "a", 1);
        Ingrediente d = new Ingrediente(5, "bueno", "d", "a", 1);
        ingredientes.add(a);
        ingredientes.add(b);
        ingredientes.add(c);
        ingredientes.add(d);
    }
    
    
    
    public Ingrediente consultarInv(String busqueda){
        for (Ingrediente i : ingredientes) {
            System.out.println("dis");
            if(i.getNombre().equals(busqueda)){
                return i;
                
            }
        }
        
        return null;
    }
    public void modificarInv(String a, int b ,String c){
        
    }
}
