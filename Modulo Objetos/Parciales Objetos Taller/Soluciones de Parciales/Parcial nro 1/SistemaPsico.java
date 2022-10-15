/*
1) Un psicólogo necesita un sistema para organizar su agenda semanal. El sistema
mantiene para c/u de los 5 días de atención y c/u de los 6 turnos (horarios) del día, la
información del paciente que tomó el turno. 

Implemente constructores para iniciar: el sistema sin
pacientes; 
 */
package Parciales;

public class SistemaPsico  {
    private Paciente [][] matrizTurnos; 
    
    public SistemaPsico() {
        matrizTurnos = new Paciente[6][5];  // 6 : turnos del dia  ; 5: dias de atencion
        
    }

    public Paciente[][] getMatrizTurnos() {
        return matrizTurnos;
    }

    public void setMatrizTurnos(Paciente[][] matrizTurnos) {
        this.matrizTurnos = matrizTurnos;
    }
    
    
    //b)Lea atentamente y luego implemente métodos que permitan:
//- Agendar al paciente P en un día D y turno T. Asuma que el turno está libre. D y T son
//válidos.
    public void agendarPaciente(Paciente unPaciente,int dia,int turno) {
        matrizTurnos[dia][turno] = unPaciente;
        
    }
    
    //- Dado el nombre de un paciente, liberar todos sus turnos.
    //duda : un mismo paciente puede tener distintos horarios y distintos dias? creo que si(lo que complicaria mas el codigo) lo tomo como que tiene asignado un solo turno y dia
    public boolean liberarTurnos(String unNombreP) {
        /*
        //Se debe de arreglar :/
        
        boolean ok = false;
        int i = 0,j =0;
        // Primero debo verificar que el paciente esta en la matriz de pacientes
        while (matrizTurnos[i][j] != null && !matrizTurnos[i][j].getNombre().equals(unNombreP) && i<6) {
            while (matrizTurnos[i][j] != null && !matrizTurnos[i][j].getNombre().equals(unNombreP) && j < 5) {
                j++;
            }
            j = 0;
            i++;
        }
        //verifico que encontre el paciente
        if (matrizTurnos[i][j] != null &&    matrizTurnos[i][j].getNombre().equals(unNombreP)) {
            ok = true;
            
            //libero todos sus turnos
            for (int k = 0; k < 6; k++) {
                matrizTurnos[k][i] = null;
                
            }
        }
        return ok;
        */
        //de otra forma
        
         int i=0; int j; boolean aux=true;
        
        for (j=0;j<5;j++) {
            while (i<6 && aux) {
                if (matrizTurnos[i][j]!=null && matrizTurnos[i][j].getNombre().equals(unNombreP)){
                    matrizTurnos[i][j]=null;
                    aux=false;
                }
                i++;
            }
        }
        return aux;

    }
    
    //- Dado un día D y el nombre de un paciente, devolver si el paciente tiene agendado un
//turno ese día. Asuma que D es válido.
    public String tieneAgendadoTurno(String unNombreP, int unDia) {
        String aux = "";
        int i = 0;
        boolean ok = true;
        while (!matrizTurnos[i][unDia].getNombre().equals(unNombreP) && ok && i < 6) {
            i++;
        }
        if (matrizTurnos[i][unDia].getNombre().equals(unNombreP)) {
            aux = "El paciente " + unNombreP + "tiene agendado un turno, el dia : " + unDia;
        }
        else {
            aux = "El paciente no tiene agendado ningun turno";
        }
        
        return aux;
        
    }
    
    @Override
    public String toString(){
        String aux= "";
        for (int i=0;i<6;i++) {
            for (int j=0;j<5;j++) {
                if (matrizTurnos[i][j]==null){
                    aux =aux + "----Libre----";
                }
                else {
                    aux=aux + "---"+matrizTurnos[i][j].toStringPaciente()+ "\n";
                }
            }
            aux=aux+"\n";
        }
        return aux;
    }
            
}
