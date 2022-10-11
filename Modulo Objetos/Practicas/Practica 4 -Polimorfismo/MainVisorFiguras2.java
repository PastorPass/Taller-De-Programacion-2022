/*
5-A- Modifique la clase VisorFiguras: ahora debe permitir guardar las figuras a mostrar (a
lo sumo 5) y también mostrar todas las figuras guardadas. Use la siguiente estructura.

B- Realice un programa que instancie el visor, guarde dos cuadrados y un rectángulo en el
visor y por último haga que el visor muestre sus figuras almacenadas.
 */
package tema4;


public class MainVisorFiguras2 {

    public static void main(String[] args) {
    VisorFigurasModificado visor = new VisorFigurasModificado();

    Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
    Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
    Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");

    visor.guardar(c1);
    visor.guardar(c2);
    visor.guardar(r);
    visor.mostrar();
    System.out.println(visor.getGuardadas());
    }
    
}
