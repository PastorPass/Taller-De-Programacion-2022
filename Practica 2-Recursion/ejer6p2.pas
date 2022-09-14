{6.- Realizar un programa que lea números y que utilice un procedimiento recursivo que escriba el equivalente en
binario de un número decimal. El programa termina cuando el usuario ingresa el número 0 (cero).  

Ayuda:  Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la próxima llamada recursiva?
Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.  }

Program uno;

Procedure ConversionDecimalaBinario(num : integer);
var
  resto : integer;
Begin
  if (num <> 0) then begin
    resto := num MOD 2;
    ConversionDecimalaBinario(num DIV 2);
  end;
  write(resto);
  write();
End;

Procedure LeerNumero();
var
  num : integer;
Begin
  writeln('ingrese un numero');
  readln(num);
  while (num <> 0) do begin
    ConversionDecimalaBinario(num);
    writeln(' ingrese otro numero');
    readln(num);
  end;
End;


//P.P
var
  num : integer;
BEGIN
  LeerNumero();
END.