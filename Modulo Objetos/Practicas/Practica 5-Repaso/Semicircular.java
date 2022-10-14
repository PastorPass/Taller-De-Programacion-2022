/*
 Asimismo, hay dos tipos
de coros: coro semicircular en el que los coristas se colocan en el escenario uno al lado
del otro y coro por hileras donde los coristas se organizan en filas de igual dimensión.
 */
package tema5;

public class Semicircular extends Coro{
    private Corista[] vectorCoristas;
    private int dimL,dimF;
    
    
    public Semicircular(String unNombreC,Director d, int unaDimF) {
        super(unNombreC, d);
        setDimF(unaDimF);
        vectorCoristas = new Corista[unaDimF];
        dimL = 0;
        
    }

    public Corista[] getVectorCoristas() {
        return vectorCoristas;
    }

    public void setVectorCoristas(Corista[] vectorCoristas) {
        this.vectorCoristas = vectorCoristas;
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
    
    //b. Implemente métodos (en las clases donde corresponda) que permitan:
// agregar un corista al coro.
//o En el coro semicircular los coristas se deben ir agregando de izquierda
//a derecha
//o En el coro por hileras los coristas se deben ir agregando de izquierda a
//derecha, completando la hilera antes de pasar a la siguiente.

    @Override
   public void agregarCorista(Corista unCorista) {
       if (dimL < dimF) {
           vectorCoristas[dimL] = unCorista;
           dimL++;
       }
   }
   
   // determinar si un coro está lleno o no. Devuelve true si el coro tiene a todos sus
//coristas asignados o false en caso contrario.
    @Override
   public boolean estaLleno() {
       boolean ok = false;
       if (dimL == dimF) {
           ok = true;
       }
       return ok;
           
   }
   
   // determinar si un coro (se supone que está lleno) está bien formado. Un coro
//está bien formado si:
//o En el caso del coro semicircular, de izquierda a derecha los coristas
//están ordenados de mayor a menor en cuanto a tono fundamental.
//o En el caso del coro por hileras, todos los miembros de una misma hilera
//tienen el mismo tono fundamental y además todos los primeros
//miembros de cada hilera están ordenados de mayor a menor en cuanto
//a tono fundamental.
   
    @Override
   public boolean estaBienFormado() {
       boolean ok = true;
       int i = 0;
       while (i < dimF && ok) {  //dimF ya que se supone que el vector de coristas ya esta lleno
           ok = vectorCoristas[i].getTonoFundamental() > vectorCoristas[i+1].getTonoFundamental();
           i++;
       }
       return ok;
   }
   
   
    @Override
    public String toString() {
        String aux= super.toString();
        for (int i=0;i<dimL;i++){
            aux = aux + vectorCoristas[i].toString()+"\n";
        }
        return aux;
    }
           
}
