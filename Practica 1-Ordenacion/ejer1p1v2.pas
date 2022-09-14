{1.- Implementar un programa que procese la información de las ventas de productos de un comercio (como máximo 20).  

De cada venta se conoce código del producto (entre 1 y 15) y cantidad vendida (como máximo 99 unidades). 
El ingreso de las ventas finaliza con el código 0 (no se procesa). 

a. Almacenar la información de las ventas en un vector. El código debe generarse automáticamente (random) 
y la cantidad se debe leer.  

b. Mostrar el contenido del vector resultante. 

c. Ordenar el vector de ventas por código. 

d. Mostrar el contenido del vector resultante. 

e. Eliminar del vector ordenado las ventas con código de producto entre dos valores que se ingresan como parámetros.  

f. Mostrar el contenido del vector resultante. 

g. Generar una lista ordenada por código de producto de menor a mayor a partir del vector resultante del inciso e.,
sólo para los códigos pares. 

h. Mostrar la lista resultante. }

Program uno;
const
  dimF = 20;
  fin = 0;
type 
  rango = 1..dimF;
  rangoCods = 0..15;
  rangoVentas = 1..99;
  venta = record
            codProducto : rangoCods;
            cantVendida : rangoVentas;
          end;

  vectorVentas = array[rango] of venta;
 
  Lista = ^nodo;
  nodo = record
            dato : rangoCods;  //El dato puede ser de tipo venta , pero en este caso solo hago una lista de cods pares
            sig : Lista;
         end;
//Procesos- Funciones

Procedure LeerVenta(var t : venta);
Begin
    t.codProducto := random(15);
    writeln('Codigo de producto : ' , t.codProducto);
    if (t.codProducto <> fin) then begin
      writeln('Ingrese una cantidad de ventas (max 99)');
      readln(t.cantVendida);
    end;
End;
 
 
Procedure CargarVectorVentas(var vec : vectorVentas; var dimL : integer);
var
  t : venta;
Begin
  LeerVenta(t);
  dimL := 0;
  while (t.codProducto <> fin) and (dimL < dimF) do begin
    dimL := dimL +1;
    vec[dimL] := t;
    LeerVenta(t);
  end;
End;
  
  
Procedure ImprimirVectorVentas(vec : vectorVentas; dimL : integer);
var
  i : rango;
Begin
  for i := 1 to dimL do begin
    writeln('Codigos = ' , vec[i].codProducto);
    writeln('Cantidades vendidas = ' , vec[i].cantVendida);
  end;
End;

Procedure OrdenarVector(var vec : vectorVentas; dimL : integer);
var
  i,j,p  : integer;
  item : venta;
Begin
  for i := 1 to dimL-1 do begin
    p := i;
    for j := i+1 to dimL do 
      if (vec[j].codProducto < vec[p].codProducto) then
        p := j;
    item := vec[p];
    vec[p] := vec[i];
    vec[i] := item;
  end;
End;



procedure Eliminar(var v:vectorVentas; var dimL: integer;inferior, superior:rangoCods);
var
  i,j,cont: integer;
Begin
    i:=1;
    cont:=0;
    while (i<=dimL) and (v[i].codProducto<inferior) do
      i:=i+1;

    if i<=dimL then begin
        j:=i;
        while (j<=dimL) and (v[j].codProducto<=superior) do begin
            j:=j+1;
        end; 
        cont:=j-i;

        for j:=i to dimL do
            v[j-cont]:= v[j];

        dimL:=dimL-cont;       
    end;
End;

Procedure AgregarAlFinal2(var L,ult : Lista; unCod : integer);
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato := unCod;
  aux^.sig := nil;
  if (L <> nil) then
    ult^.sig := aux
  else
    L := aux;
  ult := aux;
End;

procedure GenerarLista(var L : Lista; vec : vectorVentas; dimL : integer);
var
  i : integer;
  ult : Lista;
Begin
  ult := nil;
  for i := 1 to dimL  do 
    if (vec[i].codProducto MOD 2 = 0) then
      AgregarAlFinal2(L,ult,vec[i].codProducto)
End;

Procedure ImprimirLista(L : Lista);
Begin
  while ( L <> nil) do begin
    writeln('CODIGOS = ' , L^.dato);
    L := L^.sig;
  end;
End;

//P.P
VAR
  vec : vectorVentas;
  dimL : integer;
  valorInferior,valorSuperior : rangoCods;
  L : Lista;
BEGIN
  randomize;
  CargarVectorVentas(vec,dimL);  // inciso a
  ImprimirVectorVentas(vec,dimL);  //inciso b
  OrdenarVector(vec,dimL);  // inciso c) aplicando el algoritmo de ordenacion x seleccion
  writeln('------Vector Ordenado de manera ascendente x codigos------');
  ImprimirVectorVentas(vec,dimL);  //inciso d
  
  writeln('Ingrese valor inferior');
  readln(valorInferior);
  writeln('Ingrese valor superior');
  readln(valorSuperior);
  Eliminar(vec,dimL,valorInferior,valorSuperior);  //inciso e
  writeln('----Vector luego de eliminar algunos valores----');
  ImprimirVectorVentas(vec,dimL);  // inciso f)


  L := nil;
  GenerarLista(L,vec,dimL);  //inciso g)
  ImprimirLista(L);  //inciso h)
END.