
package Parciales;

public abstract class Libro2 {
    private String titulo;
    private int precio;
    private String []vectorAutores;
    private int dimL,dimF;
    
    public Libro2(String unTitulo, int unPrecio) {
        titulo = unTitulo;
        vectorAutores = new String [8];
        precio = unPrecio;
        dimF = 8;
        dimL = 0;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }

    public int getDimF() {
        return dimF;
    }

    public void setDimF(int dimF) {
        this.dimF = dimF;
    }
   

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }
    

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String[] getVectorAutores() {
        return vectorAutores;
    }

    public void setVectorAutores(String[] vectorAutores) {
        this.vectorAutores = vectorAutores;
    }
    
    //i- Agregar al libro un autor cuyo nombre se recibe. Asuma que hay espacio.

    public void agregarLibroConAutor(String unAutor) {
        //no pregunto si la dimL es menor que la dimF
        vectorAutores[dimL] = unAutor;
        dimL++;
    }
    
    //ii- Obtener el precio final del libro teniendo en cuenta que: 

//- Para los libros electrónicos es el precio base al que se adiciona un impuesto de
//descarga de 2,5$ por MB.
//- Para los libros impresos es el precio base al que se adiciona 500$ si es de tapa dura.
    
    public abstract double obtenerPrecioFinal();
    public abstract String cadenaAutores();

    //iii-Obtener la representación String del libro, la cual se compone de título, precio final y
//nombre de sus autores.
    
    /*
    @Override
    public String toString() {
        String aux = "";
        
        for (int i = 0; i < dimL; i++) {
            aux = aux + " nombre de autor : " + vectorAutores[i]+ "\n";
            
        }
        return "Libro2{" + "titulo=" + titulo + ", precio final =" + obtenerPrecioFinal() + aux;
    }
    */

    
            
}
