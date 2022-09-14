{3.- Escribir un programa que: 

a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. 
Finalizar con el número 0. 

b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.  

c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.  

d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra 
en la lista o falso en caso contrario. }

Program uno;
const  
  fin = 0;  //condicion de corte para terminar la carga de la lista de numeros
type
  rango = fin..99;

Lista =^nodo;
nodo = record
            dato : rango;
            sig : Lista;
      end;

//Procesos-Funciones

Procedure AgregarAdelante(var L : Lista; num : integer);
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato := num;
  aux^.sig := L;
  L := aux;
End;

Procedure CargarLista(var L : Lista);
var
  num : integer;
Begin
  num := random(100);
  writeln('Numero : ' , num);
  
  if (num <> fin) then begin
    AgregarAdelante(L,num);
    CargarLista(L^.sig);
  end;
End;

Function MinimoEnLista(L : Lista; min : integer) : integer;

Begin
  if (L = nil) then 
    MinimoEnLista := min
  else begin 
    if(L^.dato < min) then 
      min := L^.dato;
    //Debajo del if 
    {L := L^.sig;    //De una forma mas basica 
    MinimoEnLista := MinimoEnLista (L,min);  //Donde le pasaria L simplemente ya que hice la operacion de avanzar en la lista (L := L^.sig)}

    MinimoEnLista := MinimoEnLista (L^.sig,min);
  end;
End;

Function MaximoEnLista(L : Lista; max : integer) : integer;
Begin
  if (L = nil) then 
    MaximoEnLista := max
  else begin
    if (L^.dato > max) then 
      max := L^.dato;
    MaximoEnLista := MaximoEnLista(L^.sig,max);
  end;
End;

Function Buscar(L : Lista; valor : integer) : boolean;
Begin
  if (L = nil) then 
    Buscar := false
  else begin
    if (L^.dato = valor) then 
      Buscar := true
    else
      Buscar := Buscar (L^.sig,valor);
    
    //1era solucion hecha
  {  if(L^.dato <> valor) or (Buscar = false) then 
      Buscar := Buscar(L^.sig,valor);
      
    if (L^.dato = valor) then 
      Buscar := true;
    //  Buscar := true;
    //Buscar := Buscar(L^.sig,valor);   }
    
  end;
End;

//P.P
VAR
  L : Lista;
  min,max,valor : integer;
BEGIN
  randomize;
  CargarLista(L);  //Recursivo
  min := 999;  max := -1;
  writeln('El minimo de la lista es : ' , MinimoEnLista(L,min));  //Recursivo
  writeln('El maximo de la lista es : ' , MaximoEnLista(L,max));  //Recursivo
  
  writeln('ingrese valor a buscar en la lista');
  readln(valor);
  if (Buscar(L,valor)) then 
    writeln('V')
  else 
    writeln('F')
END.