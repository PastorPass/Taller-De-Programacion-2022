/*
Del director se
conoce el nombre, DNI, edad y la antigüedad (un número entero). 
 */
package tema5;


public class Director extends Persona {
    private int antiguedad;
    
    
    public Director (String unNombreD, int unDni,int unaEdad, int unaAntiguedad) {
        super(unNombreD,unDni,unaEdad);
        setAntiguedad(unaAntiguedad);
        
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    
    // devolver la representación de un coro formada por el nombre del coro, todos
//los datos del director y todos los datos de todos los coristas.

    @Override
    public String toString() {
        String aux = super.toString() + "Director {"+ "antiguedad : " + antiguedad;
        return aux;
    }
    
    
}
