/*
 6)
1) Queremos representar libros electrónicos e impresos. De cualquier libro se conoce:
título, precio base y el nombre de los autores (a lo sumo 8). Adicionalmente: los libros
electrónicos tienen el formato (ej: “.pdf”, “.epub”) y su tamaño en MB; mientras que los
libros impresos registran si es tapa dura o no.
a) Implemente las clases del modelo con sus atributos y getters/setters adecuados.
Provea constructores para iniciar los libros a partir de toda su información y sin autores.
b) Agregue a las clases implementadas los métodos necesarios para incorporar la
siguiente funcionalidad:
i- Agregar al libro un autor cuyo nombre se recibe. Asuma que hay espacio.
ii- Obtener el precio final del libro teniendo en cuenta que: 

- Para los libros electrónicos es el precio base al que se adiciona un impuesto de
descarga de 2,5$ por MB.
- Para los libros impresos es el precio base al que se adiciona 500$ si es de tapa dura.
iii-Obtener la representación String del libro, la cual se compone de título, precio final y
nombre de sus autores.
 */
package Parciales;

public class Electronico extends Libro2{
    private String formato;
    private int tamañoMb;
    
    public Electronico(String unTitulo,int unPrecio,String unFormato,int unTamaño) {
        super(unTitulo, unPrecio);
        setFormato(unFormato);
        setTamañoMb(unTamaño);
        
    }
    

            
  

    public String getFormato() {
        return formato;
    }

    public void setFormato(String formato) {
        this.formato = formato;
    }

    public int getTamañoMb() {
        return tamañoMb;
    }

    public void setTamañoMb(int tamañoMb) {
        this.tamañoMb = tamañoMb;
    }
    
      //ii- Obtener el precio final del libro teniendo en cuenta que: 

//- Para los libros electrónicos es el precio base al que se adiciona un impuesto de
//descarga de 2,5$ por MB.
//- Para los libros impresos es el precio base al que se adiciona 500$ si es de tapa dura.

    @Override
    public double obtenerPrecioFinal() {
        double aux = 0;
        if (getPrecio()!= 0) {
            aux = getPrecio() + (2.5 * getTamañoMb());
        }
        return aux;
    }

    @Override
    public String toString() {
        return "Electronico{" + "formato=" + formato + ", tama\u00f1oMb=" + tamañoMb + '}';
    }
    
    @Override
    public String cadenaAutores() {
        String aux = "";
        
        for (int i = 0; i < getDimL(); i++) {
            aux = aux + "nombre de autor : " + getVectorAutores()[i]+ "\n";
            
        }
        return aux;
    }
    
}
