/*
 De cada subsidio se conoce: el monto pedido, el motivo y si fue
otorgado o no.

c. Un subsidio sólo debería poder construirse con el monto pedido y el motivo.
Un subsidio siempre se crea en estado no-otorgado.
 */
package tema5;

public class Subsidio  {
    private double montoPedido;
    private String motivo;
    private boolean otorgado;  
    
    
    
    public Subsidio(double unMontoPedido, String unMotivo) {
        montoPedido = unMontoPedido;
        motivo = unMotivo;
        otorgado = false;
    }

    public double getMontoPedido() {
        return montoPedido;
    }

    public void setMontoPedido(double montoPedido) {
        this.montoPedido = montoPedido;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public boolean isOtorgado() {
        return otorgado;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
}
