/*
3-A- Implemente las clases para el siguiente problema. Una garita de seguridad quiere
identificar los distintos tipos de personas que entran a un barrio cerrado. Al barrio pueden
entrar: personas, que se caracterizan por nombre, DNI y edad; y trabajadores, estos son
personas que se caracterizan además por la tarea realizada en el predio.
Implemente constructores, getters y setters para las clases. Además tanto las personas
como los trabajadores deben responder al mensaje toString siguiendo el formato:
 Personas “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años”
 Trabajadores “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años. Soy jardinero.”
B- Realice un programa que instancie una persona y un trabajador y muestre la
representación de cada uno en consola.
NOTA: Reutilice la clase Persona (carpeta tema2)
 */
package tema4;

import PaqueteLectura.Lector;

public class ejer3p4 {

    public static void main(String[] args) {
        String nombre,rubro;
        int dni,edad,tecla;
        
        System.out.println("Ingrese datos generales de una persona");
        System.out.println("Ingrese nombre");
        nombre = Lector.leerString();
        System.out.println("Ingrese edad");
        edad = Lector.leerInt();
        System.out.println("Ingrese dni");
        dni = Lector.leerInt();
        
        
        System.out.println("Es trabajador ? 1. Si ; 2. No");
        tecla = Lector.leerInt();
        if (tecla == 1) {
             System.out.println("Ingrese rubro");
             rubro = Lector.leerString(); 
             Trabajador t = new Trabajador(rubro,nombre,edad,dni);
             System.out.println("Trabajadores : " + t.toString());
        }
        else {
            PersonaV2  p = new PersonaV2(nombre,dni,edad);
            System.out.println(p.toString());
        }
    }
    
}
