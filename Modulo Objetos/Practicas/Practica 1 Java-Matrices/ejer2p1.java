/*
2- Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
básquet y las almacene en un vector. Luego informe:
- la altura promedio
- la cantidad de jugadores con altura por encima del promedio
NOTA: Dispone de un esqueleto para este programa en Ej02Jugadores.java
 */
package tema1;

import PaqueteLectura.Lector;

public class ejer2p1 {

    public static void main(String[] args) {
        final int DF = 16;
        double sumaAlturas = 0,prom = 0,altura = 0;
        int cant = 0;
        double tabla [] = new double[DF];  //Vector de 0 a 15
        
        for (int i = 0; i <DF; i++) {
            System.out.println("Ingrese una altura");
            tabla[i] = Lector.leerDouble();
            sumaAlturas +=  tabla[i];
        }
        prom = (double)sumaAlturas/DF;
        System.out.println("La altura promedio de todos los jugadores : " + prom);
        
        //Segundo recorrido del vector para analizar los jugadores que superan la altura promedio 
        for (int i = 0; i < DF; i++) {
            if (tabla[i] > prom) {
                cant++;
            }
        }
        System.out.println("La cantidad de jugadores que superan la altura promedio : " + cant);
    }
    
}
