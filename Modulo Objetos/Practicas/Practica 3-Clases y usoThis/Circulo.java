/*
5-A- Definir una clase para representar círculos. Los círculos se caracterizan por su radio
(double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
B- Realizar un programa que instancie un círculo, le cargue información leída de teclado e
informe en consola el perímetro y el área.
NOTA: la constante PI es Math.PI
 */
package tema3;

/**
 *
 * @author pastor
 */
public class Circulo {
    private double radio;
    private String colorDeLinea,colorDeRelleno;
    
    
    public Circulo () {
        
    }
    public Circulo (String unColorLinea, String unColorRelleno, double unRadio) {
        radio = unRadio;
        colorDeLinea = unColorLinea;
        colorDeRelleno = unColorRelleno;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getColorDeLinea() {
        return colorDeLinea;
    }

    public void setColorDeLinea(String colorDeLinea) {
        this.colorDeLinea = colorDeLinea;
    }

    public String getColorDeRelleno() {
        return colorDeRelleno;
    }

    public void setColorDeRelleno(String colorDeRelleno) {
        this.colorDeRelleno = colorDeRelleno;
    }
    
    public double calcularPerimetro () {
        return (double) 2 * Math.PI *getRadio();
    }
    
    public double calcularArea () {
        return (double) Math.PI * (getRadio()* getRadio());
    }
    
    // un toString para informar el calculo del circulo

    @Override
    public String toString() {
        return "Circulo{" + "radio=" + radio + ", colorDeLinea=" + colorDeLinea + ", colorDeRelleno=" + colorDeRelleno + '}';
    }
    
    
}
