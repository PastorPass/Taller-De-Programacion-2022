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


public class parcial16 {


    public static void main(String[] args) {
        Catalogo c = new Catalogo();
        
        Artista a = new Artista("sir arthur", "1001");
        c.agregarArtista(a);
        
        Artista a1 = new Artista("sss","el grito");
        c.agregarArtista(a1);
        
        a = c.devolverArtista("el grito");
        if (a != null) {
            System.out.println("nombre artistico del creador de la obra el grito : " + a.getNombreArtistico());
        }
        else {
            System.out.println("No se encuentra tal artista con tal obra");
        }
    }
    
}
