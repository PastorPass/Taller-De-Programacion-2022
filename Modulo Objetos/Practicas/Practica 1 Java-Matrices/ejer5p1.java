
/*
5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto.
 */
package tema1;

import PaqueteLectura.Lector;

public class ejer5p1 {

    public static void main(String[] args) {
        final int finAspectos = 4,totClientes = 5;
        int matriz [][];  // Se podria hacer con una matriz de reales (double matriz).
        matriz = new int [totClientes][finAspectos]; //totClientes = fila ; finAspectos = columna
        
        double cant = 0,prom; 
        
        for (int i= 0; i < 5; i++) {
            System.out.println("Cliente nro " + (i+1) + " --");
            for (int j = 0; j<4; j++) {
                System.out.println("Ingrese puntaje de aspecto(del 1 al 10) " + j + " .");
                matriz[i][j] = Lector.leerInt();
                System.out.println();
            }
        }
        
        for (int i = 0; i<4 ;i++) {
            for (int j = 0; j< 5; j++) {
                cant += matriz[j][i];
            }
            prom = (double)cant /5;
            System.out.println("Promedio de aspecto " + i + ": " + prom);
            cant = 0;
        }
    }
}


