/*
2-A- Modifique la clase Libro.java (carpeta tema3) para ahora considerar que el primer
autor es un objeto instancia de la clase Autor.
Implemente la clase Autor, sabiendo que se caracterizan por nombre, biografía y origen
y que deben permitir devolver/modificar el valor de sus atributos y devolver una
representación String formada por nombre, biografía y origen.
Luego realice las modificaciones necesarias en la clase Libro
(Hecho en la clase Autor)

B- Modifique el programa Demo01Constructores (carpeta tema3) para instanciar los
libros con su autor, considerando las modificaciones realizadas. Luego, a partir de uno de
los libros instanciados, obtenga e imprima la representación del autor de ese libro.


 */
/*
Demo que crea objetos Libro invocando a los constructores definidos. 
 */
package tema3;

import PaqueteLectura.Lector;

public class ejer2ABp3 {

    public static void main(String[] args) {
        String nom,biografia,origen;
        System.out.println("Ingrese un nombre de autor");
        nom = Lector.leerString();
        System.out.println("Ingrese una biografia del autor");
        biografia = Lector.leerString();
        System.out.println("Ingrese un origen del autor");  //como origen supongo a su nacionalidad
        origen = Lector.leerString();
        
        Autor unAutor = new Autor(nom,biografia,origen);  
        
        Libro libro1= new  Libro( "Java: A Beginner's Guide", "Mcgraw-Hill", 2014, unAutor, "978-0071809252", 21.72);
        
        
        /*
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               "John Horton", "978-1512108347");
        */
        System.out.println(libro1.toString());
        //System.out.println(libro2.toString());
        //System.out.println("Precio del libro2: " +libro2.getPrecio());
        //System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        //Libro libro3= new Libro(); 
    }
    
}
