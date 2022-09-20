{Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las entradas vendidas. 
Se desea procesar la información de una semana. Implementar un programa que: 

Genere 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1 a 7), 
código de la obra, asiento y monto. La lectura finaliza con el código de obra igual a 0. 
Las listas deben estar ordenadas por código de obra de forma ascendente.  

Genere una nueva lista que totalice la cantidad de entradas vendidas por obra.
Esta lista debe estar ordenada por código de obra de forma ascendente.  }

Program uno;
const  
  finDia = 7;
  fin = 0;  // Condicion de corte para el codigo de obra
type
  rangoDias = 1..finDia;
  entrada = record
                dia : rangoDias;
                codObra : integer;
                asiento : 1..1000;
                monto : real;
            end;
  
  Lista =^nodo;
  nodo = record
            dato : entrada;
            sig : Lista;
         end;
         
  vectorListas = array[rangoDias] of Lista;
  
//Genere una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista debe estar ordenada por código de obra de forma ascendente.  

  entrada2 = record
                cantEntradasVendidas : integer;
                codObra : integer;
             end;

  Lista2 =^nodo2;
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
      {writeln('Ingrese dia(1..7)');
      readln(dia);  //asumo que siempre se lee un dia dentro del rango}
      dia := 1+random(7);
      //writeln('DIA : ' ,dia);
      {writeln('Ingrese numero de asiento');
      readln(asiento);}
      asiento:= 1+random(1000);
      {writeln('Ingrese monto de la entrada');
      readln(monto);}
      monto := 1+random(9999);
    end;
  end;
End;

Procedure InsertarOrdenado(var UnaLista : Lista; e : entrada);
var
  ant,act,aux : Lista;
Begin
  new(aux);
  aux^.dato := e;
  ant := UnaLista;
  act := UnaLista;
  while (act <> nil) and (act^.dato.codObra < e.codObra) do begin
    ant := act;
    act := act^.sig;
  end;
  
  if (ant = act) then 
    UnaLista := aux
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
    InsertarOrdenado(vecL[e.dia],e);  //Las listas deben estar ordenadas por código de obra de forma ascendente.
    LeerEntrada(e);
  end;
End;

Procedure ImprimirVectorListas(vecL : vectorListas);
var
  i : rangoDias;
Begin
  for i := 1 to finDia do begin
    writeln('******datos Lista nro : ' , i , ' ******');
    while (vecL[i] <> nil) do begin
      writeln('codigo de obra : ' , vecL[i]^.dato.codObra);
      writeln('DIA : ' , vecL[i]^.dato.dia);
      writeln('numero de asiento : ' , vecL[i]^.dato.asiento);
      writeln('monto de la entrada : ' , vecL[i]^.dato.monto:2:2);
      writeln('-------------------------------------------------');
      vecL[i] := vecL[i]^.sig;
    end;
  end;
End;

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
  e2.cantEntradasVendidas := unaCantEntradas;
End;
 
Procedure InsertarOrdenado2(var L : Lista2; e2 : entrada2);
var
  ant,act,aux : Lista2;
Begin
  new(aux);
  aux^.dato := e2;
  act := L;
  ant := L;
  while (act <> nil) and (act^.dato.codObra < e2.codObra) do begin
    ant := act;
    act := act^.sig;
  end;
  
  if(ant = act) then 
    L := aux
  else
    ant^.sig := aux;
  aux^.sig := act;
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
  
Procedure ImprimirListaNueva(L : Lista2);
Begin
  while (L <> nil) do begin
    writeln('CODIGO DE OBRA : ' , L^.dato.codObra);
    writeln('CANTIDAD DE ENTRADAS VENDIDAS : ' , L^.dato.cantEntradasVendidas);
    writeln('----------------------------------------------------------------');
    L := L^.sig;
  end;
End;
 
//P.P
VAR
  vecL : vectorListas;
  L : Lista2;
BEGIN
  randomize;
  L := nil;
  CargarVectorListas(vecL);
  writeln('------------VECTOR DE LISTAS------------');
  ImprimirVectorListas(vecL);   //Para verificar 
  MergeAcumulador(vecL,L);
  writeln('------LISTA------');
  ImprimirListaNueva(L);
END.