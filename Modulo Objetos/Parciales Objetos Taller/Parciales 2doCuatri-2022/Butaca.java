/*
que almacenara la informacion de cada butaca que comprende un descriptor (String) 
, el precio y su estado (si esta ocupada o no)


 Inicialmente cada butaca debe estar desocupada,
tener un precio que surge de la formula 800 +100* nroFilaDelaButaca y un descriptor 
"butaca i,j " donde i es el nro de fila y j es el nro de butaca dentro de su fila.
 */
package Parciales;

public class Butaca {
    private String descriptor;
    private double precio;
    private boolean ocupada;
    
    public Butaca (int nroFila,int nroColumna) {
     ocupada = false;
     precio = 800+100 *nroFila;
     descriptor = "butaca : " + nroFila+""+nroColumna;
    }

    public String getDescriptor() {
        return descriptor;
    }

    public void setDescriptor(String descriptor) {
        this.descriptor = descriptor;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }


    @Override
    public String toString() {
        return "Butaca{" + "descriptor=" + descriptor + ", precio=" + precio + ", ocupada=" + ocupada + '}';
    }
    
}
