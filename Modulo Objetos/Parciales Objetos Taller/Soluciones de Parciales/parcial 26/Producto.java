/*
De cada producto registra:
código, precio mayorista y precio minorista. Además: las compras mayoristas tienen el
CUIT del comprador; y las minoristas si el comprador es jubilado.
 */
package Parciales;

public class Producto {
    private int codigo;
    private double precioMayorista,precioMinorista;
    
    public Producto(int unCodigo,double unPrecioM,double unPrecioMn) {
        codigo = unCodigo;
        precioMayorista = unPrecioM;
        precioMinorista = unPrecioMn;
        
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public double getPrecioMayorista() {
        return precioMayorista;
    }

    public void setPrecioMayorista(double precioMayorista) {
        this.precioMayorista = precioMayorista;
    }

    public double getPrecioMinorista() {
        return precioMinorista;
    }

    public void setPrecioMinorista(double precioMinorista) {
        this.precioMinorista = precioMinorista;
    }

    
}
