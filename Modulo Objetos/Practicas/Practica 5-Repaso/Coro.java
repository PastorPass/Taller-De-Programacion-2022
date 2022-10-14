/*
4- Una escuela de música arma coros para participar de ciertos eventos. Los coros poseen
un nombre y están formados por un director y una serie de coristas.
 */
package tema5;

public abstract class Coro {
    private String nombreCoro;
    private Director director;
    
    public Coro(String unNombreC, Director unDirector ) {
        nombreCoro = unNombreC;
        director = unDirector;
        
    }

    public String getNombreCoro() {
        return nombreCoro;
    }

    public void setNombreCoro(String nombreCoro) {
        this.nombreCoro = nombreCoro;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }
    
    public abstract void agregarCorista(Corista c);
    public abstract boolean estaLleno();
    public abstract boolean estaBienFormado();
    
    // devolver la representación de un coro formada por el nombre del coro, todos
//los datos del director y todos los datos de todos los coristas.

    @Override
    public String toString() {
        return "Coro{" + "nombreCoro=" + nombreCoro + ", director =" + director.toString() + "\n";
    }
    
}
