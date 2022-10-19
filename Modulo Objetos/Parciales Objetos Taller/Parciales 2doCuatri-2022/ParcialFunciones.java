/*
3- Realice un programa que instancie una función de teatro. Ocupe distintas butacas. Compruebe el
correcto funcionamiento de los métodos implementados. 

 */
package Parciales;

public class ParcialFunciones {

    public static void main(String[] args) {
        Funcion f = new Funcion("ttt","2342",22,5,5);
        
        Butaca b = new Butaca(2,3);
        f.ocuparButaca(2, 3,b);
        b = new Butaca(1,1);
        f.ocuparButaca(1, 1,b);
        b = new Butaca(0,1);
        f.ocuparButaca(0, 1,b);
        
        System.out.println(f.cadena(2));
        System.out.println("Impresion de todas las butacas : " + f.toString());
    }
    
}
