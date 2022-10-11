/*
5-A- Modifique la clase VisorFiguras: ahora debe permitir guardar las figuras a mostrar (a
lo sumo 5) y también mostrar todas las figuras guardadas. Use la siguiente estructura.

B- Realice un programa que instancie el visor, guarde dos cuadrados y un rectángulo en el
visor y por último haga que el visor muestre sus figuras almacenadas.
 */
package tema4;

public class VisorFigurasModificado {
 private int guardadas;
 private int capacidadMaxima=5;
 private Figura [] vector;

 
 public VisorFigurasModificado(){
     guardadas = 0;
     vector = new Figura [capacidadMaxima];
     for (int i = 0; i < capacidadMaxima; i++) {
         vector[i] = null;
         
     }
 }

 
 public void guardar(Figura f){
     if (quedaEspacio()) {
         vector[guardadas] = f;
         guardadas++;
     }
 }
 
 public boolean quedaEspacio(){
     boolean aux = false;
     if (guardadas < capacidadMaxima) {
         aux = true;
     }
     return aux;
 }

 public void mostrar(){
     for (int i = 0; i < getGuardadas(); i++) {
         System.out.println(vector[i].toString());
         
     }
 }
 public int getGuardadas() {
 return guardadas;
 }

}

 
