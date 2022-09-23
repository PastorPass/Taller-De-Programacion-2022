/*
3- Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice
la matriz con números aleatorios entre 0 y 30.
Luego realice las siguientes operaciones:
- Mostrar el contenido de la matriz en consola.
- Calcular e informar la suma de los elementos de la fila 1
- Generar un vector de 5 posiciones donde cada posición j contiene la suma
de los elementos de la columna j de la matriz. Luego, imprima el vector.
- Lea un valor entero e indique si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario
imprima “No se encontró el elemento”.
NOTA: Dispone de un esqueleto para este programa en Ej03Matrices.java
 */
package tema1;

import PaqueteLectura.Lector;

public class ejer3p1 {
    public static void main(String[] args) {
        int matriz[][], nFilas,nColumnas;
        int suma = 0;
        System.out.println("Ingrese la cantidad de filas a la matriz");
        nFilas = Lector.leerInt();
        System.out.println("Ingrese la cantidad de columnas a la matriz");
        nColumnas = Lector.leerInt();
        matriz = new int [nFilas][nColumnas];  //Iria 5 y 5
        
        int [] vector = new int[5];
        
        System.out.println("Ingrese la matriz");
          for (int i = 0; i <nFilas; i++) {  //numero de filas
            for (int j = 0; j < nColumnas; j++) {       //numero de columnas
                System.out.print("matriz{"+i+"}{"+j+"}: ");
                
                //Genero numeros aleatorios a la matriz con numeros del 0 al 30
                matriz[i][j] = (int)(Math.random()*30+1);  //Uso del metodo Math
              //  matriz[i][j] =  Lector.leerInt();
            }
            System.out.println("");
        }
        
        //Impresion de la matriz    
        for (int i = 0; i <nFilas; i++) {  //numero de filas
            for (int j = 0; j < nColumnas; j++) {       //numero de columnas
                System.out.print(matriz[i][j]);
                System.out.print("--");
            }
            System.out.println("");
        }
        
        //Suma de los elementos de la matriz de toda la fila 1
        for (int j = 0; j < nColumnas ; j++) {
          suma = suma + matriz[0][j];
        }
        System.out.print("");
        System.out.println("La suma de los elementos de toda la fila 1 es : " + suma);
    
    
        //Cargo el vector con cada suma de cada columna
        
        for (int h = 0; h < 5; h++) {
          suma = 0;
          for (int k = 0; k < nFilas; k++) {
            suma = suma +matriz[k][h];  //sumo los elementos de todas las filas de la columna k(0..4) y voy sumando +1 columna
          }
        vector[h] = suma;  //dejo la suma en la 1er posicion del vector
        }
        
        //Imprimir Vector
        for (int i = 0; i<5; i++) {
            System.out.println("Posicion del vector nro : " + i + " Elemento = " + vector[i]);
        }
        
        System.out.println("Ingrese un valor a buscar en la matriz");
        int valor = Lector.leerInt();
        
        //Recorro la matriz buscando el valor, y si lo encuentro, salgo
        int f = 0,c;
        boolean ok = false;
        
        while ((!ok) && (f < nFilas)) {  //No me funciona con (ok == false)  :(
          c = 0;
          while ((!ok) && (c < nColumnas)) {
            if (matriz[f][c] == valor) {
                    ok = true;
            }
            else {
                c++;
            }
            if (!ok ) {
                f++;
            }
          }
        }
        
        if (ok == true)
            System.out.println("Se encontro el valor " + valor + " En la matriz");
        else { 
            System.out.println("No se encontro el elemento");
        }
    }
}
