/*
2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:
 - Informe la cantidad de personas mayores de 65 años.
 - Muestre la representación de la persona con menor DNI.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class ejer2p2 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        final int DF = 15;
        
        Persona []vector = new Persona[DF];
        
        //Creo un objeto (p3)
       // Persona p3;
        //p3 = new Persona();
        
        int DL = 0;
        int edad;
        //Ingreso de datos aleatorios
        /*
        p3.setNombre(GeneradorAleatorio.generarString(5));
        System.out.println("Nombre aleatorio : " + p3.getNombre());
        p3.setDNI(GeneradorAleatorio.generarInt(8));
        System.out.println("dni aleatorio : " + p3.getDNI());
        p3.setEdad(GeneradorAleatorio.generarInt(70)); //tambien Se puede generar un numero aleatorio con el metodo math
        System.out.println("Edad aleatoria : " + p3.getEdad());
        System.out.println("--------------------------------");
        */
        edad = GeneradorAleatorio.generarInt(70);
        
        while ((edad != 0) &&(DL < DF)) {
            System.out.println("Posicion nro : " +DL);
            //cargo una persona al vector
            vector[DL] = new Persona();
          //  DL ++;  //Incremento la dimL
           // Persona per = new Persona();
            
           //Vuelvo a leer una persona 
           System.out.println("Edad aleatoria : " + edad);  
           vector[DL].setEdad(edad);

           vector[DL].setNombre(GeneradorAleatorio.generarString(5));
           System.out.println("Nombre aleatorio : " + vector[DL].getNombre());
           vector[DL].setDNI(GeneradorAleatorio.generarInt(8));
           System.out.println("dni aleatorio : " + vector[DL].getDNI());
           System.out.println("--------------------------------");
           DL++;
           edad = GeneradorAleatorio.generarInt(70);

        }
        System.out.println("La dimension Logica del vector =  " + DL);  
                
        Persona p4 = new Persona();
        int cant = 0; // contador para la cantidad de personas mayores de 65 años
        int min = 999;  
        for (int i = 0; i < DL; i++) {
            if (vector[i].getEdad() > 65) {
                cant++;
            }
            if (vector[i].getDNI() < min) {
                min = vector[i].getDNI();
                p4 = vector[i];
            }
        }
        System.out.println("La cantidad de personas +65 : " + cant);
        System.out.println("---Los datos de la persona con menor DNI---");  // *A
        System.out.println(p4.toString());
        
        /*A 
        toma los datos del dni con el 1er minimo absoluto 
        (osea el 0) luego puede que  se repita el 0 en varios casos pero respeta
        el orden en el que llego tal minimo
        */ 
    }
}
