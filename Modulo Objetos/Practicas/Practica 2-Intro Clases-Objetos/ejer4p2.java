/*
4- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona y pensar en la estructura de datos a utilizar. 

 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class ejer4p2 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        final int diasTot = 5;
        final int totPersonas = 8;
        String nom;
        int j,i = 0;
        
        Persona [][] matrizInscripciones = new Persona [diasTot][totPersonas];
        
        System.out.println("Ingrese un nombre");
        //nom = GeneradorAleatorio.generarString(5);
        nom = Lector.leerString();
        while ((!"zzz".equals(nom)) && (i < diasTot)) {
          j = 0;
          while ((!"zzz".equals(nom)) && (j < totPersonas)) {
            System.out.println("Dia nro : " + (i+1));  //Impresion mejorada
            matrizInscripciones[i][j] = new Persona();
            matrizInscripciones[i][j].setNombre(nom);  //Aca se debe leer un nombre nuevo pero para la verificacion cargo el mismo nombre para el mismo dia
            System.out.println("nombre : " +nom);
            matrizInscripciones[i][j].setDNI(GeneradorAleatorio.generarInt(20));
            System.out.println("dni aleatoria : " + matrizInscripciones[i][j].getDNI());
            matrizInscripciones[i][j].setEdad(GeneradorAleatorio.generarInt(30));
            System.out.println("edad aleatoria : " + matrizInscripciones[i][j].getEdad());
            j++;  //Incremento la cantidad de personas
            System.out.println("Vuelva a ingresar un nombre");
            nom = Lector.leerString();
            System.out.println("-----------");
          }
          i++;  //Incremento el dia          
        }
        
        //Impresion de la matriz (Se debe recorrer con un while para validar las posiciones de la matriz que no sean null)
        int p = 0,k = 0;  
        while ((p < diasTot) && (matrizInscripciones[p][k] != null)) {
          while ((k < totPersonas) && (matrizInscripciones[p][k] != null)) {
            System.out.println("dia : " + (p+1));
            System.out.println("Turno : " + (k+1) + " : " +matrizInscripciones[p][k].getNombre());
            System.out.println("---------------------------------");
            k++;
        }
        k =0;
        p++;
        }
    }           
}
