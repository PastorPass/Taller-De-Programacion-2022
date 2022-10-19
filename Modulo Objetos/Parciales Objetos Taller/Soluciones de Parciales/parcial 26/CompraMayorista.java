/*
1- Queremos representar compras minoristas y mayoristas. De cualquier compra se
conoce: nro. y los productos comprados (como máximo N). De cada producto registra:
código, precio mayorista y precio minorista. Además: las compras mayoristas tienen el
CUIT del comprador; y las minoristas si el comprador es jubilado.
 */
package Parciales;

public class CompraMayorista  extends Compra {
    private int cuitComprador;
    private int dimL,dimF;
    private Producto []vectorProductos;
    
    public CompraMayorista (int unNro,int prodComprados,int unCui) {
        cuitComprador = unCui;
        dimF = prodComprados;
        dimL = 0;
        vectorProductos = new Producto[prodComprados];
    }

    public Producto[] getVectorProductos() {
        return vectorProductos;
    }

    public void setVectorProductos(Producto[] vectorProductos) {
        this.vectorProductos = vectorProductos;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }

    public int getDimF() {
        return dimF;
    }

    public void setDimF(int dimF) {
        this.dimF = dimF;
    }

    public int getCuitComprador() {
        return cuitComprador;
    }

    public void setCuitComprador(int cuitComprador) {
        this.cuitComprador = cuitComprador;
    }
    
    @Override
     public void agregarCompra(Producto unProducto) {
        if (dimL < dimF) {
            vectorProductos[dimL] = unProducto;
            dimL++;
        }
        
    }
    
      /*
    ii- Obtener el precio a pagar por el i-ésimo producto de la compra sabiendo que: para las
compras minoristas el precio a pagar por dicho producto es el precio minorista
descontando 10% si es jubilado y para las compras mayoristas es el precio mayorista
descontando 21% de IVA. Asuma que “i” es válido y se recibe.
    */
    @Override
    public double precioApagar(int unaPos) {
        double aux= 0;
        if (unaPos >=0 && unaPos <=getDimL()) {
            aux = vectorProductos[unaPos].getPrecioMayorista() * 0.21;
        }
        
        return aux;
    }
    
    
//iii- Obtener la representación String de la compra siguiendo el ejemplo:
//“Nro:… , Productos comprados (código y precio pagado por el producto):…Total pagado:
//…”
    @Override
    public String toString() {
        double monto = 0;
        System.out.println("Productos comprados : "+ dimL);
        String aux = "";
        for (int i = 0; i < getDimL(); i++) {
            monto = monto + vectorProductos[i].getPrecioMayorista();
            aux = aux + "Nro "+ i+  "precio pagado por el producto : "+ vectorProductos[i].getPrecioMayorista()+ "codigo : " + vectorProductos[i].getCodigo()+"\n";
        }
        aux = aux +  "CompraMayorista{" + "cuitComprador=" + cuitComprador + "monto total : " + monto;
        return aux;
    }

    
}
