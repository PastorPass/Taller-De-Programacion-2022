{4.- Una librería requiere el procesamiento de la información de sus productos. 
De cada producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.  

Implementar un programa modularizado que: 

a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro,
en una estructura de datos adecuada. El ingreso de los productos finaliza cuando se lee el precio 0. 

b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro. 

c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que puede haber más o
menos de 30 productos del rubro 3. 
Si la cantidad de productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.  

d. Ordene, por precio, los elementos del vector generado en b) utilizando alguno de los dos métodos vistos en la teoría.  

e. Muestre los precios del vector ordenado. }

Program uno;
const
  tope = 8;
  fin = 0;
  topeRubroTres = 30;
type
  rango = 1..tope;
  rangoRubro = 1..topeRubroTres;
  producto = record
                codProducto : integer;
                codRubro : rango;
                precio :  real;
             end;
  Lista = ^nodo;
  nodo = record
            dato : producto;
            sig : Lista;
         end;
  
  vectorListas = array[rango] of Lista;  //Vector de Listas ordenado x rubro
  vectorProductos = array[rangoRubro] of producto;  // 
//Procesos-Funciones

Procedure LeerProducto(var p : producto);
Begin
  with p do begin
    writeln('Ingrese precio del producto : ');
    readln(precio);
    if (precio <> fin) then begin
      writeln('Ingrese codigo del producto : ');
      readln(codProducto);
      writeln('Ingrese codigo de rubro (1..8)');
      readln(codRubro);
    end;
  end;
End;

Procedure InicializarVectorListas(var vec : vectorListas);
var
  i : rango;
Begin
  for i := 1 to tope do 
    vec[i] := nil;
End;

Procedure InsertarOrdenado(var vec : vectorListas; p : producto);
var
  aux,ant,act : Lista;
Begin
  new(aux);
  aux^.dato := p;
  aux^.sig := nil;
  act := vec[p.codRubro];
  ant := act;
  while (act <> nil) and (act^.dato.codProducto < aux^.dato.codProducto) do begin
    ant := act;
    act := act^.sig;
  end;
  
  if (act = vec[p.codRubro]) then begin
    aux^.sig := vec[p.codRubro];
    vec[p.codProducto] := aux;
  end
  else begin
    ant^.sig := aux;
    aux^.sig := act;
  end;
End;

Procedure CargarVectorListas(var vec : vectorListas);
var
  p : producto;
Begin
   InicializarVectorListas(vec);
   LeerProducto(p);
   while (p.precio <> fin) do begin
     InsertarOrdenado(vec,p);
     LeerProducto(p);
   end;
End;

Procedure MostrarCodsDeCadaRubro(vec : vectorListas);
var 
  i : integer;
Begin
  for i := 1 to tope do begin
    if(vec[i] = nil) then 
      writeln('Para este rubro nro .', i ,'no hay elementos')
    else  begin
      writeln('------------------------------------');
      writeln('Pertenecientes al rubro numero '  , i);
      while (vec[i] <> nil) do begin
        writeln('Codigo de producto = ' , vec[i]^.dato.codProducto);
        vec[i] := vec[i]^.sig;
      end;
    end;
  end;
End;

Procedure GenerarVectorProdRubroTres(var vecP : vectorProductos; var dimL : integer; vec : vectorListas);
Begin
  dimL := 0;
  while (vec[3] <> nil) do begin
    dimL := dimL + 1;
    vecP[dimL] := vec[3]^.dato;
    vec[3] := vec[3]^.sig;
  end;
End;

Procedure OrdenarVectorInsercion(var vecP : vectorProductos; dimL : integer);
var
  i,j,p : integer;
  auxT : producto;
Begin
  for i:= 1 to dimL-1 do begin   {Busca el minimo y lo guarda en la posicion p}
        p := i;
        for j := i+1 to dimL do
          if (vecP[j].precio < vecP[p].precio) then
                p := j;
        
        {Intercambia  v[i] y v[p]}
        auxT := vecP[p];
        vecP[p] := vecP[i];
        vecP[i] := auxT;
    end;
End;

Procedure InformarVectorOrdenadoxPrecios(vecP : vectorProductos; dimL : integer);
var
  i : integer;
Begin
  for i := 1 to dimL do 
    writeln('-----------------------------------');
    writeln('Precio del rubro 3 = ' , vecP[i].precio:2:2);
End;

Procedure ArmarVector(var vecP : vectorProductos; var dimL : integer; vecL : vectorListas);
Begin
  dimL := 0;
  while (vecL[3] <> nil) do begin
	dimL:= dimL +1;
	vecP[dimL]:=vecL[3]^.dato;
	vecL[3]:=vecL[3]^.sig;
  end;
End;

procedure OrdenarInsercion(var v2:vectorProductos; dimL:integer);
var 
  i,j:integer;
  actual:producto;
Begin
  for i:=2 to dimL do begin
	actual:=v2[i];
	j:=i-1;
	while (j > 0) and (v2[j].precio < actual.precio) do begin
	  v2[j+1]:=v2[j];
	  j:=j-1;
	end;
	v2[j+1]:=actual
  end;
End;

Procedure Generarvector2eInformo(var vecP : vectorProductos; dimL : integer; vecL : vectorListas);
Begin
  ArmarVector(vecP,dimL,vecL);
  OrdenarInsercion(vecP,dimL);
  InformarVectorOrdenadoxPrecios(vecP,dimL);

End;

VAR
  vecL : vectorListas;
  dimL : integer;
  vecP : vectorProductos;
BEGIN
  CargarVectorListas(vecL);
  MostrarCodsDeCadaRubro(vecL);
  
  Generarvector2eInformo(vecP,dimL,vecL);
  
 { GenerarVectorProdRubroTres(vecP,dimL,vecL);
  OrdenarVectorInsercion(vecP,dimL);
  InformarVectorOrdenadoxPrecios(vecP,dimL);}
END.