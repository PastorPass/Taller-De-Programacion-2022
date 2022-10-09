/*
5-A- Definir una clase para representar círculos. Los círculos se caracterizan por su radio
(double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
B- Realizar un programa que instancie un círculo, le cargue información leída de teclado e
informe en consola el perímetro y el área.
NOTA: la constante PI es Math.PI
 */
package tema3;

import PaqueteLectura.Lector;


public class ejer5ABp3 {

    public static void main(String[] args) {
        double radio;
        String colorLinea, colorRelleno;
        
        System.out.println("Ingrese el radio del circulo");
        radio = Lector.leerDouble();
        
        System.out.println("Ingrese color de linea del circulo");
        colorLinea = Lector.leerString();
        
        System.out.println("Ingrese color de relleno del circulo");
        colorRelleno = Lector.leerString();
        
        Circulo unCirculo = new Circulo (colorLinea,colorRelleno,radio);

        System.out.println("El area del circulo es : " + unCirculo.calcularArea()+ " y el perimetro es : " + unCirculo.calcularPerimetro());
        
        System.out.println(unCirculo.toString());
        
    }
    
}
