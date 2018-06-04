/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.util.ArrayList;

/**
 *
 * @author Luis
 */
public class GestorFactura {

    private ArrayList<Producto> productos;
    private ArrayList<Factura> venta;
    private ArrayList<Producto> tempProducto;

    public GestorFactura() {

        productos = new ArrayList<>();
        venta = new ArrayList<>();
        tempProducto = new ArrayList<>();
    }
    
    public void añadirACarrito(Producto pro){
       tempProducto.add(pro);
       
        
    }
    
    public void borrarACarrito(Producto pro){
        tempProducto.remove(pro);
    }
    
    public void finalizarCarrito(){
        String[] venta = new String[4];
        venta[0] = "2305180001";
        venta[1] = "0.20";
        venta[2] = "20 de mayo 1996";
        venta[3] = "Luis Mendez";
        for (int i = 0; i < tempProducto.size(); i++) {
            añadirProducto(tempProducto.get(i), venta);
        }
        tempProducto.clear();
    }

    public boolean añadirProducto(Producto in, String[] aVenta) {
        productos.add(in);
        crearVenta(aVenta, in.getPrecio());
        return true;
    }

    public void crearVenta(String[] aVenta, int precio) {
        Factura nuevaVenta = new Factura(aVenta[0], aVenta[1], aVenta[2], aVenta[3], precio);
        venta.add(nuevaVenta);
    }

    public boolean eliminarProducto() {
        return false;
    }

    public int obtenerValor(String busqueda) {
        
        for (int i = 0; i < productos.size(); i++) {
            if (productos.get(i).getNombreP().equals(busqueda) || productos.get(i).getNombreP() == busqueda) {
                return venta.get(i).getValorCompra();
            }
        }
        return 0;
    }

    public ArrayList<String> obtenerDatos() {
        ArrayList<String> res = new ArrayList<String>();
        for (int i = 0; i < productos.size(); i++) {
            if (!venta.get(i).isDespachado()) {
                res.add(venta.get(i).getNumOrden());
                res.add(productos.get(i).getNombreP());
                String ingre = "";

                for (int j = 0; j < productos.get(i).getIngredientes().size(); j++) {
                    if (j == productos.get(i).getIngredientes().size() - 1) {
                        ingre += productos.get(i).getIngredientes().get(j);
                    } else {
                        ingre += productos.get(i).getIngredientes().get(j) + " ";
                    }
                }

                res.add(ingre);
            }
        }
        return res;
    }

    public void terminarVenta(String busqueda) {
        System.out.println(busqueda);
        try {

            for (int i = 0; i < productos.size(); i++) {
                if (venta.get(i).getNumOrden().equals(busqueda) || venta.get(i).getNumOrden() == busqueda) {
                    venta.get(i).setDespachado(true);
                }
            }
        } catch (Exception e) {
        }
    }
}
