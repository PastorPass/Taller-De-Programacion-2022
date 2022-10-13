/*
Un proyecto
tiene: nombre, código, nombre completo del director y los investigadores que participan
en el proyecto (50 como máximo).

i) Implemente el modelo de clases teniendo en cuenta:
a. Un proyecto sólo debería poder construirse con el nombre, código, nombre del
director.
 */
package tema5;

public class Proyecto{
    private String nombre,nombreDirector;
    private int codigo;
    private Investigador[] vectorInvestigadores = new Investigador[50];
    private int cantidadInvestigadores;
    
    //Constructor
    public Proyecto(String unNombre,String unNombreDirector,int unCodigo) {
        nombre = unNombre;
        nombreDirector = unNombreDirector;
        codigo = unCodigo;
        cantidadInvestigadores = 0;
        
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
    
    //a. void agregarInvestigador(Investigador unInvestigador);
// agregar un investigador al proyecto.
    
    public boolean hayEspacio() {
        boolean aux = false;
        if (cantidadInvestigadores < 50) {
            aux = true;
        }
        return aux;
    }
    
    public void agregarInvestigador(Investigador unInvestigador) {
        if (hayEspacio()== true)  {
            vectorInvestigadores[cantidadInvestigadores] = unInvestigador;
            cantidadInvestigadores++;
        }
    }
    
    // //c. double dineroTotalOtorgado();
//devolver el monto total otorgado en subsidios del proyecto (tener en cuenta
//todos los subsidios otorgados de todos los investigadores)
    
    public double dineroTotalOtorgado() {
        double aux = 0;
        if (cantidadInvestigadores == 0) {
            aux = -1;
        }
        else {
            for (int i=0;i<cantidadInvestigadores;i++){
                aux=aux+vectorInvestigadores[i].dineroTotalOtorgadoSubsidios();
            }
        }
        return aux;
    }
    
    public void otorgarTodos(String unNombreCompleto){
        int i=0;
        while (i<cantidadInvestigadores && !unNombreCompleto.equals(vectorInvestigadores[i].getNombre())){
            i++;
        }
        if (i<cantidadInvestigadores && unNombreCompleto.equals(vectorInvestigadores[i].getNombre())) this.vectorInvestigadores[i].otorgarTodosLosSubsidios(unNombreCompleto);
    }
    
    
    
    
  //  e. String toString();
// devolver un string con: nombre del proyecto, código, nombre del director, el
//total de dinero otorgado del proyecto y la siguiente información de cada
//investigador: nombre, categoría, especialidad, y el total de dinero de sus
//subsidios otorgados.
    
    @Override
    public String toString() {
        String aux;
        aux =  "Nombre del proyecto : " + nombre + " codigo : " + codigo + " nombre del director: " + nombreDirector + "\n" +
               " total del dinero otorgado del proyecto " + dineroTotalOtorgado()+ "\n";
                
                for (int i = 0; i < cantidadInvestigadores; i++) {
                    aux  = aux + vectorInvestigadores[i].toStringInvestigador()+ " \n";
                        
                }
        return aux;
    }
    
    
   
    
}
