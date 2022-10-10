/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

import PaqueteLectura.Lector;


public class DemoFiguras {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        double radio;
        String colorLinea,colorRelleno;
        Cuadrado cuad = new Cuadrado(20,"verde", "gris");
        System.out.println("Color linea del cuadrado: " + cuad.getColorLinea()); 
        System.out.println("Area del cuadrado: " + cuad.calcularArea()); 
        System.out.println("Representacion del cuadrado: " + cuad.toString()); 
        
        
        System.out.println("Ingrese color de linea para el circulo");
        colorLinea = Lector.leerString();
        System.out.println("Ingrese color de relleno para el circulo");
        colorRelleno = Lector.leerString();
        System.out.println("Ingrese radio del circulo");
        radio = Lector.leerDouble();
        
        CirculoV2 c = new CirculoV2(radio,colorLinea,colorRelleno);
        System.out.println("Area del circulo  : " + c.calcularArea());
        System.out.println("Perimetro del circulo " + c.calcularPerimetro());
        System.out.println("Representacion del circulo : " + c.toString());
        
        System.out.println("Despintar los colores del circulo :");
        c.despintarColores();  //Se llama al metodo que sirve para cada subclase
        System.out.println("Representacion del circulo x2 : " + c.toString());
        
        Triangulo t = new Triangulo(3,4,5,"amarillo" , "oro");
        System.out.println("Representacion del triangulo : " + t.toString());
        t.despintarColores();
        System.out.println("Representacion del triangulo x2 : " + t.toString());
        
    }
    
    
    
}
