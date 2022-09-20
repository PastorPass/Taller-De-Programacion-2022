{Implementar un programa que procese la información de las ventas de productos de una librería que tiene 4 sucursales.
De cada venta se lee fecha de venta, código del producto vendido, código de sucursal y cantidad vendida. 
El ingreso de las ventas finaliza cuando se lee el código de sucursal 0. Implementar un programa que: 

Almacene las ventas ordenadas por código de producto y agrupados por sucursal, en una estructura de datos adecuada. 

Contenga un módulo que reciba la estructura generada en el punto a
y retorne una estructura donde esté acumulada la cantidad total vendida para cada código de producto. }

Program uno;
const
  fin = 0; //condicion de corte para el codigo de sucursal
  tope = 4;
type
  rango = 1..tope;
  venta = record
            fecha : integer;  //se puede hacer un registro fecha para el dia ,mes y año pero para acortar el tiempo de lectura uso integer
            codProducto : integer;
            codSucursal : 0..4;
            cantVentas : integer;
          end;
          
  Lista = ^nodo;
  nodo = record     
            dato : venta;
            sig : Lista;
         end;
  
  vectorListas = array[rango] of Lista;
  
  //retorne una estructura donde esté acumulada la cantidad total vendida para cada código de producto.
  venta2 = record
                cantVentasTotal : integer;
                codProducto : integer;
           end;
  Lista2 = ^nodo2;
  nodo2 = record
            dato : venta2;  //No especifica que se guarden todos los datos, solo trabajamos con dos campos del registro venta
            sig : Lista2;
          end;
  
//Procesos-Funciones

Procedure InicializarVectorListas(var vecL : vectorListas);
var
  i : rango;
Begin
  for i := 1 to tope do 
    vecL[i] := nil;
End;

Procedure LeerVenta(var t : venta);
Begin
  with t do begin
    writeln('Ingrese codigo de sucursal(1..4)');
    readln(codSucursal);
    if (codSucursal <> fin) then begin
     { writeln('Ingrese fecha');
      readln(fecha);}
      fecha := 1+random(30);
      writeln('Ingrese codigo de producto');
      readln(codProducto);
     { writeln('Ingrese cantidad de ventas');
      readln(cantVentas);}
      cantVentas := 1+random(100);
    end;
  end;
End;

Procedure InsertarOrdenado(var UnaLista : Lista; t : venta);
var
  aux,ant,act : Lista;
Begin
  new(aux);
  aux^.dato := t;
  act := UnaLista;
  ant := UnaLista;
  while (act <> nil) and (act^.dato.codProducto < t.codProducto) do begin
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
  t : venta;
Begin
  InicializarVectorListas(vecL);
  LeerVenta(t);
  while (t.codSucursal <> fin) do begin
    InsertarOrdenado(vecL[t.codSucursal],t);  //Almacene las ventas ordenadas por código de producto y agrupados por sucursal
    LeerVenta(t);
  end;
End;

Procedure MinimoAcumulador(var vecL : vectorListas; var codMin,unMonto : integer);
var
  indiceMin, i: integer;
Begin
  codMin := 999;
  indiceMin := -1;
  for i := 1 to tope do begin
    if (vecL[i] <> nil) then begin
      if (vecL[i]^.dato.codProducto <= codMin) then begin
        indiceMin := i;
        codMin := vecL[i]^.dato.codProducto
      end;
    end;
  end;
  
  if(indiceMin <> -1) then begin
    unMonto := vecL[indiceMin]^.dato.cantVentas;
    vecL[indiceMin] := vecL[indiceMin]^.sig;
  end;
End;

Procedure AgregarAtras(var L : Lista2; unCod,unMonto : integer);
var
  aux : Lista2;
Begin
  new(aux);
  aux^.dato.cantVentasTotal := unMonto;
  aux^.dato.codProducto := unCod;
  aux^.sig := L;
  L := aux;
End;

Procedure MergeAcumulador(vecL : vectorListas; var L : Lista2);
var
  codActual,codMin,unMonto,montoTotal : integer;
Begin
  MinimoAcumulador(vecL,codMin,unMonto);
  while (codMin <>999) do begin
    codActual := codMin;
    montoTotal := 0;
    while (codMin <> 999) and (codMin = codActual) do begin
      montoTotal := montoTotal + unMonto;
      MinimoAcumulador(vecL,codMin,unMonto);
    end;
    AgregarAtras(L,codActual,montoTotal);
  end;
End;

Procedure ImprimirLista(L : Lista2);
Begin
  while (L <> nil) do begin
    writeln('cantidad total ventas = ' , L^.dato.cantVentasTotal);
    writeln('codigo de producto = ' , L^.dato.codProducto);
    writeln('--------------------------------------------------');
    L := L^.sig;
  end;
End;

//P.P
VAR
  vecL : vectorListas;
  L : Lista2;
BEGIN
  randomize;
  CargarVectorListas(vecL);
  //ImprimirVectorListas(vecL);  //A verificar Impresion
  L := nil;
  MergeAcumulador(vecL,L);
  ImprimirLista(L);
END.