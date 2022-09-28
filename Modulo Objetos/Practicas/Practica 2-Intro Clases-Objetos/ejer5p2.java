/*
 5- Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un
encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin
valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el
nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto
partido sabe responder a los siguientes mensajes:
getLocal() retorna el nombre (String) del equipo local
getVisitante() retorna el nombre (String) del equipo visitante
getGolesLocal() retorna la cantidad de goles (int) del equipo local
getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
setLocal(X) modifica el nombre del equipo local al “String” X
setVisitante(X) modifica el nombre del equipo visitante al “String” X
setGolesLocal(X) modifica la cantidad de goles del equipo local al “int” X
setGolesVisitante(X) modifica la cantidad de goles del equipo visitante al “int” X
hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna
un String vacío).
hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate

Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:
- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class ejer5p2 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        final int DF = 20;
    
        Partido []vector =  new Partido[DF];
        
        String nomVisitante;
        System.out.println("Ingrese un nombre del equipo visitante");
        nomVisitante = Lector.leerString();
        int i = 0;
        while ((!"zzz".equals(nomVisitante)) && (i < DF)){
            vector[i] = new Partido();  //Siempre genero un nuevo objeto
            vector[i].setVisitante(nomVisitante);
            System.out.println("nombre del equipo visitante: " + nomVisitante);
           // vector[i].setLocal(Lector.leerString());
           
           // vector[i].setLocal(GeneradorAleatorio.generarString(10));
           // System.out.println("nombre del equipo local aleatorio: " + vector[i].getLocal());
            System.out.println("Ingrese nombre del equipo local");
            vector[i].setLocal(Lector.leerString());

            vector[i].setGolesLocal(GeneradorAleatorio.generarInt(10));
                        System.out.println("cantidad de goles del local: " + vector[i].getGolesLocal());

            vector[i].setGolesVisitante(GeneradorAleatorio.generarInt(10));
            System.out.println("Cantidad de goles del visitante : " + vector[i].getGolesVisitante());
            System.out.println("-----------------------------------------------------------------");
            i++;
            //Vuelvo a leer un partido
            System.out.println("Vuelva a ingresar un nombre del equipo visitante");
            nomVisitante = Lector.leerString();
        }
        //Informe de cada partido del vector
        int DL,cantPartidos = 0;
        int golesBoca = 0;
        DL = i;  //Ya que en la variable i esta la dimL 
                
        for (int j = 0; j < DL; j++) {
            System.out.println(vector[j].toCadena());
            System.out.println("----------------------------------------------");
            if (!vector[j].hayEmpate()) {
                if (vector[j].getGanador().equals("river")) {                        
                    cantPartidos++;
                }
            }
            if (vector[j].getLocal().equals("boca")) {
                golesBoca += vector[j].getGolesLocal();
            }
        }
        //Informe Final
        System.out.println("La cantidad de partidos que ganó river = " + cantPartidos);
        System.out.println("El total de goles que realizó Boca jugando de local : " + golesBoca);   
    }
}
