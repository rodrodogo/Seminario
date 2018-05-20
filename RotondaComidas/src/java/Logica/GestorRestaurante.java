/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.util.ArrayList;

/**
 *
 * @author fcher
 */
public class GestorRestaurante {
private ArrayList <Restaurante> rest;

    public GestorRestaurante() {
        this.rest = new ArrayList<Restaurante>();
    }

    public void guardarDatos(Restaurante r) {
        rest.add(r);
        //tendria que guardar datos en base de datos
    }
    public void actualizarDatos (String[] actualizacion){
       
    }
    public void borrarDatos(String[] actualizacion){
       
    }public void obtenerDatos (String[] actualizacion){
       
    }
    
}
