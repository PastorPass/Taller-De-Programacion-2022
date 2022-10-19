/*
26)
1- Queremos representar compras minoristas y mayoristas. De cualquier compra se
conoce: nro. y los productos comprados (como máximo N). De cada producto registra:
código, precio mayorista y precio minorista. Además: las compras mayoristas tienen el
CUIT del comprador; y las minoristas si el comprador es jubilado.
a- Genere las clases necesarias. Provea constructores para iniciar las compras a partir de
toda su información, para una cantidad máxima de N productos comprados y sin
productos cargados.
b- Implemente métodos en las clases que corresponda para permitir:
i- Agregar a la compra un producto que se recibe. Asuma que hay espacio.
ii- Obtener el precio a pagar por el i-ésimo producto de la compra sabiendo que: para las
compras minoristas el precio a pagar por dicho producto es el precio minorista
descontando 10% si es jubilado y para las compras mayoristas es el precio mayorista
descontando 21% de IVA. Asuma que “i” es válido y se recibe.
iii- Obtener la representación String de la compra siguiendo el ejemplo:
“Nro:… , Productos comprados (código y precio pagado por el producto):…Total pagado:
…”
2) Realice un programa que instancie una compra mayorista y una minorista. Cargue 3
productos a cada compra. Para finalizar, muestre la representación String de cada
compra.

//aca es donde entendi que a ambas clases compra mayorista y compra minorista se le debe crear
otras variables de instancia como una dimL,una dimF, y un vector de esa clase, 
para luego hacer un metodo abstracto agregarProducto en la superclase compra y desarrollarse en cada
subclase.
__________
 */
package Parciales;

import PaqueteLectura.GeneradorAleatorio;


public class parcial26 {


    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        CompraMayorista cm = new CompraMayorista(10,6,444);
        CompraMinorista cmn = new CompraMinorista(11,4,true);
        
        Producto p;
        for (int i = 0; i < 3; i++) {
            p = new Producto (GeneradorAleatorio.generarInt(111),GeneradorAleatorio.generarDouble(333),GeneradorAleatorio.generarDouble(444));
            cm.agregarCompra(p);
            cmn.agregarCompra(p);
        }
        System.out.println("Mayorista : " + cm.toString());
        System.out.println("Minorista : " + cmn.toString());
    }
    
}
