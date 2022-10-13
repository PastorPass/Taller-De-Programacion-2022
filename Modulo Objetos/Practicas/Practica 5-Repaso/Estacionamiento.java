/*
2- Queremos un sistema para gestionar estacionamientos. Un estacionamiento conoce su
nombre, dirección, hora de apertura, hora de cierre, y almacena para cada número de piso
(1..N) y número de plaza (1..M), el auto que ocupa dicho lugar. De los autos se conoce
nombre del dueño y patente.
a) Genere las clases, incluyendo getters y setters adecuados.
b) Implemente constructores. En particular, para el estacionamiento:
- Un constructor debe recibir nombre y dirección, e iniciar el estacionamiento
con hora de apertura “8:00”, hora de cierre “21:00”, y para 5 pisos y 10 plazas
por piso. El estacionamiento inicialmente no tiene autos.
- Otro constructor debe recibir nombre, dirección, hora de apertura, hora de
cierre, el número de pisos (N) y el número de plazas por piso (M) e iniciar el
estacionamiento con los datos recibidos y sin autos.
c) Implemente métodos para:
- Dado un auto A, un número de piso X y un número de plaza Y, registrar al auto
en el estacionamiento en el lugar X,Y. Suponga que X, Y son válidos (es decir,
están en rango 1..N y 1..M respectivamente) y que el lugar está desocupado.

- Dada una patente, obtener un String que contenga el número de piso y plaza
donde está dicho auto en el estacionamiento. En caso de no encontrarse,
retornar el mensaje “Auto Inexistente”.

- Obtener un String con la representación del estacionamiento. Ejemplo: “Piso 1
Plaza 1: libre Piso 1 Plaza 2: representación del auto …
 Piso 2 Plaza 1: libre … etc”

- Dado un número de plaza Y, obtener la cantidad de autos ubicados en dicha
plaza (teniendo en cuenta todos los pisos).

d) Realice un programa que instancie un estacionamiento con 3 pisos y 3 plazas por piso.
Registre 6 autos en el estacionamiento en distintos lugares.
Muestre la representación String del estacionamiento en consola.
Muestre la cantidad de autos ubicados en la plaza 1.
Lea una patente por teclado e informe si dicho auto se encuentra en el
estacionamiento o no. En caso de encontrarse, la información a imprimir es el piso y
plaza que ocupa.
*/

package tema5;
//Queremos un sistema para gestionar estacionamientos. Un estacionamiento conoce su
//nombre, dirección, hora de apertura, hora de cierre, y almacena para cada número de piso
//(1..N) y número de plaza (1..M), el auto que ocupa dicho lugar. De los autos se conoce
//nombre del dueño y patente.

public class Estacionamiento {
    private String nombre,direccion;
    private int horaApertura,horaCierre;  // formato 24 hs
    private Auto [][] lugares;  // una matriz de lugares de autos , guarda un auto en cada posicion
    private int numPiso,numPlaza;
    
    
    //Implemente constructores. En particular, para el estacionamiento:
//- Un constructor debe recibir nombre y dirección, e iniciar el estacionamiento
//con hora de apertura “8:00”, hora de cierre “21:00”, y para 5 pisos y 10 plazas
//por piso. El estacionamiento inicialmente no tiene autos.
    public Estacionamiento (String unNombre, String unaDireccion) {
        nombre = unNombre;
        direccion = unaDireccion;
        horaApertura = 8;
        horaCierre = 21;
        numPiso = 5;
        numPlaza = 10;
        lugares = new Auto[numPiso][numPlaza];
        
    }
    
    //- Otro constructor debe recibir nombre, dirección, hora de apertura, hora de
//cierre, el número de pisos (N) y el número de plazas por piso (M) e iniciar el
//estacionamiento con los datos recibidos y sin autos.
    
    public Estacionamiento (String unNombre, String unaDireccion,int unaHoraA,int unaHoraC,int cantPisos,int cantPlazas){
        nombre = unNombre;
        direccion = unaDireccion;
        horaApertura = unaHoraA;
        horaCierre = unaHoraC;
        numPiso = cantPisos;
        numPlaza = cantPlazas;
        lugares = new Auto[cantPisos][cantPlazas];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(int horaApertura) {
        this.horaApertura = horaApertura;
    }

    public int getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(int horaCierre) {
        this.horaCierre = horaCierre;
    }

    public Auto[][] getLugares() {
        return lugares;
    }

    public void setLugares(Auto[][] lugares) {
        this.lugares = lugares;
    }

    public int getNumPiso() {
        return numPiso;
    }

    public void setNumPiso(int numPiso) {
        this.numPiso = numPiso;
    }

    public int getNumPlaza() {
        return numPlaza;
    }

    public void setNumPlaza(int numPlaza) {
        this.numPlaza = numPlaza;
    }
    
    //- Dado un auto A, un número de piso X y un número de plaza Y, registrar al auto
//en el estacionamiento en el lugar X,Y. Suponga que X, Y son válidos (es decir,
// están en rango 1..N y 1..M respectivamente) y que el lugar está desocupado.
    
    public void registrarAuto(Auto unAuto,int unPiso,int unaPlaza) { 
        lugares [unPiso][unaPlaza] = unAuto;

    }
    
    //Dada una patente, obtener un String que contenga el número de piso y plaza
//donde está dicho auto en el estacionamiento. En caso de no encontrarse,
//retornar el mensaje “Auto Inexistente”.

    public String buscarPatente (String unaPatente) {
        String aux;
        int i = 0, j = 0;
      
        while (i<numPiso && !(lugares[i][j]!=null && lugares[i][j].getPatente().equals(unaPatente))){
            while (j<numPlaza && !(lugares[i][j]!=null && lugares[i][j].getPatente().equals(unaPatente))){
                if (!(lugares[i][j]!=null && lugares[i][j].getPatente().equals(unaPatente))) {
                    j++;
                }
            }
            if (j==3){
                j=0;
                i++;
            }
        }
        
        if (i<numPiso && j<numPlaza && (lugares[i][j]!=null && lugares[i][j].getPatente().equals(unaPatente))) {
            aux= " Piso: " + i + " , Plaza: " +j;
        }
        else {
            aux="Auto inexistente";
        }   
        return aux;
    }

    //- Obtener un String con la representación del estacionamiento. Ejemplo: “Piso 1
//Plaza 1: libre Piso 1 Plaza 2: representación del auto …
 //Piso 2 Plaza 1: libre … etc”
    
    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < numPiso; i++) {
            aux = aux + " piso  " + i + "\n";
            for (int j = 0; j < numPlaza; j++) {
                aux = aux + "plaza " + j +" ";
                if (lugares[i][j] == null) {
                    aux = aux + "libre";
                }
                else {
                    aux = aux + lugares [i][j].toStringAuto();
                    aux = aux +"\n";
                }   
            }
        }
        
        return aux;
        //return "Estacionamiento{" + "nombre=" + nombre + ", direccion=" + direccion + ", horaApertura=" + horaApertura + ", horaCierre=" + horaCierre + ", lugares=" + lugares + ", numPiso=" + numPiso + ", numPlaza=" + numPlaza + '}';
    }
    
    //- Dado un número de plaza Y, obtener la cantidad de autos ubicados en dicha
//plaza (teniendo en cuenta todos los pisos).

    public int obtenerAutos(int unNumPlaza) {
        int cant = 0;
        for (int i = 0; i < numPiso; i++) {
            if (lugares[i][unNumPlaza] != null) {
                cant++;
            }    
            i++;
              
        }
        return cant;
    }   
}
