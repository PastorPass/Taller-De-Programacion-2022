/*
 2-A- Modifique la clase Libro.java (carpeta tema3) para ahora considerar que el primer
autor es un objeto instancia de la clase Autor.
Implemente la clase Autor, sabiendo que se caracterizan por nombre, biografía y origen
y que deben permitir devolver/modificar el valor de sus atributos y devolver una
representación String formada por nombre, biografía y origen.
Luego realice las modificaciones necesarias en la clase Libro
 */
//Sin modificar ninguna clase, creo una nueva clase llamada Autor
package tema3;

public class Autor {
    private String nombre,biografia,origen;
    
    //Luego de declarar las variables , click derecho -> insert code -> Generar getteres y setters automaticamente
    public Autor(  String unNombre,String unaBiografia, String unOrigen){
         nombre = unNombre;
         biografia = unaBiografia;
         origen = unOrigen;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }
    
    public Autor() {
    
    }  // Es lo mismo que ? -->    Autor () {    (sin el public eventualmente)
                           //    }
 
    //Click derecho -> Insert code -> generar metodo toString (automatico)
    @Override
    public String toString() {
        return "Autor{" + "nombre=" + nombre + ", biografia=" + biografia + ", origen=" + origen + '}';
    }
    
    
}

