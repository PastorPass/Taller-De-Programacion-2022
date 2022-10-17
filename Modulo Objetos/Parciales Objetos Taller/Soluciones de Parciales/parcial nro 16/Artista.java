/*
 1- Una galería de arte quiere reunir información de sus artistas en un catálogo. El catálogo
almacena a lo sumo 15 artistas. De los artistas se registra nombre artístico y el nombre de
su obra exhibida.

a) Genere las clases necesarias. Provea constructores para iniciar: el catálogo (sin
artistas); los artistas a partir de toda su información.
 */
package Parciales;

public class Artista {
    private String nombreArtistico,nombreObra;
    
    public Artista(String unNombreA,String unNombreO) {
        nombreArtistico = unNombreA;
        nombreObra = unNombreO;
        
    }

    public String getNombreArtistico() {
        return nombreArtistico;
    }

    public void setNombreArtistico(String nombreArtistico) {
        this.nombreArtistico = nombreArtistico;
    }

    public String getNombreObra() {
        return nombreObra;
    }

    public void setNombreObra(String nombreObra) {
        this.nombreObra = nombreObra;
    }
    
    
}
