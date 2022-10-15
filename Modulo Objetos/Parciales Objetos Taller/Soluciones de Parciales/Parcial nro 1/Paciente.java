/*
De los pacientes guarda: nombre, si tiene
obra social y costo a abonar por la sesión.

Implemente constructores para iniciar: el sistema sin
pacientes; los pacientes a partir de toda su información.
 */
package Parciales;

public class Paciente {
    private String nombre;
    private boolean obraSocial;  // en false. si no tiene, en true caso contrario
    private int costoXsesion;
    
    public Paciente(String unNombre, boolean hayObraSocial,int unCosto) {
        nombre = unNombre;
        obraSocial = hayObraSocial;
        costoXsesion = unCosto;
        
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isObraSocial() {
        return obraSocial;
    }

    public void setObraSocial(boolean obraSocial) {
        this.obraSocial = obraSocial;
    }

    public int getCostoXsesion() {
        return costoXsesion;
    }

    public void setCostoXsesion(int costoXsesion) {
        this.costoXsesion = costoXsesion;
    }

    public String toStringPaciente() {
        return "Paciente{" + "nombre=" + nombre + ", obraSocial=" + obraSocial + ", costoXsesion=" + costoXsesion + '}';
    }
    
    
}
