/*
De cada investigador se tiene: nombre completo,
categoría (1 a 5) y especialidad. 

b. Un investigador sólo debería poder construirse con nombre, categoría y
especialidad.

Además, cualquier investigador puede pedir hasta un
máximo de 5 subsidios.
 */
package tema5;

public class Investigador  {
    private String nombre,especialidad;
    private int categoria;  // de 1 a 5
    private Subsidio []vectorSubsidios = new Subsidio[5]; // vector de booleans
    private int cantSubsidios;
    
    public Investigador(String unNombre, int unaCategoria, String unaEspecialidad) {
        nombre = unNombre;
        categoria = unaCategoria;
        especialidad = unaEspecialidad;
        cantSubsidios = 0;
        
    }
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }
    
    public boolean hayEspacioEnVector() {
        boolean ok = false;
        if (cantSubsidios < 5) {
            ok = true;
        }
        return ok;
    }
    //void agregarSubsidio(Subsidio unSubsidio);
// agregar un subsidio al investigador.
    public void agregarSubsidio (Subsidio unSubsidio) {
        if (hayEspacioEnVector() == true) {
            vectorSubsidios[cantSubsidios] = unSubsidio;
            cantSubsidios++;
        }
    }
    
    //c. double dineroTotalOtorgado();
//devolver el monto total otorgado en subsidios del proyecto (tener en cuenta
//todos los subsidios otorgados de todos los investigadores)

    public double dineroTotalOtorgadoSubsidios() {
        double aux = 0;
        if (cantSubsidios == 0) {
            aux = -1;
        }
        else {
           for (int i=0;i<cantSubsidios;i++){
                if (vectorSubsidios[i].isOtorgado() == true) {
                    aux=aux+vectorSubsidios[i].getMontoPedido();
                }
            }
        }
        return aux;
    }

    
    //d. void otorgarTodos(String nombre_completo);
//otorgar todos los subsidios no-otorgados del investigador llamado
//nombre_completo
    public void otorgarTodosLosSubsidios(String unNombreCompleto) {
        for (int i = 0; i < cantSubsidios; i++) {
            vectorSubsidios[i].setOtorgado(true);
            
        }
    }

    public String toStringInvestigador() {
        //Se puede hacer con super.toString ??
        return "\n" + "Investigador{" + "nombre=" + nombre + ", especialidad=" + especialidad + ", categoria=" + categoria + " , cantSubsidios=" + cantSubsidios + "total dinero subsidios otorgados : " + dineroTotalOtorgadoSubsidios();
    }
    
}
