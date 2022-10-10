
/*
1-A- Incluya la clase Triángulo a la jerarquía de figuras vista (carpeta tema4). Triángulo
debe heredar de Figura todo lo que es común y definir su constructor y sus atributos y
métodos propios. Además debe redefinir el método toString.
B- De igual manera, incluya la clase Círculo a la jerarquía de figuras.
C- Añada a la representación String el valor del perímetro. Piense ¿qué método toString
debe modificar: el de cada subclase o el de Figura?
D- Añada el método despintar que establece los colores de la figura a línea “negra” y
relleno “blanco”. Piense ¿dónde debe definir el método: en cada subclase o en Figura?
E- Realizar un programa que instancie un triángulo y un círculo. Muestre en consola la
representación String de cada uno. Pruebe el funcionamiento del método despintar.
 */
 
package tema4;

public class CirculoV2 extends Figura { 
    private double radio;
    
    public CirculoV2 (double unRadio,String colorRelleno, String colorLinea) {
        super(colorRelleno,colorLinea);
        //setRadio(radio);  // de esta forma esta mal, se debe acceder con un this.(..)
        this.radio = unRadio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    

    public double calcularPerimetro () {
        return (double) 2 * Math.PI *getRadio();
    }
    
  
    public double calcularArea () {
        return (double) Math.PI * (getRadio()* getRadio());
    }

    public String toString() {
        String aux = super.toString() + " , radio del circulo : " + getRadio();
        return aux;
    }
       
}
