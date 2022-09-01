{1.- Implementar un programa que invoque a los siguientes módulos. 

a. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y los almacene
en un vector con dimensión física igual a 10. 

b. Implementar un módulo que imprima el contenido del vector. 

c. Implementar un módulo recursivo que imprima el contenido del vector. 

d. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne 
la cantidad de caracteres leídos.  
El programa debe informar el valor retornado. 

e. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una 
lista con los caracteres leídos. 

f. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en el mismo 
orden que están almacenados. 

g. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en orden 
inverso al que están almacenados. }

Program uno;
const
  dimF = 10;
type
  rango = 1..dimF;
  vector = array[rango] of char;


  //para el inciso e)
  Lista = ^nodo;
  nodo = record
            dato : char;
            sig : Lista;
         end;
//Procesos- Funciones

Procedure CargarVectorRecursivo(var vec : vector; var dimL : integer);
var
  caracter: char;
Begin
  writeln('Ingrese un caracter');
  readln(caracter);
  if (caracter <> '.') and (dimL < dimF) then begin  //se cambia el while por el if
    dimL := dimL + 1;
    vec[dimL] := caracter;
    CargarVectorRecursivo(vec,dimL);
  end;
End;

Procedure ImprimirVector(vec : vector; dimL : integer);
var
  i : integer;
Begin
  for i := 1 to dimL do 
    writeln('Posicion nro ', i, 'Elemento = ' , vec[i]);
End;

Procedure ImprimirVectorRecursivo(vec : vector;dimL : integer);
Begin
  if (dimL > 0) then begin
    writeln('Posicion nro:  ' , dimL , ' Elemento = ' , vec[dimL]);
    dimL := dimL -1;
    ImprimirVectorRecursivo(vec,dimL);
  end;
End;

Function ContadorCaracteres(cant : integer) : integer;
var
  caracter : char;
Begin
  writeln('Ingrese un caracter');
  readln(caracter);
  if(caracter <> '.') then
    ContadorCaracteres :=  ContadorCaracteres(cant)+1;
//else 
  //ContadorCaracteres := 0;
End;

Procedure AgregarAdelante(var L : Lista; caracter : char);
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato := caracter;
  aux^.sig := L;
  L := aux;
End;


Procedure RetornarLista(var L : Lista);
var
  caracter : char;
Begin
  writeln('Ingrese un caracter');
  readln(caracter);
  if(caracter <> '.') then begin
    AgregarAdelante(L,caracter);
    RetornarLista(L^.sig);
  end;
End;

Procedure ImprimirLista(L : Lista);
Begin
  if(L <> nil) then begin
    writeln('Elemento = ' , L^.dato);
    ImprimirLista(L^.sig);
  end;
End;

Procedure ImprimirListaOrdenInverso(L : Lista);
Begin
  if (L <> nil) then begin
    ImprimirListaOrdenInverso(L^.sig);
    writeln('Elemento = ' , L^.dato);
  end;
End;

//P.P
VAR
  vec : vector;
  dimL,cant : integer;
  L : Lista;
BEGIN
  L := nil;
  {dimL := 0;  cant := 0;
  CargarVectorRecursivo(vec,dimL);  //Inciso a)
  ImprimirVector(vec,dimL);  // inciso b)
  writeln('IMPRESION RECURSIVA');
  ImprimirVectorRecursivo(vec,dimL);  //inciso c) 
  writeln('Lea una secuencia de caracteres hasta ingresar un punto ' ,ContadorCaracteres(cant));  //inciso d }  //recursividad
  writeln('Carga de lista');
  RetornarLista(L);  //con recursion
  ImprimirLista(L);  //con recursion
  writeln('Impresion de lista en orden inverso');
  ImprimirListaOrdenInverso(L);
END.