{1.- Implementar un programa que invoque a los siguientes módulos. 

a. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y los almacene 
en un vector con dimensión física igual a 10. 

b. Implementar un módulo que imprima el contenido del vector. 

c. Implementar un módulo recursivo que imprima el contenido del vector. 

d. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la 
cantidad de caracteres leídos.  

El programa debe informar el valor retornado. 

e. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una lista
con los caracteres leídos. 

f. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en el mismo orden 
que están almacenados. 

g. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en orden
inverso al que están almacenados. }

Program uno;
type
  vector = array[1..10] of char;
  
  Lista = ^nodo;
  nodo = record
            dato : char;
            sig : Lista;
         end;
  
Procedure CargarVector(var vec : vector; var dimL : integer);
var
  palabra : char;
Begin
  writeln('ingrese un caracter');
  readln(palabra);
  if (palabra <> '.') and (dimL < 10) then begin
    dimL := dimL +1;
    vec[dimL] := palabra;
    CargarVector(vec,dimL);
  end;
End;

  
Procedure ImprimirVector(vec : vector; dimL : integer);
var
  i : integer;
Begin
  for i := 1 to dimL do 
    writeln('caracter = ' , vec[i]);
End;
  
Procedure ImprimirRecursivo(vec : vector; dimL : integer);
Begin
  if (dimL > 0) then begin
    writeln(vec[dimL]);
    ImprimirRecursivo(vec,dimL-1);
  end;
End;
  
  
Procedure LeerCaracteres(var cant : integer);
var
  caracter : char;
Begin
  writeln('Ingrese un caracter');
  readln(caracter);
  if (caracter <> '.') then begin
    cant := cant +1;
    LeerCaracteres(cant);
  end;
End;

Procedure AgregarAlFinal2(var L,ult : Lista; unCaracter : char);
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato := unCaracter;
  aux^.sig := nil;
  if (L <> nil) then 
    ult^.sig := aux
  else
    L := aux;
  ult := aux;
End;

Procedure RecursividadCargaLista(var L,ult : Lista);
var
  caracter : char;
Begin
  writeln('ingrese un caracter');
  readln(caracter);
  if (caracter <>  '.') then begin 
    AgregarAlFinal2(L,ult,caracter);  
    RecursividadCargaLista(L,ult);
  end;
End;

Procedure ImprimirListaRecursividad(L : Lista);
Begin
  if (L <> nil) then begin
    writeln('caracter = ' , L^.dato);
    L := L^.sig;
    ImprimirListaRecursividad(L);
  end;
End;

Procedure ImprimirInverso(L : Lista);
Begin
  if (L <> nil) then begin
    ImprimirInverso(L^.sig);
    writeln('caracter = ' , L^.dato);
  end;
End;

//P.P
VAR
  vec : vector;
  dimL : integer;
  cant : integer;
  L,ult : Lista;
BEGIN
  dimL := 0;  cant := 0;
  L := nil;  ult := nil;
  //CargarVector(vec,dimL);  //Modulo recursivo
  //ImprimirVector(vec,dimL);  //Modulo comun
  //ImprimirRecursivo(vec,dimL);
 // LeerCaracteres(cant);
  //writeln('La cantidad de caracteres ingresados es : ' , cant);
  RecursividadCargaLista(L,ult);
  ImprimirListaRecursividad(L);
  writeln('Orden inverso en el que fue cargada la lista');
  ImprimirInverso(L);
END.