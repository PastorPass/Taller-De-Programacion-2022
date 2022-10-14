/*
 Un evento ocasional es un recital que además tiene el motivo (a beneficio, show de TV
o show privado), el nombre del contratante del recital y el día del evento.

El constructor de eventos ocasionales además
recibe el motivo, el nombre del contratante y día del evento. 
 */
package tema5;

/**
 *
 * @author pastor
 */
public class Evento extends Recital {
    private int motivo; // 1. si es a beneficio; 2 . Si es show de tv ; 3 .Si es show privado
    private String nombreContratante;
    private int dia;  // del 1 al 31
    
    public Evento (int unMotivo, String unNombreC, int unDia, String nombreBanda,int cantTemas) {
        super(nombreBanda, cantTemas);
        setDia(unDia);
        setMotivo(unMotivo);
        setNombreContratante(unNombreC);
        
        
    }
    

    public int getMotivo() {
        return motivo;
    }

    public void setMotivo(int motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }
    
    //iii. El evento ocasional debe saber responder al mensaje actuar de manera distinta:
// Si es un show de beneficencia se imprime la leyenda “Recuerden colaborar con…“
//seguido del nombre del contratante.
// Si es un show de TV se imprime “Saludos amigos televidentes”
// Si es un show privado se imprime “Un feliz cumpleaños para…” seguido del
//nombre del contratante.
//Independientemente del motivo del evento, luego se imprime el listado de temas como
//lo hace cualquier recital.
        
     public String actuarDeManeraDistinta() {
         String aux =  "";
         if (motivo == 1) {
             aux = "Recuerden colaborar con : " + getNombreContratante();
         }
         if (motivo == 2) {
             aux = "Saludos amigos bobo-videntes";
         }
         if (motivo ==3) {
             aux = "Un feliz cumpleaños para : " + getNombreContratante();
         }
         
         aux = aux + ("\n Lista de temas : " + super.actuar());
        return aux;
     }
     
     //iv. Todo recital debe saber responder al mensaje calcularCosto teniendo en cuenta lo
//siguiente. Si es un evento ocasional devuelve 0 si es a bene/ficio, 50000 si es un show de TV
//y 150000 si es privado. Las giras deben devolver 30000 por cada fecha de la misma.
    
    @Override
     public double calcularCosto() {
         double monto = 0;
         if (motivo == 1) {
             monto = 0;
         }
         if (motivo == 2) {
             monto = 5000;
         }
         if (motivo == 3) {
             monto = 15000;
         }
         return monto;
     }
     
    
}
