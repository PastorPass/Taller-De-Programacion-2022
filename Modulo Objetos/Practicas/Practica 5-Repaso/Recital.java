/*
3- Un productor musical desea administrar los recitales que organiza, que pueden ser:
eventos ocasionales y giras.
º De todo recital se conoce el nombre de la banda y la lista de temas que tocarán durante
el recital.

b) Implemente los constructores. El constructor de recitales recibe el nombre de la banda
y la cantidad de temas que tendrá el recital.
 */
package tema5;

public abstract class Recital {
    private String nombreBanda;
    private String [] vectorTemas;
    private int totalTemas,DL;
    
    public Recital (String unNombreBanda, int cantTemas) {
        nombreBanda = unNombreBanda;
        totalTemas = cantTemas;
        vectorTemas = new String [cantTemas];
        DL = 0;
    }

    public String[] getVectorTemas() {
        return vectorTemas;
    }

    public void setVectorTemas(String[] vectorTemas) {
        this.vectorTemas = vectorTemas;
    }

    
    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }

    public int getTotalTemas() {
        return totalTemas;
    }

    public void setTotalTemas(int totalTemas) {
        this.totalTemas = totalTemas;
    }
    
    //c) Implemente los métodos listados a continuación:
//i. Cualquier recital debe saber responder a los mensajes:
// agregarTema que recibe el nombre de un tema y lo agrega a la lista de temas.


    public void agregarTema(String nombreTema) {
        if (DL < totalTemas)  {
            vectorTemas[DL] = nombreTema;  //se agrega un primer tema en la posicion 0
            DL++;
        }
       
    }
    
//     actuar que imprime (por consola) para cada tema la leyenda “y ahora
//tocaremos…” seguido por el nombre del tema.
    
    public String actuar () {
        String aux = "";
        if (vectorTemas[0] == null) {
            aux = "no hay temas en la lista, se debe agregar un tema con el metodo .agregarTema(unNombreTema)";
        }
        else {
            for (int i = 0; i < DL; i++) {    
              aux = aux + "\n" + " y ahora tocaremos : "  + vectorTemas[i].toString() + "\n";
            }
        }
        
        return aux;
    }

    //iv. Todo recital debe saber responder al mensaje calcularCosto teniendo en cuenta lo
//siguiente. Si es un evento ocasional devuelve 0 si es a beneficio, 50000 si es un show de TV
//y 150000 si es privado. Las giras deben devolver 30000 por cada fecha de la misma.

    public abstract double calcularCosto();
    
}
    

