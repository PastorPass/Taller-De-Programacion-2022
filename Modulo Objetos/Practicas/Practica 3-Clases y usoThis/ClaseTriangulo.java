/*
1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el 
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String). 
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para: 
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
 */
package tema3;

public class Triangulo {
    private double lado1,lado2,lado3;
    private String colorRelleno,colorBorde;
    
    //Inicializo 
    Triangulo() {
    }
    
    public double getLado1() {
        return lado1;
    }
    
    public void setLado1 (double lado1){
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorBorde() {
        return colorBorde;
    }

    public void setColorBorde(String colorBorde) {
        this.colorBorde = colorBorde;
    }

    public Triangulo(double lado1, double lado2, double lado3, String colorRelleno, String colorBorde) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.colorRelleno = colorRelleno;
        this.colorBorde = colorBorde;
    }
    
     //FIXME me conviene usar los getters?
    public double calcularPerimetro() {
        return this.getLado1() + this.getLado2() + this.getLado3();
    }
    
    //FIXME me conviene acceder directamente a las variables de instancia?
    public double calcularArea() {
        double s;
        s = (double)(lado1 + lado2 + lado3) / 2;
        return Math.sqrt( s * (s -lado1) * (s - lado2) * (s - lado3));        
    }
    
    
    //Metodos creados sin impotancia alguna en los ejercicios, es para probar
    @Override
    public String toString(){
        String aux;
        aux= "El perimetro del triangulo es : " + this.calcularPerimetro() + "y su area es : " + this.calcularArea();
       return (aux);  //Retorna solo un valor
    }
    public String toCadena(){
        String aux1;
        aux1= "Lado 1 : " + this.getLado1()+ ", lado 2:  " + this.getLado2() + " ,lado 3 : " + this.getLado3();
       return (aux1);  //Retorna solo un valor
    }
}
