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

public class Entrenador extends Empleado {
    private int cantCampeonatosGanados;
    
    public Entrenador (int unaCantidadCampGanados,String unNombre, int unaAntiguedad, double unSueldo) {
        super(unNombre, unaAntiguedad, unSueldo);
        setCantCampeonatosGanados(unaCantidadCampGanados);
    }

    public int getCantCampeonatosGanados() {
        return cantCampeonatosGanados;
    }

    public void setCantCampeonatosGanados(int cantCampeonatosGanados) {
        this.cantCampeonatosGanados = cantCampeonatosGanados;
    }
    
    //La efectividad del entrenador es el promedio de campeonatos ganados por año de antigüedad,
    public double calcularEfectividad () {
        if (getAntiguedad() <= 0) {
            return -1;
        }
        return (double)getCantCampeonatosGanados() / getAntiguedad();
    }
    
    //Cualquier empleado debe responder al mensaje calcularSueldoACobrar. El sueldo a
//cobrar es el sueldo básico más un 10% del básico por cada año de antigüedad y ademas :
// Para los entrenadores: se adiciona un plus por campeonatos ganados (5000$ si ha
//ganado entre 1 y 4 campeonatos; $30.000 si ha ganado entre 5 y 10 campeonatos;
//50.000$ si ha ganado más de 10 campeonatos). 
    public double calcularSueldoAcobrar () {
        double monto;
        monto = getSueldoBasico() + ((getSueldoBasico() * 0.1) * getAntiguedad());
        if (getCantCampeonatosGanados() >= 1 && getCantCampeonatosGanados() <= 4) {
            monto += 5000;  // adiciono un monto 
        }
        if (getCantCampeonatosGanados() >= 5 && getCantCampeonatosGanados() <= 10) {
            monto +=  30000;
        }
        if (getCantCampeonatosGanados() >10) {
            monto +=50000;
        }
        return monto;
    }

    @Override
    public String toString() {
        String aux = super.toString() + "Entrenador{" + "cantCampeonatosGanados=" + cantCampeonatosGanados + '}';
        return aux;
    }
    
    
    
}
