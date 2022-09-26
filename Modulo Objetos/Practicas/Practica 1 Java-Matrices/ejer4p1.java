/*
 4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
de piso 9. Al finalizar la llegada de personas, informe lo pedido.
 */
package tema1;

import PaqueteLectura.Lector;

public class ejer4p1 {

    public static void main(String[] args) {
        final int finPiso = 8;
        final int finOfi = 4;
        
        //Creacion de la matriz
        int matriz [][];
        matriz = new int [finPiso][finOfi];
        //Inicializo la matriz
        for (int i = 0 ; i <8 ; i++ ) {

            for (int j = 0; j<4; j++) {
		matriz[i][j] = 0;
            }
        }
        
        //Carga de la matriz (matriz contadora)
         
        int oficina,piso;
        
        System.out.println("Ingrese un numero de piso(0..7)");
        piso =Lector.leerInt ();
        while (piso < 8) {
            System.out.println("Ingrese un numero de oficina (0..3)");
            oficina = Lector.leerInt();
            
            //Sumo la cantidad de personas alojadas en el edificio en la matriz
            matriz  [piso][oficina] += 1;  //carga una persona (+1) en la matriz entera
            
          //vuelvo a leer una oficina
            System.out.println("Ingrese nuevamente un piso (0..7)");
            piso = Lector.leerInt();
        }
        
        //Impresion de la matriz    
        for (int i = 0; i <finPiso; i++) {  //numero de filas
            for (int j = 0; j < finOfi; j++) {       //numero de columnas
                System.out.print(matriz[i][j]);
                System.out.print("--");
            }
            System.out.println("");
        }
    }
}
