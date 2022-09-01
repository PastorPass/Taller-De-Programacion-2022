{2.- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número leído,
sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo recursivo que reciba 
el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe imprimir 2  5  6 }

Program uno;
const
  fin = 0;
//Procesos- Funciones

Procedure ImprimoNumero(num : integer);
Begin
  if (num <> fin) then begin
    ImprimoNumero(num DIV 10);
    writeln(num MOD 10);
  end;
End;

Procedure LeoNumeros();
var
  num : integer;
Begin
  writeln('Ingrese un numero');
  readln(num);
  if(num <> fin) then begin
    ImprimoNumero(num);
    LeoNumeros();
  end;
End;

//P.P
BEGIN
  LeoNumeros();
END.