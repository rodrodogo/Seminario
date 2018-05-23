/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

/**
 *
 * @author Luis
 */
public class Factura {
    private String numOrden;
    private String descProductos;
    private boolean despachado;
    private String fecha;
    private String nombreComp;
    private int valorCompra;

    public int calcularValorTotal() {

        return 0;
    }

    public Factura(String aNumOrden,String aDescuento, String aFecha, String aNombreComp, int aValorcompra) {
        numOrden=aNumOrden;
        descProductos = aDescuento;
        despachado  = false;
        fecha=aFecha;
        nombreComp= aNombreComp;
        valorCompra=aValorcompra;
    }

    /**
     * @param descProductos the descProductos to set
     */
    public void setDescProductos(String descProductos) {
        this.descProductos = descProductos;
    }

    /**
     * @param despachado the despachado to set
     */
    public void setDespachado(boolean despachado) {
        this.despachado = despachado;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    /**
     * @param nombreComp the nombreComp to set
     */
    public void setNombreComp(String nombreComp) {
        this.nombreComp = nombreComp;
    }

    /**
     * @return the valorCompra
     */
    public int getValorCompra() {
        return valorCompra;
    }

    /**
     * @param valorCompra the valorCompra to set
     */
    public void setValorCompra(int valorCompra) {
        this.valorCompra = valorCompra;
    }

    /**
     * @return the despachado
     */
    public boolean isDespachado() {
        return despachado;
    }

    /**
     * @return the descProductos
     */
    public String getDescProductos() {
        return descProductos;
    }

    /**
     * @return the numOrden
     */
    public String getNumOrden() {
        return numOrden;
    }

}
