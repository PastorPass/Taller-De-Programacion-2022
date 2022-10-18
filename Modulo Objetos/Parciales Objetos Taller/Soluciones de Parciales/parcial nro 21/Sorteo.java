package Parciales;
/*
Representar dos tipos de sorteos solidarios: común y avanzado. Ambos sorteos
mantienen el valor en pesos del premio y guardan para cada bono (0..99) la información
de la persona a la que fue asignado (nombre, dni y colaboración en pesos). Sin embargo,
difieren en cierta funcionalidad (se detalla más adelante).

1- Genere las clases necesarias. Provea constructores para iniciar los sorteos a partir del
premio en pesos (los bonos inicialmente no están asignados a nadie).
 */

public abstract class Sorteo {
    private double valorPremio;
    private Persona[]vectorBonos;
    private int dimF,dimL;
    
    
    public Sorteo(double unValorPremio) {
        valorPremio = unValorPremio;
        vectorBonos = new Persona[99];
        dimF = 99;
        dimL = 0;
    }

    public double getValorPremio() {
        return valorPremio;
    }

    public void setValorPremio(double valorPremio) {
        this.valorPremio = valorPremio;
    }

    public Persona[] getVectorBonos() {
        return vectorBonos;
    }

    public void setVectorBonos(Persona[] vectorBonos) {
        this.vectorBonos = vectorBonos;
    }

    public int getDimF() {
        return dimF;
    }

    public void setDimF(int dimF) {
        this.dimF = dimF;
    }

    public int getDimL() {
        return dimL;
    }

  

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    /*
    2- Implemente los métodos necesarios, en las clases que corresponda, para:
a. Agregar una persona al sorteo, devolviendo el nro. de bono que le tocó. Los nros. de
bono se reparten en forma consecutiva comenzando de 0. Asuma que hay un nro. de
bono disponible.
    */
    public int agregarPersona(Persona unaPersona) {
        int aux= 0 ;
        if (dimL < dimF) {
            vectorBonos[dimL] = unaPersona;
            aux = dimL;
            dimL++;
        }
        return aux;
        
    }
    
    /*
    b. Obtener la persona que compró el nro. de bono B. Asuma que B es un nro. de bono
válido.
    */
    public Persona obtenerPersona(int unNumeroBono) {
        Persona auxPersona = null; 
        if (unNumeroBono < dimL) {
            auxPersona = vectorBonos[unNumeroBono];
        }
        return auxPersona;
    }
    /*
    c. Ejecutar el sorteo, devolviendo la persona ganadora, teniendo en cuenta que: en los
sorteos comunes se elige el nro. de bono ganador aleatoriamente entre los nros.
repartidos; en los sorteos avanzados la persona ganadora será la que aportó mayor
colaboración en pesos.
    */
    
    public abstract Persona ejecutarSorteo(); //devuelve la persona ganadora del sorteo

    @Override
    public String toString() {
        return "Sorteo{" + "valorPremio=" + valorPremio + ", dimF=" + dimF + ", dimL=" + dimL + '}';
    }

  
    
    
}
