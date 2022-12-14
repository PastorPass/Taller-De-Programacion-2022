/*
4-A- Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está
ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).
(i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.
(ii) Implemente los constructores necesarios para iniciar: los clientes a partir de nombre,
DNI, edad; el hotel para N habitaciones, cada una desocupada y con costo aleatorio e/
2000 y 8000.
(iii) Implemente en las clases que corresponda todos los métodos necesarios para:
- Ingresar un cliente C en la habitación número X. Asuma que X es válido (es decir, está
en el rango 1..N) y que la habitación está libre.
- Aumentar el precio de todas las habitaciones en un monto recibido.
- Obtener la representación String del hotel, siguiendo el formato:
{Habitación 1: costo, libre u ocupada, información del cliente si está ocupada}
…
{Habitación N: costo, libre u ocupada, información del cliente si está ocupada}
B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones,
muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.
NOTAS: Reúse la clase Persona. Para cada método solicitado piense a qué clase debe
delegar la responsabilidad de la operación
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;

public class Hotel {
    private int n;
    private Habitacion []habitaciones;
    
    public Hotel (int cantHabitaciones) {
        n = cantHabitaciones;
        habitaciones = new Habitacion[n];
        for (int i = 0; i < n ; i++) {
            habitaciones[i] = new Habitacion (GeneradorAleatorio.generarDouble(6000)+2000);            
        }
    }
    
    public Habitacion[] getHabitaciones() {
            return habitaciones;
        }
    
    public void checkearDatosDeLaHabitacion (int x , Cliente c) {
        if (!habitaciones[x].isOcupada()) {
            habitaciones[x].setOcupada(true);
            habitaciones[x].setUnCliente(c);
        }
    }
    
    public void aumentarPrecio (double x) {
        for (int i = 0; i < n; i++) {
            habitaciones[i].aumentarPrecio(x);
        }
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < n; i++) {
            aux = aux + "Habitacion " + (i+1) + "" + habitaciones[i].toString();
        }
        return aux;
    }
    
    
    
}
