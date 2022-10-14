/*
º Una gira es un recital que además tiene un nombre y las “fechas” donde se repetirá la
actuación. De cada “fecha” se conoce la ciudad y el día. Además la gira guarda el
número de la fecha en la que se tocará próximamente (actual).

El constructor de giras
además recibe el nombre de la gira y la cantidad de fechas que tendrá.
 */
package tema5;

public class Gira extends Recital{
    private String nombreGira;
    private Fecha [] vectorFechas;
    private int cantFechas,fechaActual;
    
    public Gira (String unNombreGira, int cantFechasTiene, String nombreBanda, int unaCantTemas) {
        super (nombreBanda,unaCantTemas);
        setNombreGira(unNombreGira);
        setCantFechas(cantFechasTiene);
        vectorFechas = new Fecha[cantFechasTiene];
        fechaActual  = 0;  // va iterando desde la 1er fecha hasta la ultima
        
    }

    public int getCantFechas() {
        return cantFechas;
    }

    public void setCantFechas(int cantFechas) {
        this.cantFechas = cantFechas;
    }

    public int getFechaActual() {
        return fechaActual;
    }

    public void setFechaActual(int fechaActual) {
        this.fechaActual = fechaActual;
    }

    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public Fecha[] getVectorFechas() {
        return vectorFechas;
    }

    public void setVectorFechas(Fecha[] vectorFechas) {
        this.vectorFechas = vectorFechas;
    }
    
    //ii. La gira debe saber responder a los mensajes:
// agregarFecha que recibe una “fecha” y la agrega adecuadamente.


    public void agregarFecha(Fecha unaFecha) {
         if (fechaActual < cantFechas) {  //fechaActual actua como la DL del vector de fechas
            vectorFechas[fechaActual] = unaFecha;  //se agrega un primer tema en la posicion 0
            fechaActual++;
        }
         
    }
    
    // La gira debe responder al mensaje actuar de manera distinta. Imprime la leyenda
//“Buenas noches …” seguido del nombre de la ciudad de la fecha “actual”. Luego
//debe imprimir el listado de temas como lo hace cualquier recital. Además debe
//establecer la siguiente fecha de la gira como la nueva “actual”.

    public String actuarDeManeraDistinta() {
        String aux = "";
            aux = "buenas noches " + vectorFechas[fechaActual-fechaActual].getCiudad();
            aux = aux + " Temas : "+ super.actuar();
                
            
            fechaActual = fechaActual +1;
            
            return aux;
        }
    
    
    
    //iv. Todo recital debe saber responder al mensaje calcularCosto teniendo en cuenta lo
//siguiente. Si es un evento ocasional devuelve 0 si es a beneficio, 50000 si es un show de TV
//y 150000 si es privado. Las giras deben devolver 30000 por cada fecha de la misma.

    @Override
    public double calcularCosto() {
        double monto = 0;
        monto = cantFechas * 30000;
        
        return monto;
    }
        
}
    

