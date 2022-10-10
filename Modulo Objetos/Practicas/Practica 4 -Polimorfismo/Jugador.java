/*
2- Queremos representar a los empleados de un club: jugadores y entrenadores.
 Cualquier empleado se caracteriza por su nombre, sueldo básico y antigüedad.
 Los jugadores son empleados que se caracterizan por el número de partidos jugados y
el número de goles anotados.
 Los entrenadores son empleados que se caracterizan por la cantidad de campeonatos
ganados.
A- Implemente la jerarquía de clases declarando atributos, métodos para
obtener/modificar su valor y constructores que reciban los datos necesarios.
B- Cualquier empleado debe responder al mensaje calcularEfectividad. La efectividad
del entrenador es el promedio de campeonatos ganados por año de antigüedad, mientras
que la del jugador es el promedio de goles por partido.
C- Cualquier empleado debe responder al mensaje calcularSueldoACobrar. El sueldo a
cobrar es el sueldo básico más un 10% del básico por cada año de antigüedad y además:
 Para los jugadores: si el promedio de goles por partido es superior a 0,5 se adiciona un
plus de otro sueldo básico.
 Para los entrenadores: se adiciona un plus por campeonatos ganados (5000$ si ha
ganado entre 1 y 4 campeonatos; $30.000 si ha ganado entre 5 y 10 campeonatos;
50.000$ si ha ganado más de 10 campeonatos). 
*/
package tema4;

public class Jugador extends Empleado{
    private int numerosPartidosJugados,numGolesAnotados;
    
    public Jugador (int unosPartidosJugados,int unosGolesAnotados,String unNombre,int unaAntiguedad, double unSueldo) {
        super (unNombre, unaAntiguedad, unSueldo);
        setNumGolesAnotados(unosGolesAnotados);
        setNumerosPartidosJugados(unosPartidosJugados);
    }

    public int getNumerosPartidosJugados() {
        return numerosPartidosJugados;
    }

    public void setNumerosPartidosJugados(int numerosPartidosJugados) {
        this.numerosPartidosJugados = numerosPartidosJugados;
    }

    public int getNumGolesAnotados() {
        return numGolesAnotados;
    }

    public void setNumGolesAnotados(int numGolesAnotados) {
        this.numGolesAnotados = numGolesAnotados;
    }
    
    //La efectividad del jugador es el promedio de goles por partido.
    public double calcularEfectividad () {
        if (getNumerosPartidosJugados() <= 0) {
            return -1;
        }
        return (double)getNumGolesAnotados() / getNumerosPartidosJugados();
    }
    
    
    //El sueldo a cobrar es el sueldo básico más un 10% del básico por cada año de antigüedad y además:
// Para los jugadores: si el promedio de goles por partido es superior a 0,5 se adiciona un
//plus de otro sueldo básico.
    
    public double calcularSueldoAcobrar () {
        double monto;
        monto = getSueldoBasico() + ((getSueldoBasico() * 0.1) * getAntiguedad());
        if (calcularEfectividad() > 0.5) {
            monto = monto + getSueldoBasico();
        }
        return monto;
    }

    @Override
    public String toString() {
        String aux = super.toString() + "Jugador{" + "numerosPartidosJugados=" + numerosPartidosJugados + ", numGolesAnotados=" + numGolesAnotados + '}';
        return  aux;
    }
    
    
    
}
