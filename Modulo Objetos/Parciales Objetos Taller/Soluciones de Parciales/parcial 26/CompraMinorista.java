/*
1- Queremos representar compras minoristas y mayoristas. De cualquier compra se
conoce: nro. y los productos comprados (como máximo N). De cada producto registra:
código, precio mayorista y precio minorista. Además: las compras mayoristas tienen el
CUIT del comprador; y las minoristas si el comprador es jubilado.
 */
package Parciales;

public class CompraMinorista  {
    private boolean esJubilado;
    private int dimL,dimF;
    private Producto []vectorProductos;
    
    public CompraMinorista(int unNro,int n,boolean jubilacion) {
        dimF = n;
        dimL = 0;
        esJubilado = jubilacion;
        vectorProductos = new Producto[n];
    }

    public Producto[] getVectorProductos() {
        return vectorProductos;
    }

    public void setVectorProductos(Producto[] vectorProductos) {
        this.vectorProductos = vectorProductos;
    }

    
    public boolean isEsJubilado() {
        return esJubilado;
    }

    public void setEsJubilado(boolean esJubilado) {
        this.esJubilado = esJubilado;
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
    
    public double precioApagar(int unaPos) {
        double aux = vectorProductos[unaPos].getPrecioMinorista();
        if (unaPos >= 0 && unaPos <= getDimL()) {
            if (esJubilado == true) {
                aux = aux - (aux * 0.1);
            }
            
        }
        
        return aux;
    }

    @Override
    public String toString() {
        double monto = 0;
        System.out.println("Productos comprados : " + dimL);
        String aux = "";
        for (int i = 0; i < getDimL(); i++) {
            monto = monto + vectorProductos[i].getPrecioMinorista();
            aux = aux + "Nro "+ i+  "precio pagado por el producto : "+ vectorProductos[i].getPrecioMinorista()+ "codigo : " + vectorProductos[i].getCodigo()+"\n";
        }
        aux = aux + " CompraMinorista{" + "esJubilado=" + esJubilado + "monto total :"+ monto;
        return aux;
    }
    
    
}
