{2.- Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la información de los autos en venta. 

Implementar un programa que: 

a) Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en venta. 
Cada nodo del árbol debe contener patente, año de fabricación (2010..2018), la marca y el modelo. 

b) Invoque a un módulo que reciba el árbol generado en a) y una marca 
y retorne la cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado.  

c) Invoque a un módulo que reciba el árbol generado en a)
y retorne una estructura con la información de los autos agrupados por año de fabricación. 

d) Contenga un módulo que reciba el árbol generado en a)
y una patente y devuelva el año de fabricación del auto con dicha patente. Mostrar el resultado. }

Program uno;
const 
  fin = 0;  //Condicion de corte inventada para la patente
type
  rangoAnios = 2010..2018;
  auto = record
            patente : integer;
            anioFab : rangoAnios;
            marca : string;
            modelo : string;
         end;
  Lista = ^nodo;  //Se dispone una lista de las ventas de autos
  nodo = record
            dato : auto;
            sig : Lista;
         end;
         
//----------------------------------------------
  arbol = ^nodo2;
  nodo2 = record
            dato : auto;
            HI : arbol;
            HD : arbol;
          end;
         
  vectorC = array[rangoAnios] of Lista;

//Procesos-Funciones

Procedure LeerAuto(var t : auto);
Begin
  with t do begin
    writeln('Ingrese patente(numero entero)');
    readln(patente);
    if (patente <> fin) then begin
      writeln('Ingrese marca');
      readln(marca);
      writeln('Ingrese modelo');
      readln(modelo);
      {writeln('Ingrese anio de fabricación (2010..2018)');
      readln(anioFab);}
      anioFab := random(9) +2010;
      writeln('año de fabricacion : ' , anioFab);
    end;
  end;
End;

Procedure CrearArbol (var a : arbol; t : auto);
Begin
  if (a = nil) then begin
    new(a);
    a^.dato  := t;
    a^.HI := nil;
    a^.HD := nil;
  end
  else begin
    if (t.patente < a^.dato.patente) then   //ordenado por patente identificatoria
      CrearArbol(a^.HI,t)
    else
      CrearArbol(a^.HD,t);
  end;
End;

Procedure CargarArbol(var a : arbol);
var
  t : auto;
Begin
  LeerAuto(t);  //Se dispone
  while (t.patente <> fin) do begin
    CrearArbol(a,t);
    LeerAuto(t);
  end;
End;

Procedure BuscaryContar(a :arbol; var cant : integer; unaMarca : string);
Begin
  if(a <> nil) then begin
    if (a^.dato.marca = unaMarca) then 
      cant := cant + 1;
    BuscaryContar(a^.HI,cant,unaMarca);
    BuscaryContar(a^.HD,cant,unaMarca);
  end;
End;

Procedure InicializarVectorListas(var vecL : vectorC);
var
  i : rangoAnios;
Begin
  for i := 2010 to 2018 do 
    vecL[i] := nil;
End;

Procedure AgregarAdelante(var UnaLista : Lista; t2 : auto);
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato := t2;
  aux^.sig := UnaLista;
  UnaLista := aux;
End;

Procedure CargarVectorListas(a : arbol; var vecL : vectorC);
var
  t2 : auto;
Begin
  if (a <> nil) then begin
    t2 := a^.dato;
    if (vecL[t2.patente] <> nil   {t2.patente <> fin}) then
      AgregarAdelante(vecL[t2.anioFab{a^.dato.anioFab}],t2);  //retorne una estructura con la información de los autos agrupados por año de fabricación. 
    CargarVectorListas(a^.HI,vecL);
    CargarVectorListas(a^.HD,vecL);
  end;
End;

Procedure ImprimirVectorListas(vecL : vectorC);
var
  i : rangoAnios;
Begin
  for i := 2010 to 2018 do begin
    writeln('*****Año = ' , i , ' ******');
    if (vecL[i] = nil) then 
      writeln('------No hay datos en este año------');
    while (vecL[i] <> nil) do begin
      writeln('PATENTE : ' , vecL[i]^.dato.patente);
      writeln('AÑO DE FABRICACION : ' , vecL[i]^.dato.anioFab);
      writeln('MARCA : ' , vecL[i]^.dato.marca);
      writeln('MODELO : ' , vecL[i]^.dato.modelo);
      writeln('---------------------------------------------');
      vecL[i] := vecL[i]^.sig;
    end; 
  end;
End;

Procedure BuscarPatenteyRetornarAnio(a : arbol; UnaPatente : integer; var UnAnio : integer);
Begin
  if (a <> nil) then begin //Recordar que el arbol esta ordenado x numero de patente
    if (a^.dato.patente = UnaPatente) then 
      UnAnio := a^.dato.anioFab
    else begin
      if (UnaPatente < a^.dato.patente) then 
        BuscarPatenteyRetornarAnio(a^.HI,UnaPatente,UnAnio)
      else
        BuscarPatenteyRetornarAnio(a^.HD,UnaPatente,UnAnio);
    end;
  end;
End;

//P.P
VAR
  a : arbol;
  unaMarca : string;
  cant,UnaPatente,UnAnio : integer;
  vecL : vectorC;
BEGIN
  a := nil;
  CargarArbol(a);
 { writeln('Ingrese una marca a buscar en el arbol ');
  readln(unaMarca);
  cant := 0;
  BuscaryContar(a,cant,unaMarca);  //Modulo Recursivo
  if (cant =0) then 
    writeln('No aparece la marca : ' , unaMarca , ' En el arbol') 
  else
    writeln('cantidad de veces que aparece la marca  : ' , unaMarca , ' En el arbol = ' , cant);}
  InicializarVectorListas(vecL);  
  CargarVectorListas(a,vecL);  //Como es un modulo Recursivo debo hacer antes la inicializacion de las listas
  writeln('VECTOR DE LISTAS');
  ImprimirVectorListas(vecL);  //Verificacion
  
  UnAnio := 0;
  writeln('Ingrese una patente a buscar en el arbol');
  readln(UnaPatente);
  BuscarPatenteyRetornarAnio(a,UnaPatente,UnAnio);
  if (UnAnio <> 0) then begin
    writeln('Se encontro la patente ' , UnaPatente , ' En el arbol');
    writeln('El año de fabricación del auto con dicha patente es : ' , UnAnio);
  end
  else
    writeln('No se encontro la patente : ' , UnaPatente , ' En el arbol');
  
END.