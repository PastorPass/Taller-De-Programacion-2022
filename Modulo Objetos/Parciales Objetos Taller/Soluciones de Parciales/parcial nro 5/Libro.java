/*
 Un libro posee título, nombre
de su primer autor y peso.

Provea constructores para iniciar: los libros a partir de toda su información;
 */
package Parciales;

public class Libro {
    private String titulo,nombrePrimerAutor;
    private double pesoLibro;
    
    public Libro(String unTitulo, String unNombrePa,double unPeso) {
        titulo = unTitulo;
        nombrePrimerAutor= unNombrePa;
        pesoLibro = unPeso;
        
    }
    public Libro() {
        
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getNombrePrimerAutor() {
        return nombrePrimerAutor;
    }

    public void setNombrePrimerAutor(String nombrePrimerAutor) {
        this.nombrePrimerAutor = nombrePrimerAutor;
    }

    public double getPesoLibro() {
        return pesoLibro;
    }

    public void setPesoLibro(double pesoLibro) {
        this.pesoLibro = pesoLibro;
    }

    public String toStringLibro() {
        return "Libro{" + "titulo=" + titulo + ", nombrePrimerAutor=" + nombrePrimerAutor + ", pesoLibro=" + pesoLibro + '}';
    }
    
    
            
}
