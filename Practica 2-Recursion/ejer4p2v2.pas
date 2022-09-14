{4.- Escribir un programa que: 

a. Implemente un módulo recursivo que genere un vector de 20 números enteros “random” mayores a 0 y menores a 100.  

b. Implemente un módulo recursivo que devuelva el máximo valor del vector.  

c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en el vector. }

Program uno;
const  
  dimF = 20;
type
  rango = 1..dimF;

  vector = array[rango] of integer;
  
//Procesos - Funciones
Procedure CargarVector(var vec : vector;aux : integer);  //no necesitamos una dimL, ya que se carga todo el vector
var
  num: integer;
Begin
  if (aux <=20) then begin
    num := 1+ random(99);  //1+ random(99) : no genera el numero 0 y tampoco el 100
    writeln('numero = ' ,num);
    vec[aux] := num;
    aux := aux+1;
    CargarVector(vec,aux);
  end;
End;
 
Function MaximoValor(vec : vector;max,aux : integer) : integer;
Begin
  if (aux < dimF) then begin
    if (vec[aux] > max) then 
      max := vec[aux];

    aux := aux +1;
    MaximoValor := MaximoValor(vec,max,aux);
  end
  else
    MaximoValor := max;
End;

Function SumaElementosEnVector (vec : vector; aux : integer) : integer;
Begin
  if (aux = 0) then  //En caso de que el vector no se haya cargado con una dimL
    SumaElementosEnVector := 0
  else 
    SumaElementosEnVector := SumaElementosEnVector(vec,aux-1) + vec[aux] ;
End;

//P.P
VAR
  vec : vector;
  aux,max : integer;
BEGIN
  randomize;
  aux := 1;
  CargarVector(vec,aux);  //Recursivo y carga completa (no se requiere una dimL,solo un auxiliar que sirve como copia)
  max := -1;
  writeln('El maximo valor del vector = ' , MaximoValor(vec,max,aux));
  
  //En este caso asumo que el vector esta cargado y que su dimL = dimF es 20, sino tendria que pasar una dimL x ref
  aux := 20;  //Va a ir restandose la dimL para la suma en el proximo modulo
  writeln('La suma de los elementos del vector de numeros es : ' , SumaElementosEnVector(vec,aux));
END.