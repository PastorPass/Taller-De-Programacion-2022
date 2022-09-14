{2.- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número leído, 
sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo recursivo que reciba el 
número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe imprimir 2  5  6 }

Program uno;

//Procesos - Funciones
Procedure ImprimirNumero(num : integer);
var
  aux : integer;
Begin
  if (num <> 0) then begin
    aux := num MOD 10;
    num := num DIV 10;
    
    ImprimirNumero(num);
    writeln(aux);  //Para que imprima en el orden en que fue ingresado el numero
  end;
End;

//P.P
VAR
  num : integer;
BEGIN
  writeln('ingrese un numero');
  readln(num);
  ImprimirNumero(num); //Recursivo
END.
