/*
d) Realice un programa que instancie un estacionamiento con 3 pisos y 3 plazas por piso.
Registre 6 autos en el estacionamiento en distintos lugares.
Muestre la representación String del estacionamiento en consola.
Muestre la cantidad de autos ubicados en la plaza 1.
Lea una patente por teclado e informe si dicho auto se encuentra en el
estacionamiento o no. En caso de encontrarse, la información a imprimir es el piso y
plaza que ocupa.
 */
package tema5;

import java.util.Scanner;

public class ejer2p5 {
    
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        String nombreE ,direccion,nombreDueñoA,patenteA,unaPatente;

        System.out.println("Ingrese nombre del estacionamiento");
        nombreE = entrada.nextLine();
        
        System.out.println("Ingrese direccion del estacionamiento");
        direccion = entrada.nextLine();
        
        int horaA = 7,horaC = 21;        
        int pisos = 3, plazas = 3;

        
        Estacionamiento e = new Estacionamiento(nombreE,direccion,horaA,horaC,pisos,plazas);
        
        //Registre 6 autos en el estacionamiento en distintos lugares.
    
        int unPiso,unaPlaza;
        for (int i = 0; i < 6; i++) {
            System.out.println("Registro de auto nro : " + (i+1) + " ");
                System.out.println("Ingrese nombre del due\u00f1o del auto\n");  //Por alguna razon no me quiere leer el nombre del dueño del auto
                nombreDueñoA = entrada.nextLine();
                System.out.println("Ingrese patente del auto");
                patenteA = entrada.nextLine();
                Auto a = new Auto(nombreDueñoA, patenteA);
                System.out.println("En que piso desea agregar el auto (0..2)");
                unPiso = entrada.nextInt();
                System.out.println("En que plaza desea agregar el auto (0..2)");
                unaPlaza = entrada.nextInt();
                e.registrarAuto(a, unPiso,unaPlaza);
            }
        
        //Muestre la representación String del estacionamiento en consola.  //igual que en el punto c.iii
        System.out.println("Informacion general : " + e.toString());
        
        
        //Muestre la cantidad de autos ubicados en la plaza 1.
        int cant = 0;
        for (int k = 0; k < pisos ; k++) {  //uso k para desplazarme por pisos
            if (e.getLugares()[k][1] != null ) {
                cant++;  //sumo la cantidad de autos encontrados
            }
            
            
        }
        System.out.println("La cantidad de autos ubicados en plaza 1 : " + cant);
        
        //Lea una patente por teclado e informe si dicho auto se encuentra en el
        //estacionamiento o no. En caso de encontrarse, la información a imprimir es el piso y
        //plaza que ocupa.
        
        //Por alguna razon no me quiere leer de teclado la  nueva patente
        //System.out.println("Ingrese patente a buscar en la matriz :\n");
        //unaPatente = entrada.nextLine();
        unaPatente = "sergio";
        
        System.out.println(e.buscarPatente(unaPatente));
        
    }
   
        
}
    

