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
g. Generar una lista ordenada por código de producto de menor a mayor a partir del vector resultante del inciso e.
, sólo para los códigos pares. 
h. Mostrar la lista resultante. }

program uno;
const
  tope = 20;
  fin = 0;
  
type
  rango = 1..tope;
  rangoCods = 0..15;
  rangoVentas = 1..99;
  venta = record
                cod : rangoCods;
                cantProdVendidos : rangoVentas;
          end;
          
  vectorVentas = array[rango] of venta;
  
  //Generar una lista ordenada de menor a mayor con solo codigos pares de los productos
  Lista =^nodo;
  nodo = record
            dato : integer;
            sig : Lista;
         end;
//Procesos- Funciones

Procedure LeerVenta (var c : venta);
Begin
  with c do begin
    Randomize;
    write ('Codigo de producto: ');
    cod := random(16);
    writeln(cod);  //Imprimimos el codigo generado aleatoriamente
    if (cod <> fin) then begin
      writeln('Ingrese la cantidad vendida de productos (como maximo 99)');
      readln(cantProdVendidos);
    end;
  end;
End;

Procedure CargarVectorVentas(var vec : vectorVentas; var dimL : integer);
var
  c : venta;
Begin
  dimL := 0;
  LeerVenta(c);
  while (c.cod <> fin) and (dimL < tope) do begin
    dimL := dimL +1;
    vec[dimL] := c;
    LeerVenta(c);
  end;
End;

Procedure InformarVector(vec : vectorVentas; dimL : integer);
var
  i : integer;
Begin
  for i := 1 to dimL do
    writeln('Posicion nro. ', i , ' |Codigo =  ' , vec[i].cod, '| Cantidadd de productos = ' , vec[i].cantProdVendidos);
End;

Procedure OrdenarVector(var vec : vectorVentas; dimL : integer);
var
  i,j,p : integer;
  auxCod :rangoCods;
Begin
  for i := 1 to dimL-1 do begin
    p := i;
    for j := (i+1) to dimL do 
        if (vec[j].cod < vec[p].cod) then  // se ordena x codigo 
            p := j;
            
    {Intercambia  v[i] y v[p]}
    auxCod := vec[p].cod;
    vec[p].cod := vec[i].cod;
    vec[i].cod := auxCod;
  end;
End;


Function BuscarPosicion (v: vectorVentas; dimL: integer; elemABuscar: rangoCods): integer;  //elemABuscar es valorInferior
var 
  pos: integer;
Begin
  pos:= 1;
  while (pos <= dimL) and (elemABuscar > v[pos].cod) do
    pos:= pos + 1;
  if (pos > dimL) then   
    BuscarPosicion:= 0
  else 
    BuscarPosicion:= pos;
End;

Function BuscarPosicionDesde (v: vectorVentas; dimL, pos : integer; elemABuscar: rangoCods): integer;  //elemABuscar = valorSuperior
Begin                                               //pos = posInferior (la posicion en la que esta el valorInferior)
    while (pos <= dimL) and (elemABuscar >= v[pos].cod) do
       pos:= pos + 1;
    if (pos > dimL) then
        BuscarPosicionDesde:= dimL
    else 
        BuscarPosicionDesde:= pos - 1;
End;

Procedure EliminarEnVector(var vec : vectorVentas; var dimL : integer; valorInferior,valorSuperior : integer);
var 
  posInferior, posSuperior, salto, i: integer; 
Begin
  posInferior:= BuscarPosicion (vec, dimL, valorInferior);
  if (posInferior <> 0) then begin
    posSuperior:= BuscarPosicionDesde (vec, dimL, posInferior, valorSuperior);
    
    {Escribir el código correspondiente para hacer el corrimiento y disminuir la dimensión lógica}
    salto := posSuperior-posInferior;
    for i := posSuperior+1 to dimL do //Falta corregir
       vec[i-salto] := vec[i];
    dimL := dimL - ((posSuperior-posInferior)+1);  
  end;
End;

Procedure AgregarAlFinal2(var L,ult : Lista;unCod : integer);
var
  aux : Lista;
Begin
  new(aux);
  aux^.dato := unCod;
  aux^.sig := nil;
  if(L <> nil) then 
    ult^.sig := aux
  else
    L := aux; 
  ult := aux;
End;

Procedure CargarLista(var L : Lista;vec : vectorVentas;dimL : integer);
var
  ult : Lista;
Begin
  ult := nil;
  for i := 1 to dimL do 
    if(vec[i].cod MOD 2 = 0) then
      AgregarAlFinal2(L,ult,vec[auxDimL].cod);

    
End;

Procedure ImprimirLista(L : Lista);
Begin
  writeln('Lista Generada = ');
  while (L <> nil) do begin
    writeln('LISTA DE CODS con Nro Par: ' , L^.dato);
    L := L^.sig;
  end;
End;

//P.P
VAR
  dimL : integer;
  vec : vectorVentas;
  valorInferior,valorSuperior : integer;
  L : Lista;
BEGIN
  CargarVectorVentas(vec,dimL);  //Inciso a)
  InformarVector(vec,dimL);  //Inciso b)
  //Se ordenan los codigos de producto del vector
  OrdenarVector(vec,dimL);  //Ordenamiento por seleccion, inciso c)
  writeln('El vector ordenado queda :');
  InformarVector(vec,dimL);  //Inciso d)
  
  //Ingresamos dos valores de codigo de producto del vector y entre estos dos valores, se eliminan dichos codigos.
  writeln('Ingrese un valor de producto Inferior');
  readln(valorInferior); 
  writeln('Ingrese un valor de producto Superior');
  readln(valorSuperior);

  //Recuerde que el vector esta ordenado, y dicho orden debe ser aprovechado
  EliminarEnVector(vec,dimL,valorInferior,valorSuperior);
  if (dimL = 0) then
    writeln('Se eliminaron todos los valores de codigo de producto del arreglo');
  InformarVector(vec,dimL);  //Inciso f)
  L := nil;
  CargarLista(L,vec,dimL);
  ImprimirLista(L);
END.