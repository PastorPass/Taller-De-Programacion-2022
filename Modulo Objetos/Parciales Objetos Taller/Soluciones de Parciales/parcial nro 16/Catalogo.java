/*
1- Una galería de arte quiere reunir información de sus artistas en un catálogo. El catálogo
almacena a lo sumo 15 artistas. De los artistas se registra nombre artístico y el nombre de
su obra exhibida.
a) Genere las clases necesarias. Provea constructores para iniciar: el catálogo (sin
artistas); los artistas a partir de toda su información.
b) Implemente los métodos necesarios, en las clases que correspondan, para permitir:
- Agregar un artista al catálogo. Asuma que hay espacio.
- Devolver al artista cuyo nombre de obra coincide con uno recibido.
2- Implemente un programa que instancie un catálogo y agreguele dos artistas. A partir del
catálogo: obtenga el artista de la obra “el grito” e imprima su nombre artístico. 
 */
package Parciales;

public class Catalogo {
    private Artista []vectorArtistas;
    private int dimL,dimF;
    
    public Catalogo() {
        vectorArtistas = new Artista[15];
        dimF = 15;
        dimL = 0;
    }

    public Artista[] getVectorArtistas() {
        return vectorArtistas;
    }

    public void setVectorArtistas(Artista[] vectorArtistas) {
        this.vectorArtistas = vectorArtistas;
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
    
    public void agregarArtista(Artista unArtista) {
        if (dimL <dimF) {
            vectorArtistas[dimL] = unArtista;
            dimL++;
        }
    }
    
    //- Devolver al artista cuyo nombre de obra coincide con uno recibido.
    
    public Artista devolverArtista(String unNombreObra) {
        Artista otroArtista = null;

        //se debe recorrer el vector de artistas con el campo del nombre de obra
        if (dimL != 0) {
            for (int i = 0; i < dimL; i++) {
                    if (vectorArtistas[i].getNombreObra().equals(unNombreObra)) {
                        otroArtista = vectorArtistas[i];
                    }
            }
           
        }
        return otroArtista;
        
    }
    
            
}
