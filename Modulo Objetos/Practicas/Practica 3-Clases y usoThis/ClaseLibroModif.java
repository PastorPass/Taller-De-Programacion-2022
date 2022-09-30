/*
Clase Libro a la cual se agregaron constructores. 
 */
package tema3;

public class Libro {
   private String titulo;
   //private String primerAutor; 
   private String editorial;
   private int añoEdicion;
   private String ISBN; 
   private double precio; 
   
   //Modificacion para el ejercicio
   private Autor autor;
     
    
    public Libro(  String unTitulo,  String unaEditorial, 
    int unAñoEdicion,  Autor unAutor, String unISBN, double unPrecio){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= unAñoEdicion;
         
         //primerAutor = unPrimerAutor;
         //*
         autor = unAutor;
         ISBN =  unISBN;
         precio = unPrecio;
    }
    
    /*
    public Libro(  String unTitulo,  String unaEditorial, String unPrimerAutor, String unISBN){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= 2015;
       //  primerAutor = unPrimerAutor;
         ISBN =  unISBN;
         precio = 100;
    }
    */
    public Libro(){
   
    }
        
    public String getTitulo(){
        return titulo;
    }
  
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }
  
    /*
    public String getPrimerAutor(){
        return primerAutor;
    } 
    */
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
   
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
   
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAñoEdicion(int unAño){
         añoEdicion = unAño;
    }
    /*
    public void setPrimerAutor(String unPrimerAutor){
         primerAutor=unPrimerAutor;
    } 
    */
    public void setISBN(String unISBN){
         ISBN=unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio=unPrecio;
    }

    //Genero getter y setter
    public Autor getAutor() {
        return autor;
    }

    public void setAutor(Autor autor) {
        this.autor = autor;
    }

    @Override
    public String toString() {
        return "Libro{" + "titulo=" + titulo + ", editorial=" + editorial + ", a\u00f1oEdicion=" + añoEdicion + ", ISBN=" + ISBN + ", precio=" + precio + ", autor=" + autor + '}';
    }
}
