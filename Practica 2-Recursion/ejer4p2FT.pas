{4.- Escribir un programa que: 

a. Implemente un módulo recursivo que genere un vector de 20 números enteros “random” mayores a 0 y menores a 100.  

b. Implemente un módulo recursivo que devuelva el máximo valor del vector.  

c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en el vector. }

Program uno;
const
  tope = 20;
type
  rango = 1..tope;
  vector = array[rango] of integer;


//Procesos- Funciones 
Procedure CargarVector(var vec : vector; var dimL : integer);
var
  num: integer;
Begin
  num := random(99);
  if (dimL< tope) then begin
    dimL := dimL + 1;
    vec[dimL] := num;
    CargarVector(vec,dimL);
  end;
End;

Procedure ImprimirVector(vec : vector; dimL : integer);
var
  i : integer;
Begin
  for i := 1 to dimL do 
    writeln('Elemento = ' , vec[i]);
End;

//P.P
VAR
  vec : vector;
  dimL : integer;
BEGIN
  randomize;
  dimL := 0;
  CargarVector(vec,dimL);  //carga de manera recursiva
  ImprimirVector (vec,dimL);  //de manera recursiva
END.