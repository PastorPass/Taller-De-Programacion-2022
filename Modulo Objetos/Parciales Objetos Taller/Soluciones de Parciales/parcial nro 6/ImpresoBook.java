/*
1) Queremos representar libros electrónicos e impresos. De cualquier libro se conoce:
título, precio base y el nombre de los autores (a lo sumo 8). Adicionalmente: los libros
electrónicos tienen el formato (ej: “.pdf”, “.epub”) y su tamaño en MB; mientras que los
libros impresos registran si es tapa dura o no.
 */
package Parciales;


public class ImpresoBook extends Libro2{
    private boolean tapaDura; 
        
    public ImpresoBook (String unTitulo,int unPrecio,boolean siTapaDura) {
        super(unTitulo,unPrecio);
        setTapaDura(siTapaDura);  // true : si tiene tapa dura, false en caso contrario
        
    }
    
 
            

    public boolean isTapaDura() {
        return tapaDura;
    }

    public void setTapaDura(boolean tapaDura) {
        this.tapaDura = tapaDura;
    }
    
    
      //ii- Obtener el precio final del libro teniendo en cuenta que: 

//- Para los libros electrónicos es el precio base al que se adiciona un impuesto de
//descarga de 2,5$ por MB.
//- Para los libros impresos es el precio base al que se adiciona 500$ si es de tapa dura.
    
    @Override
    public double obtenerPrecioFinal() {
        double aux = getPrecio();  // inicializo con el precio base
        if (isTapaDura() == true) {
            aux = aux + 500;
        }
        return aux;
    }

    @Override
    public String toString() {
        return "ImpresoBook{" + "tapaDura=" + tapaDura + '}';
    }
    //iii-Obtener la representación String del libro, la cual se compone de título, precio final y
//nombre de sus autores.
    //Ya que no puedo acceder al to string de la super clase(porque se tiene que instanciar, y como es una clase abstracta no se puede), debo crear to string distintas para cada sublaclase de la misma
    @Override
    public String cadenaAutores() {
        String aux = "";
        
        for (int i = 0; i < getDimL(); i++) {
            aux = aux + "nombre de autor : " + getVectorAutores()[i]+ "\n";
            
        }
        return aux;
    }
    
    
}
