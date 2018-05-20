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
    private GestorRestaurante gRestaurante;
    public Mediador() {
        
        gInventario =  new GestorInventario();
        gRestaurante= new GestorRestaurante();
        
    }
    
    public void actualizarIng(String[] actualizacion){
        gInventario.modificarInv(actualizacion);
    }
    public boolean registrarRestaurante (String[] actualizacion, int op){
        Restaurante r= new Restaurante(actualizacion);
        //operacion de registrar
        boolean res=false;
        if (op==1)
    res=   gRestaurante.guardarDatos(r);
        else
             res=   gRestaurante.actualizarDatos(r);
        
        return res;
    }
    
    
    public String[] consultarIng(String key){
        Ingrediente busqueda = gInventario.consultarInv(key);
        if (busqueda == null){
           String[] envio = new String[6];
            envio[0] = "no existe";
            envio[1] =  "no existe";
            envio[2] =  "no existe";
            envio[3] =  "no existe";
            envio[4] =  "no existe";
            envio[5] =  "no existe";
            
            return envio;
        }else{
            
            String[] envio = new String[6];
            envio[0] = busqueda.getNombre();
            envio[1] = busqueda.getCategoria();
            envio[2] = "" +busqueda.getCantidad();
            envio[3] = "" +busqueda.getPrecio();
            envio[4] = "" +busqueda.isCambiable();
            envio[5] = "" +busqueda.getCaracteristicas();
            return envio;
        }
    }
    
}
