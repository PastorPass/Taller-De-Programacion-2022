
package Parciales;
import PaqueteLectura.GeneradorAleatorio;

public class SorteoComun extends Sorteo{
    public SorteoComun(double unValorBono) {
        super(unValorBono);

    }
    
         /*
    c. Ejecutar el sorteo, devolviendo la persona ganadora, teniendo en cuenta que: en los
sorteos comunes se elige el nro. de bono ganador aleatoriamente entre los nros.
repartidos; en los sorteos avanzados la persona ganadora será la que aportó mayor
colaboración en pesos.
    */
    @Override
    public Persona ejecutarSorteo(){
        GeneradorAleatorio.iniciar();
        int numAleatorio;
        Persona auxPersona = null;
        if (getDimL() != 0) {
           numAleatorio = GeneradorAleatorio.generarInt(getDimL());
           auxPersona = getVectorBonos()[numAleatorio];
        }
        
        
        return auxPersona;
    }
    
    
}
