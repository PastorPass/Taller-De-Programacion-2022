/*
  Asimismo, hay dos tipos
de coros: coro semicircular en el que los coristas se colocan en el escenario uno al lado
del otro y coro por hileras donde los coristas se organizan en filas de igual dimensión.
 */
package tema5;

public class Hilera extends Coro{
    private Corista [][] matrizCoristas;
    private int dimFi,dimFj,dimLi,dimLj;
    
    public Hilera(String unNombreC,Director d,int unaDimFi,int unaDimFj) {
        super(unNombreC,d);
        setDimFi(unaDimFi);
        setDimFj(unaDimFj);
        matrizCoristas = new Corista[unaDimFi][unaDimFj];
        dimLi = 0;
        dimLj = 0;
    }

    public Corista[][] getMatrizCoristas() {
        return matrizCoristas;
    }

    public void setMatrizCoristas(Corista[][] matrizCoristas) {
        this.matrizCoristas = matrizCoristas;
    }

    public int getDimFi() {
        return dimFi;
    }

    public void setDimFi(int dimFi) {
        this.dimFi = dimFi;
    }

    public int getDimFj() {
        return dimFj;
    }

    public void setDimFj(int dimFj) {
        this.dimFj = dimFj;
    }

    public int getDimLi() {
        return dimLi;
    }

    public void setDimLi(int dimLi) {
        this.dimLi = dimLi;
    }

    public int getDimLj() {
        return dimLj;
    }

    public void setDimLj(int dimLj) {
        this.dimLj = dimLj;
    }
    
     //b. Implemente métodos (en las clases donde corresponda) que permitan:
// agregar un corista al coro.
//o En el coro semicircular los coristas se deben ir agregando de izquierda
//a derecha
//o En el coro por hileras los coristas se deben ir agregando de izquierda a
//derecha, completando la hilera antes de pasar a la siguiente.
    
    @Override
    public void agregarCorista(Corista unCorista) {
        if ((dimLi < dimFi) && (dimLj < dimFj)) {
            matrizCoristas[dimLi][dimLj] = unCorista;
            dimLj++;
            if (dimLj == dimFj) {
                if (dimLi < dimFi-1) {
                    dimLj = 0;
                    dimLi++;
                }
                else {
                    dimLi++;
                }
            }
        }
        
    }
    
    // determinar si un coro está lleno o no. Devuelve true si el coro tiene a todos sus
//coristas asignados o false en caso contrario.
    @Override
    public boolean estaLleno() {
        boolean aux = false;
        if ((dimLi == dimFi) && (dimLj == dimFj)) {
            aux = true;
        }
        return aux;
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
        boolean ok1 = true, ok2 = true;
        int i = 0, j = 0;
        while (i < dimFi && ok1 && ok2) {
            while (j < dimFj && ok1) {
                ok1 = matrizCoristas[i][j].getTonoFundamental()== matrizCoristas[i][j+1].getTonoFundamental();
                j++;
            }
            ok2 = matrizCoristas[i][1].getTonoFundamental() > matrizCoristas[i+1][1].getTonoFundamental();
            j = 0;
            i++;
        }
        return ok1 && ok2;
    }
    
    @Override
    public String toString(){
        String aux=super.toString();
        for (int i=0;i<dimLi;i++){  // dimFi
            for (int j=0;j<dimLj;j++){  //dimFj
                aux=aux+matrizCoristas[i][j].toString()+"\n";
            }
        }
        return aux;
    }
    
}
