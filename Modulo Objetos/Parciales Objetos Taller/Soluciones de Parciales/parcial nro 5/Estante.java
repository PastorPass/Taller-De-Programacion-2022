/*
1) Queremos representar estanterías de libros. Una estantería mantiene sus libros
organizados en N estantes cada uno con lugar para M libros.

Provea constructores para iniciar: los libros a partir de toda su información; la estantería
para N estantes y lugar para M libros por estante (inicialmente no debe tener libros
cargados).
 */
package Parciales;

/**
 *
 * @author pastor
 */
public class Estante {
    private Libro matrizLibros[][];
    private int cantEstantes,cantLibros;
    
    public Estante(int estantes, int libros) {
        matrizLibros = new Libro[estantes][libros];
        cantEstantes = estantes;
        cantLibros = libros;
    }

    public Libro[][] getMatrizLibros() {
        return matrizLibros;
    }

    public void setMatrizLibros(Libro[][] matrizLibros) {
        this.matrizLibros = matrizLibros;
    }

    public int getCantEstantes() {
        return cantEstantes;
    }

    public void setCantEstantes(int cantEstantes) {
        this.cantEstantes = cantEstantes;
    }

    public int getCantLibros() {
        return cantLibros;
    }

    public void setCantLibros(int cantLibros) {
        this.cantLibros = cantLibros;
    }
    
    //b) Implemente los siguientes métodos:
    //- almacenarLibro: recibe un libro, un nro. de estante y nro. de lugar válidos y guarda al
//libro en la estantería. Asuma que dicho lugar está disponible.
    
    public void almacenarLibro(Libro unLibro, int nroEstante,int nroLugar) {
        if ((nroEstante >= 0 && nroEstante <= cantEstantes)  && (nroLugar >= 0 && nroLugar <= cantLibros)) {
            matrizLibros[nroEstante][nroLugar] = unLibro;
        }
        else {
            System.out.println("El numero de estante ingresado no esta dentro del rango de estantes o el nro de lugar de libro ingresado no esta dentro del rango de libros");
        }
        
    }
    
    // sacarLibro: recibe el título de un libro, y saca y devuelve el libro con ese título, quedando
//su lugar disponible. Tenga en cuenta que el libro puede no existir.
    
    public Libro sacarLibro(String unTitulo) {
        boolean ok = false;
        Libro libroBuscado = null;
        
        int i=0, j =0;
  
        while (i < cantEstantes && !ok) {
            while (j<cantLibros && !ok) {
                ok = matrizLibros[i][j] != null && matrizLibros[i][j].getTitulo().equals(unTitulo);
                
                if (ok){
                    libroBuscado = matrizLibros[i][j];  // le paso un objeto 
                    //"limpio la matriz"
                    matrizLibros[i][j] = null;
                }
                else {
                    j++;
                }
            }
            j = 0;
            i++;
        }
        return libroBuscado;
    }
    
    //- calcular: calcula y devuelve el libro más pesado de la estantería.
    public Libro calcular() {
        Libro otroLibro= new Libro("","",-1);
  
        for (int i = 0; i< cantEstantes;i++) {
            for(int j = 0; j< cantLibros; j++) {
                if (matrizLibros[i][j] != null && matrizLibros[i][j].getPesoLibro() > otroLibro.getPesoLibro()) {
                    otroLibro = matrizLibros[i][j];
                }
            }
        }
        /*
        for (int j=0;j<cantEstantes;j++) {
            while (i<cantLibros ) {
                if (matrizLibros[i][j] != null &&  matrizLibros[i][j].getPesoLibro() > max){
                    max = matrizLibros[i][j].getPesoLibro();
                    otroLibro = matrizLibros[i][j];
                }
                i++;
            }
        }
        if (otroLibro == null) {
            System.out.println("No habia libros en la estanteria");
        }
        return otroLibro;
        */
        
        
        
        return otroLibro;
    }

    @Override
    public String toString() {
        return "Estante{"  + ", cantEstantes=" + cantEstantes + ", cantLibros=" + cantLibros + '}';
    }
    
    
}
