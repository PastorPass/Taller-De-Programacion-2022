/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales;

/**
 *
 * @author pastor
 */
public class SorteoAvanzado extends Sorteo {
    
    
    public SorteoAvanzado(double unValorBono) {
        super(unValorBono);
    }
    
      /*
    c. Ejecutar el sorteo, devolviendo la persona ganadora, teniendo en cuenta que: en los
sorteos comunes se elige el nro. de bono ganador aleatoriamente entre los nros.
repartidos; en los sorteos avanzados la persona ganadora será la que aportó mayor
colaboración en pesos.
    */
    
    @Override
    public Persona ejecutarSorteo() {
        Persona auxPersona = null;
        double max = -1;
        for (int i = 0; i< getDimL()  ; i++) {
            if (getVectorBonos()[i].getColaboracion() > max) {
                max = getVectorBonos()[i].getColaboracion();
                auxPersona = getVectorBonos()[i];
            }
            
        }
        return auxPersona;
    }
}
