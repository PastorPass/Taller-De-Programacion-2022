/*
B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área. 
NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) , donde a, b y c son 
los lados y s =     a+b+c
                    -----
                      2
. La función raíz cuadrada es Math.sqrt(#)
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;

public class ejer1Bp3 {
    
    public static void main(String[] args) {
        //Parte 1B. (Una extension de lo mismo)
        GeneradorAleatorio.iniciar();
        int lado1,lado2,lado3;
        lado1  = GeneradorAleatorio.generarInt(10);
        lado2  = GeneradorAleatorio.generarInt(10);
        lado3  = GeneradorAleatorio.generarInt(10);
       
        Triangulo t1 = new Triangulo(lado1, lado2, lado3,"rojo","verde");  // genero datos aleatorios
        
        System.out.println(t1.toString());  //Creo un metodo toString en la clase triangulo
        System.out.println(t1.toCadena());  //Informa la informacion completa del triangulo (verificacion)
        
        //Falta verificar a mano el calcularArea en el metodo creado y en el this.CalcularArea()
    }
    
}
