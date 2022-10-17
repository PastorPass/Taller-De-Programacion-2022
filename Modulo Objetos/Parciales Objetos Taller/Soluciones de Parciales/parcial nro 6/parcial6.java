/*
2) Realice un programa que instancie un libro electrónico y un libro impreso. Cargue 3
autores a cada uno. Para finalizar, muestre la representación String de los libros.

 */
package Parciales;

import PaqueteLectura.GeneradorAleatorio;

public class parcial6 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Electronico be = new Electronico("untitulo",32,"unformatio",30);
        be.agregarLibroConAutor("zzz");
        
        ImpresoBook bi = new ImpresoBook("1000 leguas de viaje submarino",200,true);
        
        bi.agregarLibroConAutor("borges");
        
        for (int i = 0; i < 3; i++) {
            bi.agregarLibroConAutor(GeneradorAleatorio.generarString(10));
            be.agregarLibroConAutor((GeneradorAleatorio.generarString(10)));
            
        }
        
        System.out.println("Representacion del libro electronico : "  + be.toString());
        System.out.println("Representacion del libro impreso : "+ bi.toString());
        
        System.out.println(be.cadenaAutores());
        
        //sumar el obtener precio final en la variable aux del metodo cadenaAutores de cada clase
        //public String cadenaAutores() {
       //    String aux = ""+ obtenerPrecioFinal();
        
    }
    
}
