/*
5)
1) Queremos representar estanterías de libros. Una estantería mantiene sus libros
organizados en N estantes cada uno con lugar para M libros. Un libro posee título, nombre
de su primer autor y peso.
a) Implemente las clases de su modelo, con sus atributos y getters/setters adecuados.
Provea constructores para iniciar: los libros a partir de toda su información; la estantería
para N estantes y lugar para M libros por estante (inicialmente no debe tener libros
cargados).
b) Implemente los siguientes métodos:
- almacenarLibro: recibe un libro, un nro. de estante y nro. de lugar válidos y guarda al
libro en la estantería. Asuma que dicho lugar está disponible.
- sacarLibro: recibe el título de un libro, y saca y devuelve el libro con ese título, quedando
su lugar disponible. Tenga en cuenta que el libro puede no existir.
- calcular: calcula y devuelve el libro más pesado de la estantería.

2) Realice un programa que instancie una estantería para 5 estantes y 3 libros por
estante. Almacene 7 libros en la estantería. A partir de la estantería: saque un libro e
informe su representación String; luego, informe el título del libro más pesado.
 */
package Parciales;

import PaqueteLectura.GeneradorAleatorio;

public class parcial5 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Estante e = new Estante(5,3);
        Libro b;
        for (int i=0;i<6;i++){
            b = new Libro(GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarDouble(5)+0.3);
            e.almacenarLibro(b, GeneradorAleatorio.generarInt(5), GeneradorAleatorio.generarInt(3));
        }
        
        b = new Libro("ajedrez","capablanca",10);
        e.almacenarLibro(b, 2, 2);
        
        
        b = e.sacarLibro("ajedrez");
                
        if (b != null) {
            System.out.println("El libro sacado de la estanteria es :" + b.toStringLibro());
        }
        else {
            System.out.println("el titulo del libro : ajedrez , no estaba en la estanteria");
        }
        
        Libro c1 = new Libro("fundamentos","fedor", 8);
        e.almacenarLibro(c1, 1, 2);
        b = e.calcular();
        if (b != null) {
                    System.out.println("El titulo del libro mas pesado es :" + b.getTitulo());

        }
        else {
            System.out.println("No habia libros en la estanteria, por lo que no se calculo nada");
        }
    }
    
}
