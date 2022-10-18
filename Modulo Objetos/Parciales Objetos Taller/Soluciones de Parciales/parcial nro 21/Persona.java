/*
la información
de la persona a la que fue asignado (nombre, dni y colaboración en pesos). Sin embargo,
difieren en cierta funcionalidad (se detalla más adelante).
 */
package Parciales;

public class Persona {
    private String nombre;
    private int dni;
    private double colaboracion;
    
    public Persona(String unNombre,int unDni,double unaColaboracion) {
        nombre = unNombre;
        dni = unDni;
        colaboracion = unaColaboracion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public double getColaboracion() {
        return colaboracion;
    }

    public void setColaboracion(double colaboracion) {
        this.colaboracion = colaboracion;
    }

    @Override
    public String toString() {
        return "Persona{" + "nombre=" + nombre + ", dni=" + dni + ", colaboracion=" + colaboracion + '}';
    }

    
    
}
