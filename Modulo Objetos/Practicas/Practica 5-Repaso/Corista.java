/*
  De los coristas se conoce
el nombre, DNI, edad y el tono fundamental (un número entero). Asimismo, hay dos tipos
de coros: coro semicircular en el que los coristas se colocan en el escenario uno al lado
del otro y coro por hileras donde los coristas se organizan en filas de igual dimensión.
 */
package tema5;

public class Corista extends Persona {
    private int tonoFundamental;
    
    
    public Corista(String unNombreC, int unDni, int unaEdad, int unTono) {
        super(unNombreC, unDni, unaEdad);
        setTonoFundamental(unTono);
        
    }
    
    public int getTonoFundamental() {
        return tonoFundamental;
    }

    public void setTonoFundamental(int tonoFundamental) {
        this.tonoFundamental = tonoFundamental;
    }
    
    //// devolver la representación de un coro formada por el nombre del coro, todos
//los datos del director y todos los datos de todos los coristas.

    @Override
    public String toString() {
        String aux = super.toString() + "Corista{" + "tonoFundamental=" + tonoFundamental + '}';
        return aux;
    }
    
}
