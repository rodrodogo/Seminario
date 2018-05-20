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
public class Mediador {
    
    private GestorInventario gInventario;

    public Mediador() {
        
        gInventario =  new GestorInventario();
        
    }
    
    
    
    public String consultarIng(String key){
        Ingrediente busqueda = gInventario.consultarInv(key);
        if (busqueda == null){
            return "no se encontro";
        }else{
            return busqueda.getNombre() + busqueda.getPrecio();
        }
    }
    
}
