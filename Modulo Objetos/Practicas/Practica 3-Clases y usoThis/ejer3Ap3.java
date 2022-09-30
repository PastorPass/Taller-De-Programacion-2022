/*
3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros.
Provea métodos para:
(i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno
(iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.
 */
package tema3;

import PaqueteLectura.Lector;

public class ejer3p3 {

    public static void main(String[] args) {
        Estante unEstante = new Estante(20); 
        String nom,bio,origen,titulo,editorial,isbn;
        int año;
        double precio;
        
        //Datos que se leen de teclado para un autor
        System.out.println("Ingrese un nombre del autor");
        nom = Lector.leerString();
        System.out.println("Ingrese una biografia del autor");
        bio = Lector.leerString();
        System.out.println("Ingrese el origen del autor");
        origen = Lector.leerString();
        
        Autor unAutor = new Autor(nom, bio, origen);  //Recibe un nombre, biografia y origen
        
        
        //Datos que se leen de teclado para un libro
        System.out.println("Ingrese un titulo del libro");
        titulo = Lector.leerString();
        System.out.println("Ingrese una editorial del libro");
        editorial = Lector.leerString();
        System.out.println("Ingrese un año");
        año = Lector.leerInt();
        System.out.println("Ingrese un ISBN del libro");
        isbn = Lector.leerString();
        System.out.println("Ingrese un precio del libro");
        precio = Lector.leerDouble();
        
        Libro unLibro = new Libro(titulo , editorial ,año, unAutor, isbn , precio);
        
        unEstante.AgregarLibro(unLibro);
        
        Libro unLibro2 = unEstante.DevolverLibroPorTitulo(titulo);  //el titulo puede ser otro
        
        System.out.println(unLibro2.toString());
        System.out.println(unEstante.EstanteLleno());
        System.out.println(unEstante.devolverCantidadLibros());
    }
    
}
