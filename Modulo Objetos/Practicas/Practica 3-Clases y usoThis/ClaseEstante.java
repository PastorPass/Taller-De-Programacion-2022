/*
3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
(i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno
(iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.
 */
package tema3;

public class Estante {
    private int dimL,dimF;
    private Libro libros[];  //Utiliza la clase libro como un vector

    //Constructor (Inicializa el estante sin libros
    public Estante(int dimF) {
        this.dimF = dimF;
        libros = new Libro[dimF];  //libros es un vector de la instancia Libro (osea ) vector [0..19] of Libro
    }
    
    // (i) Devolver la cantidad de libros que estan almacenados en el estante
    public int devolverCantidadLibros () {
        return dimL;
    }
    
    // (ii) Devolver en un boolean si el estante está lleno (se puede omitir la variable aux)
    public boolean EstanteLleno () {
        boolean aux = false;
        if (dimL == dimF) {
            aux = true;
        }
        return aux;
    }
    
    // (iii) Agregar un libro al estante 
    public void AgregarLibro (Libro unLibro) {
        if (dimL < dimF) {
            libros[dimL] = unLibro;
            dimL++;
        }
    }
    //(iv) devolver el libro con un título particular que se recibe.
    public Libro DevolverLibroPorTitulo (String titulo) {
        int i= 0;
        while ((i < dimL) && !libros[i].getTitulo().equals(titulo)) {
          i++;
        }
        if (libros[i].getTitulo().equals(titulo)) {
            return libros[i];
        }
        else {
            return null;
        }
    }

    public Estante() {     
    }
}
