/*
1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el 
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String). 
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para: 
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
 */
package tema3;

import PaqueteLectura.Lector;

public class ejer1Ap3 {

    public static void main(String[] args) {
        Triangulo unTriangulo;
        
        System.out.println("Mandale el lado1");
        double sideA = Lector.leerDouble();
        
        System.out.println("Mandale el lado2");
        double sideB = Lector.leerDouble();
        System.out.println("Mandale el lado3");
        double sideC = Lector.leerDouble();
        
        System.out.println("Ingrese color de fondo del triangulo");
        String backgroundColor = Lector.leerString();
        
        System.out.println("Ingrese color de borde del triangulo");
        String bordeColor = Lector.leerString();
        
        unTriangulo = new Triangulo(sideA,sideB,sideC,backgroundColor,bordeColor);
        
        //Informe de area y perimetro
        System.out.println("El perimetro de un triangulo es : " + unTriangulo.calcularPerimetro() + " y su area es : " + unTriangulo.calcularArea());
    
    }
    
}