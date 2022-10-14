/*
De cada “fecha” se conoce la ciudad y el día. Además la gira guarda el
número de la fecha en la que se tocará próximamente (actual).
 */
package tema5;

public class Fecha {
    private String ciudad;
    private int dia;
    
    public Fecha (String unaCiudad, int unDia) {
        ciudad = unaCiudad;
        dia = unDia;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }
    
    
}
