{Escribir un programa que: 

a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee código de producto,
fecha y cantidad de unidades vendidas. La lectura finaliza con el código de producto 0. 
Un producto puede estar en más de una venta. Se pide: 

i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto. 

ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto.
Cada nodo del árbol debe contener el código de producto y la cantidad total vendida. 

               Nota: El módulo debe retornar los dos árboles. 

b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne la cantidad total
de unidades vendidas de ese producto. 

c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne la cantidad total 
de unidades vendidas de ese producto.  }

Program uno;
const
  fin = 0;  //Condicion de corte para el codigo de producto
type
  venta = record
            codProducto : integer;
            fecha : string;
            unidadesVendidas : integer;
          end;

  arbol = ^nodo;
  nodo = record
            dato : venta;
            HI : arbol;
            HD : arbol;
         end;

//-------Se debe generar otro arbol----
  venta2 = record
                codProducto : integer;
                unidadesVendidas : integer;
           end;
  
  arbol2 = ^nodo2;
  nodo2 = record
                dato : venta2;
                HI : arbol2;
                HD : arbol2;
          end;

//Procesos-Funciones

Procedure LeerVenta(var t : venta);
Begin
  with t do begin
    writeln('Ingrese codigo del producto');
    readln(codProducto);
    if (codProducto <> fin) then begin
      writeln('Ingrese fecha');
      readln(fecha);
      writeln('Ingrese la cantidad de unidades vendidas');
      readln(unidadesVendidas);
    end;
  end;
End;

Procedure CrearArboles(var a : arbol; var a2 : arbol2; t : venta);
Begin
  //Arbol con un nodo que tiene una venta con dos campos
  if (a2 = nil) then begin
	new(a2);
	a2^.dato.codProducto := t.codProducto;
	a2^.dato.unidadesVendidas :=t.unidadesVendidas;
	a2^.HI :=nil;
	a2^.HD :=nil;
  end
  else
    if (a = nil ) and (a2^.dato.codProducto = t.codProducto) then  //Un producto puede estar en más de una venta
	  a2^.dato.unidadesVendidas := a2^.dato.unidadesVendidas + t.unidadesVendidas;
  
  //Paso al otro arbol
  if (a = nil) then begin
	new(a);
	a^.dato:=t;
	a^.HI := nil;
	a^.HD := nil;
  end
  else begin
    if (t.codProducto < a^.dato.codProducto) and (a2^.dato.codProducto <> t.codProducto) then 
	  CrearArboles(a^.HI, a2^.HI, t)
	else begin
	  if (t.codProducto < a^.dato.codProducto) and (a2^.dato.codProducto = t.codProducto) then 
	    CrearArboles(a^.HI, a2, t)
	  else begin
	    if (t.codProducto > a^.dato.codProducto) then 
		  CrearArboles(a^.HD, a2^.HD,t)
		else
		  CrearArboles(a^.HD, a2, t);
	  end;
	end;
  end;
End;

Procedure CargarArboles(var a : arbol; var a2 : arbol2);
var
  t : venta;
Begin
  LeerVenta(t);
  while (t.codProducto <> fin) do begin 
    CrearArboles(a,a2,t);
    LeerVenta(t);
  end;
End;

Function InformarCant(a : arbol; nueCod : integer) : integer;
Begin
  //de otra forma
 { if (a <> nil) then begin
	if (a^.dato.codProd < cod) then 
	  retornoVentasA1:=retornoVentasA1(a^.HD, cod)
	else begin
	  if (a^.dato.codProd > cod) then
	    retornoVentasA1:=retornoVentasA1(a^.HI, cod)
	  else 
	    retornoVentasA1:=retornoVentasA1(a^.HD, cod) + a^.dato.unidadesV;
    end;
  end
  else
	retornoVentasA1:=0;	}

  if (a <> nil) then begin
  
    if (a^.dato.codProducto = nueCod) then
      InformarCant := InformarCant(a^.HD,nueCod) + a^.dato.unidadesVendidas
    else begin
      if (nueCod < a^.dato.codProducto) then 
        InformarCant := InformarCant(a^.HI,nueCod)
      else
         InformarCant := InformarCant(a^.HD,nueCod);
    end;
  end
  else
    InformarCant := 0;
End;

Function InformarCantArbol2(a2 : arbol2; nueCod : integer) : integer;
Begin
  if (a2 <> nil) then begin
  
    if (a2^.dato.codProducto = nueCod) then
      InformarCantArbol2 := {InformarCantArbol2(a2^.HD,nueCod) +} a2^.dato.unidadesVendidas
    else begin
      if (nueCod < a2^.dato.codProducto) then 
        InformarCantArbol2 := InformarCantArbol2(a2^.HI,nueCod)
      else
         InformarCantArbol2 := InformarCantArbol2(a2^.HD,nueCod);
    end;
  end
  else
    InformarCantArbol2 := 0;
End;

Procedure ImprimirArbol(a : arbol);
Begin
  if (a <> nil) then begin
    ImprimirArbol(a^.HD);
    writeln('codigo de producto = ' , a^.dato.codProducto);
    writeln('fecha = ' , a^.dato.fecha);
    writeln('cantidad vendida = ' , a^.dato.unidadesVendidas);
    ImprimirArbol(a^.HI);
  end;
End;

Procedure ImprimirArbol2(a2 : arbol2);
Begin
  if (a2 <> nil) then begin
    ImprimirArbol2(a2^.HD);
    writeln('codigo de producto = ' , a2^.dato.codProducto);
    writeln('cantidad vendida = ' , a2^.dato.unidadesVendidas);
    ImprimirArbol2(a2^.HI);
  end;
End;


//P.P
VAR
  a : arbol;
  a2 : arbol2;
  nueCod : integer;
BEGIN
  a:=nil; 
  a2 := nil;
  CargarArboles(a,a2);
  writeln('Ingrese un nuevo codigo de producto a buscar en el 1er arbol');
  readln(nueCod);
  writeln('cantidad de unidades vendidas del producto con codigo de producto = ' , nueCod , ' es : ' ,InformarCant(a,nueCod));
  writeln('Ingrese un nuevo codigo de producto a buscar en el 2do arbol');
  readln(nueCod);
  writeln('cantidad de unidades vendidas del producto con codigo de producto = ' , nueCod , ' es : ' ,InformarCantArbol2(a2,nueCod));
  ImprimirArbol(a);
  writeln('--------otro arbol------- ');
  ImprimirArbol2(a2);
END.