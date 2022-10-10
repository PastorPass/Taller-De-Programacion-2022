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

public class Triangulo extends Figura {
    private double lado1,lado2,lado3;
    
    public Triangulo (double lado1,double lado2, double lado3, String unColorLinea, String unColorRelleno) {
        super (unColorLinea, unColorRelleno);
        setLado1(lado1);
        setLado2(lado2);
        setLado3(lado3);
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }
    
    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    
    public double calcularArea () {
        double s;
        s = (double)(lado1 + lado2 + lado3) / 2;
        return Math.sqrt( s * (s -lado1) * (s - lado2) * (s - lado3));
    }
    
    public double calcularPerimetro () {
         return this.getLado1() + this.getLado2() + this.getLado3();
    }

    @Override
    public String toString() {
        String aux = super.toString() + " lado 1:  " + getLado1() + " lado2 : " + getLado2()+ " lado 3 : " + getLado3();
        return aux;
    }
    
}
