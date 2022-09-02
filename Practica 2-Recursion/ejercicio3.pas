{3.- Escribir un programa que: 

a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. 
Finalizar con el número 0. 

b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.  

c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.  

d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista 
o falso en caso contrario.}

Program uno;
const
  fin = 0;
type
  rango = 1..99;
  Lista = ^nodo;
  nodo = record
            dato : rango;
            sig : Lista;
         end;

Procedure AgregarAdelante(var L : Lista; num : integer);
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato := num;
  aux^.sig := L;
  L := aux;
End; 

Procedure GenerarLista(var L : Lista);
var
  num : integer;
Begin
  num := random(10);
  writeln('Numero RANDOM = ' , num);
  if (num <> fin) then begin
    AgregarAdelante(L,num);
    GenerarLista(L^.sig);
  end;
End;


Procedure ImprimirLista(L : Lista);
Begin
  if (L <> nil) then begin
    writeln('Elemento = ' , L^.dato);
    ImprimirLista(L^.sig);
  end;
End;

Function ValorMinimoEnLista(L : Lista) : integer;
var
  min : integer;
Begin
  if(L = nil) then
    ValorMinimoEnLista := 99  // son valores ramdom de 0 a 99
  else begin
    min := ValorMinimoEnLista(L^.sig);
    if(min < L^.dato) then
      ValorMinimoEnLista := min
    else
      ValorMinimoEnLista := L^.dato;
  end;
End;

Function valorMaximoEnLista (L : Lista) : integer;
var
  max : integer;
Begin
  if (L = nil) then
    valorMaximoEnLista := 0
  else begin
    max := valorMaximoEnLista(L^.sig);
    if(max > L^.dato) then
      valorMaximoEnLista := max
    else
      valorMaximoEnLista := L^.dato;
  end;
End;

Function SeEncuentra(Unvalor : integer; L : Lista) : boolean;
Begin
  if(L = nil) then
    SeEncuentra := false
  else begin
    if (L^.dato <> Unvalor) then
      SeEncuentra := SeEncuentra(Unvalor,L^.sig)
    else
      SeEncuentra := true;
  end;
End;

//Una forma mas acotada
{
Function SeEncuentra(Unvalor:integer ; L : Lista) :boolean;
Begin
  if(L <> nil) and (L^.dato <> Unvalor) then 
    SeEncuentra:=SeEncuentra(Unvalor,L^.sig)
  else
    SeEncuentra:= (L<>nil);
end;}

//P.P
VAR
  L : Lista;
  valor : integer;
BEGIN
  L := nil;
  randomize;  //Funciona mejor si el randomize esta declarado en el p.p
  GenerarLista(L);  //inciso a)
  ImprimirLista(L);  //Para verificar impresion de la lista
  
  writeln('El elemento minimo de la lista = ' , ValorMinimoEnLista(L));  //Modulo recursivo, inciso b
  writeln('El elemento maximo de la lista = ' , valorMaximoEnLista(L));  //Modulo recursivo, inciso c
  
  writeln('ingrese valor a buscar en la lista');  //inciso d)
  readln(valor);
  if (SeEncuentra(valor,L)) then
    writeln('Se encuentra el valor : ' , valor, ' En la lista')
  else
    writeln('NO se encuentra el valor : ' , valor, ' En la lista');
END.