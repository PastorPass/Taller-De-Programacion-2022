/*
TURNO C TEMA 2
Representar las funciones de teatro. Una funcion tiene un titulo , fecha , hora y mantiene 
una estructura que representa la sala (N filas y M butacas por fila) 
que almacenara la informacion de cada butaca que comprende un descriptor (String) 
, el precio y su estado (si esta ocupada o no)

1.Genere las clases necesarias . Provea los constructores necesarios. 
La funcion debe iniciarse a partir de un titulo, una fecha , una hora, y las 
dimensiones de la sala (N yM ) . Inicialmente cada butaca debe estar desocupada,
tener un precio que surge de la formula 800 +100* nroFilaDelaButaca y un descriptor 
"butaca i,j " donde i es el nro de fila y j es el nro de butaca dentro de su fila.

2. Implemente los metodos necesarios en las clases que corresponda , para 

a) a) Ocupar la butaca número B de la fila número F y retornar su precio Asuma que F y B están en
rango 1 N y 1 M respectivamente.
b) Desocupar todas las butacas de la fila número F de la función. Asuma que F está en rango 1 N

c) Obtener un Stnng con todas las representaciones de las butacas número B de la función 
La representación de cada butaca es del estilo ("descriptor. precio. estado")  

d) Obtener un String que represente la función. que contenga: titulo. fecha. hora y la representación
de cada butaca ("descriptor. precio. estado"). 

3- Realice un programa que instancie una función de teatro. Ocupe distintas butacas. Compruebe el
correcto funcionamiento de los métodos implementados. 

 */
package Parciales;

public class Funcion {
    private String titulo,fecha;
    private int hora;
    private Butaca [][]matrizButacas;
    private int dimFi,dimFj;
    
    public Funcion(String unTitulo,String unaFecha,int unaHora,int unasFilas, int unasColumnas) {
        titulo = unTitulo;
        fecha = unaFecha;
        hora = unaHora;
        matrizButacas = new Butaca[unasFilas][unasColumnas];
      
        dimFi = unasFilas;
        dimFj = unasColumnas;
        
    }

    public int getDimFi() {
        return dimFi;
    }

    public void setDimFi(int dimFi) {
        this.dimFi = dimFi;
    }

    public int getDimFj() {
        return dimFj;
    }

    public void setDimFj(int dimFj) {
        this.dimFj = dimFj;
    }


    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getHora() {
        return hora;
    }

    public void setHora(int hora) {
        this.hora = hora;
    }

    public Butaca[][] getMatrizButacas() {
        return matrizButacas;
    }

    public void setMatrizButacas(Butaca[][] matrizButacas) {
        this.matrizButacas = matrizButacas;
    }
    
    /*
    2. Implemente los metodos necesarios en las clases que corresponda , para 

a) a) Ocupar la butaca número B de la fila número F y retornar su precio Asuma que F y B están en
rango 1 N y 1 M respectivamente.
    */
    public double  ocuparButaca (int f,int bColumna,Butaca b) {
        double aux = 0;
       // if ((bColumna >= 0 && bColumna <= dimFj) && (f >= 0 && f <= dimFi)) {
            if (matrizButacas[f][bColumna] == null) {
                
                matrizButacas[f][bColumna] = b;
                matrizButacas[f][bColumna].setOcupada(true);
                aux = matrizButacas[f][bColumna].getPrecio();
            }  
        //}
        return aux;
    }
    
    /*
    b) Desocupar todas las butacas de la fila número F de la función. Asuma que F está en rango 1 N
    */

    public void desocuparButacas(int unaFila) {
        if (unaFila >= 0 && unaFila <= dimFi) {
            for (int i = 0; i < dimFj; i++) {
                matrizButacas[unaFila][i].setOcupada(false);
                
            }
        }
    }
    /*
    c) Obtener un String con todas las representaciones de las butacas número B de la función 
La representación de cada butaca es del estilo ("descriptor. precio. estado")  
    */
    
    public String cadena(int butacaB) {
        String aux ="";
        for (int i = 0; i < dimFi; i++) {
            aux = aux + matrizButacas[i][butacaB];
            
        }
        
        return aux;
    }
    /*
    d) Obtener un String que represente la función. que contenga: titulo. fecha. hora y la representación
de cada butaca ("descriptor. precio. estado"). 
    */

    @Override
    public String toString() {
        String aux1 = "Funcion{" + "titulo=" + titulo + ", fecha=" + fecha + ", hora=" + hora;
        String aux2 = "";
        for (int i = 0; i < dimFi; i++) {
            
            for (int j = 0; j < dimFj; j++) {
                aux2 = aux2 + matrizButacas[i][j]+"\n";
                
            }
        }
        return aux1 + aux2;
    }
    
    
    
}
