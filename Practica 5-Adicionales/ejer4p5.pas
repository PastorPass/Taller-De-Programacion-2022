{4.- Un teatro tiene funciones los 7 días de la semana.   //IGUAL QUE EL EJERCICIO 4 DE LA PRACTICA 4
Para cada día se tiene una lista con las entradas vendidas.  

Se desea procesar la información de una semana. Se pide: 

a) Generar 7 listas con las entradas vendidas para cada día.
De cada entrada se lee día (de 1 a 7), código de la obra, asiento, monto. 
La lectura finaliza con el código de obra igual a 0. Las listas deben estar ordenadas por código de obra de forma ascendente. 

b) Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. 
Esta lista debe estar ordenada por código de obra de forma ascendente.  (MERGE ACUMULADOR)

c) Realice un módulo recursivo que informe el contenido de la lista generada en b)  }

Program uno;
const 
  finDia = 7;
  fin = 0;  //Condicion de corte para el codigo de obra
type
  rangoDias = 1..finDia;
  
  entrada = record
                dia : rangoDias;
                codObra : integer;
                asiento : 1..1200;
                monto : real;
            end;
  
  Lista =^nodo;
  nodo = record
            dato : entrada;
            sig : Lista;
         end;

  vectorListas = array[rangoDias] of Lista;
  
//b) Generar una nueva lista que totalice la cantidad de entradas vendidas por obra.
//Como la nueva lista solo solicita dos campos, genero un nuevo tipo de registro

  entrada2 = record
                cantEntradas : integer;
                codObra : integer;
             end;
  
  Lista2 = ^nodo2;
  nodo2 = record
            dato : entrada2;
            sig : Lista2;
          end;
  
//Procesos-Funciones

Procedure InicializarVectorListas(var vecL : vectorListas);
var
  i : rangoDias;
Begin
  for i := 1 to finDia do 
    vecL[i] := nil;
End;

Procedure LeerEntrada(var e : entrada);
Begin
  with e do begin
    writeln('Ingrese un codigo de obra');
    readln(codObra);
    if (codObra <> fin) then begin
      writeln('Ingrese un dia de la semana (1..7)');
      readln(dia);
      {writeln('Ingrese un asiento');
      readln(asiento);}
      asiento := 1+random(1200);
      {writeln('Ingrese un monto');
      readln(monto);}
      monto := 1+random(9999);
    end;
  end;
End;

Procedure Insertarordenado(var unaLista : Lista; e : entrada);
var
  ant,act,aux : Lista;
Begin
  new(aux);
  aux^.dato := e;
  act := unaLista;
  ant := unaLista;
  while (act <> nil) and (act^.dato.codObra < e.codObra) do begin
    ant := act;
    act := act^.sig;
  end;
  
  if(ant = act) then
    unaLista := aux
  else
    ant^.sig := aux;
  aux^.sig := act;
End;

Procedure CargarVectorListas(var vecL : vectorListas);
var
  e : entrada;
Begin
  InicializarVectorListas(vecL);
  LeerEntrada(e);
  while (e.codObra <> fin) do begin
    Insertarordenado(vecL[e.dia],e);  //Las listas deben estar ordenadas por código de obra de forma ascendente.
    LeerEntrada(e);
  end;
End;

Procedure Insertarordenado2(var L2: Lista2; e2 : entrada2);
var
  ant,act,aux : Lista2;
Begin
  new(aux);
  aux^.dato := e2;
  act := L2;
  ant := L2;
  while (act <> nil) and (act^.dato.codObra < e2.codObra) do begin
    ant := act;
    act := act^.sig;
  end;
  if (ant = act) then 
    L2 := aux
  else
    ant^.sig := aux;
  aux^.sig := act;
End;
 
{Procedure GenerarNuevaLista(vecL : vectorListas; var L : Lista2);
var
  i : rangoDias;
  cantE : integer;
  e2 : entrada2;
Begin
  for i := 1 to finDia do begin
    cantE := 0;
    while (vecL[i] <> nil) do begin
      cantE := cantE + 1;
      vecL[i] := vecL[i]^.sig;
    end;
    writeln('cant : ' , cantE);
    Asignacion(e2,vecL[i]^.dato.codObra,cantE);
    Insertarordenado2(L,e2);
  end;
End; }
 

Procedure MinimoAcumulador(var vecL : vectorListas; var codObraMin : integer);
var
  indiceMin,i : integer;
Begin
  codObraMin := 9999;
  indiceMin := -1;
  for i := 1 to finDia do begin
    if(vecL[i] <> nil) then begin
      if(vecL[i]^.dato.codObra <= codObraMin) then begin
        indiceMin := i;
        codObraMin := vecL[i]^.dato.codObra;
      end;
    end;
  end;
  
  if(indiceMin <> -1) then begin
    codObraMin := vecL[indiceMin]^.dato.codObra;
    vecL[indiceMin] := vecL[indiceMin]^.sig;
  end;
End;
 
Procedure Asignacion(unCodObra,unaCantEntradas : integer; var e2 : entrada2);
Begin
  e2.codObra := unCodObra;
  e2.cantEntradas := unaCantEntradas;
End;
 
Procedure MergeAcumulador(vecL : vectorListas; var L : Lista2);
var
  codObraMin,codObraActual : integer;
  cantTotalEntradas : integer;
  e2 : entrada2;
Begin
  MinimoAcumulador(vecL,codObraMin);
  while (codObraMin <> 9999) do begin
    codObraActual := codObraMin;
    cantTotalEntradas := 0;
    while (codObraMin <> 9999) and (codObraMin = codObraActual) do begin
      cantTotalEntradas := cantTotalEntradas + 1;  //Mientras leo el mismo codigo de obra, voy sumando +1 entrada
      MinimoAcumulador(vecL,codObraMin);
    end;
    Asignacion(codObraActual,cantTotalEntradas,e2);
    InsertarOrdenado2(L,e2);
  end;
End;

Procedure ImprimirLista(L2 : Lista2);
Begin
  if (L2 <> nil) then begin
    writeln('CANTIDAD DE ENTRADAS VENDIDAS : ' , L2^.dato.cantEntradas);
    writeln('CODIGO DE OBRA : ' , L2^.dato.codObra);
    writeln('--------------------------------------------------------');
    L2 := L2^.sig;
    ImprimirLista(L2);
  end;
End;
  
//P.P
VAR
  vecL : vectorListas;
  L2 : Lista2;
BEGIN
  randomize;
  L2 := nil;
  CargarVectorListas(vecL);
  MergeAcumulador(vecL,L2);
  writeln('----LISTA NUEVA CREADA ORDENADA X CODIGO DE OBRA----');
  ImprimirLista(L2); //Modulo recursivo
END.