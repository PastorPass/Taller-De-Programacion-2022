{4.- Una librería requiere el procesamiento de la información de sus productos. 
De cada producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.  

Implementar un programa modularizado que: 

a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro, 
en una estructura de datos adecuada. El ingreso de los productos finaliza cuando se lee el precio 0. 

b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro. 

c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que puede haber
más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3 es mayor a 30,
almacenar los primeros 30 que están en la lista e ignore el resto.  

d. Ordene, por precio, los elementos del vector generado en b) utilizando alguno de los dos métodos vistos en la teoría.  

e. Muestre los precios del vector ordenado }

Program uno;
const
  dimF = 8;
  fin = 0;  //condicion de corte para el precio
type
  rango = 1..dimF;
  producto = record
                cod : integer;
                codRubro : rango;
                precio : real;
             end;
  Lista =^nodo;
  nodo = record
            dato : producto;
            sig : Lista;
         end;
  
  vectorListas = array[rango] of Lista;
  
  vectorProducto = array[1..30] of producto;
  
Procedure InicializarVectorListas(var vec : vectorListas);
var
  i : rango;
Begin
  for i := 1 to dimF do 
    vec[i] := nil;
End;

Procedure LeerProducto(var p : producto);
Begin
  with p do begin
    writeln('Ingrese un precio del producto');
    readln(precio);
    if (precio <> fin) then begin
      writeln('ingrese un cod de producto');
      readln(cod);
      writeln('Ingrese un codigo de rubro(1..8)');
      readln(codRubro);
    end;
  end;
End;

Procedure AgregarAdelante(var UnaLista : Lista; p : producto);
var
  aux : Lista;
Begin
  new (aux);
  aux^.dato := p;
  aux^.sig := UnaLista;
  UnaLista := aux;
End;

//Procesos-Funciones 
Procedure CargarVectorListas(var vec : vectorListas);
var
  p : producto;
Begin
  InicializarVectorListas(vec);
  LeerProducto (p);
  while(p.precio <> fin) do begin
    AgregarAdelante(vec[p.codRubro],p);
    LeerProducto(p);
  end;
End;

Procedure InformarVectorListas(vec : vectorListas);
var
  i : rango;
Begin
  for i := 1 to dimF do begin 
    writeln('------Lista NRO : ' , i , '------');
    while (vec[i] <> nil) do begin
      writeln('cod de producto = ' , vec[i]^.dato.cod);
      vec[i] := vec[i]^.sig;
    end;
  end;
End;

Procedure GenerarVectorProductos (var vecP : vectorProducto; vec : vectorListas; var dimL : integer);

Begin
  dimL := 0;
  while (vec[3] <> nil) and (dimL < dimF) do begin  //(dimL < dimF) condicion para que no agregue mas de 30 prods al vector
    dimL := dimL + 1;
    vecP[dimL] := vec[3]^.dato;
    vec[3] := vec[3]^.sig;
  end;
End;

Procedure ImprimirTodoVectorListas(vec : vectorListas);
var
  i : rango;
Begin
  writeln('------IMPRIME TODOS LOS ELEMENTOS DEL VECTOR------');
  for i := 1 to dimF do begin 
    writeln('------Lista NRO : ' , i , '------');
    while (vec[i] <> nil) do begin
      writeln('cod de producto = ' , vec[i]^.dato.cod);
      writeln('precio del producto = ' , vec[i]^.dato.precio:2:2);
      writeln('cod del rubro = ' , vec[i]^.dato.codRubro);
      
      vec[i] := vec[i]^.sig;
    end;
  end;
End;

Procedure ImprimirVectorProductos(vecP : vectorProducto; dimL : integer);
var
  i : integer;
Begin
  writeln('---------VECTOR DE PRODUCTOS---------');
  writeln('Datos sacados de la lista nro 3');
  for i := 1 to dimL do begin
    writeln('------Descomposicion del producto nro ' , i ,'-------');
    writeln('codigo del producto : ' , vecP[i].cod);
    writeln('codigo de rubro del producto : ' , vecP[i].codRubro);
    writeln('precio del producto : ' , vecP[i].precio:2:2);
  end;
End;

Procedure OrdenarVector(var vecP : vectorProducto; dimL : integer);  //Por seleccion
var
  i,p,j : integer;
  item : producto;
Begin
  for i := 1 to dimL-1 do begin
    p := i;
    for j := i+1 to dimL do 
      if (vecP[j].precio < vecP[p].precio) then
        p := j;
    item := vecP[p];
    vecP[p] := vecP[i];
    vecP[i] := item;
  end;
End;

//P.P
VAR
  vec : vectorListas;
  vecP : vectorProducto;
  dimL : integer;
BEGIN
  dimL := 0;
  CargarVectorListas(vec);
  InformarVectorListas(vec);
  //ImprimirTodoVectorListas(vec);  //Proceso para verificar la impresion del vector de listas
  GenerarVectorProductos(vecP,vec,dimL);
  //ImprimirVectorProductos(vecP,dimL);  //Proceso para verificar la impresion
  OrdenarVector(vecP,dimL);
  writeln('------Vector ordenado x precio de productos------');
  ImprimirVectorProductos(vecP,dimL);  //imprimo todos los campos
END.