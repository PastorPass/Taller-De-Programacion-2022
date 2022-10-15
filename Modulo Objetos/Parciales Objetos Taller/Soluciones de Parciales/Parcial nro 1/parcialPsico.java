/*
1) Un psicólogo necesita un sistema para organizar su agenda semanal. El sistema
mantiene para c/u de los 5 días de atención y c/u de los 6 turnos (horarios) del día, la
información del paciente que tomó el turno. De los pacientes guarda: nombre, si tiene
obra social y costo a abonar por la sesión.
a)Genere las clases necesarias. Implemente constructores para iniciar: el sistema sin
pacientes; los pacientes a partir de toda su información.
b)Lea atentamente y luego implemente métodos que permitan:
- Agendar al paciente P en un día D y turno T. Asuma que el turno está libre. D y T son
válidos.
- Dado el nombre de un paciente, liberar todos sus turnos.
- Dado un día D y el nombre de un paciente, devolver si el paciente tiene agendado un
turno ese día. Asuma que D es válido.
c) Realice un programa que instancie el sistema. Cargue varios pacientes al sistema.
Libere turnos agendados. Para finalizar, imprima el resultado del inciso b.iii

 */
package Parciales;

import PaqueteLectura.GeneradorAleatorio;

public class parcial1 {

    public static void main(String[] args) {
        SistemaPsico s = new SistemaPsico();
        
        Paciente p;
        int i,j;
        
        for (i=0;i<6;i++) {
            for (j=0;j<5;j++) {
                p= new Paciente(GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarBoolean(),GeneradorAleatorio.generarInt(500)+500);
                if (GeneradorAleatorio.generarBoolean())
                    s.agendarPaciente(p, j, j);
            }
        }
        Paciente p2= new Paciente("nicolas",GeneradorAleatorio.generarBoolean(),GeneradorAleatorio.generarInt(500)+500);
        s.agendarPaciente(p2,3,3);
        
        if(s.liberarTurnos("nicolas") == true) {
            System.out.println("Se eliminaron todos los turnos");
        }
        System.out.println("Sistema :" + s.toString());
        
        
        
    }
    
}
