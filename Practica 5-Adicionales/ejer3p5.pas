{3.- Un supermercado requiere el procesamiento de sus productos.
De cada producto se conoce código, rubro (1..10), stock y precio unitario. Se pide: 

a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su vez, para cada rubro,
se requiere que la búsqueda de un producto por código sea lo más eficiente posible.
La lectura finaliza con el código de producto igual a -1.. 

b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código de producto
y retorne si dicho código existe o no para ese rubro. 

c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada rubro, 
el código y stock del producto con mayor código. 

d) Implementar un módulo que reciba la estructura generada en a), dos códigos y retorne, para cada rubro,
la cantidad de productos con códigos entre los dos valores ingresados. }

Program uno;
const
  fin = -1;  //Condicion de corte para el codigo de producto
type
  rangoRubros = 1..10;
  producto = record
                cod : integer;
                rubro : rangoRubros;
                stock : integer;
                precioUnitario : real;
             end;
  
  arbol = ^nodo;
  nodo = record
            dato : producto;
            HI : arbol;
            HD : arbol;
         end;
//Generar una estructura adecuada que permita agrupar los productos por rubro. A su vez, para cada rubro,
//se requiere que la búsqueda de un producto por código sea lo más eficiente posible.
  vectorArboles = array[rangoRubros] of arbol;

//Procesos-Funciones

Procedure InicializarVectorArboles(var vecA : vectorArboles);
var
  i : rangoRubros;
Begin
  for i := 1 to 10 do 
    vecA[i] := nil;
End;

Procedure LeerProducto(var p : producto);
Begin
  with p do begin
    writeln('Ingrese un codigo de producto');
    readln(cod);
    if (cod <> fin) then begin
      writeln('Ingres un rubro (1..10)');
      readln(rubro);
      {writeln('Ingrese stock');
      readln(stock);}
      stock := 1+random(100);
     { writeln('Ingrese un precio unitario del producto');
      readln(precioUnitario);}
      precioUnitario := 1+random(9999);
    end;
  end;
End;

Procedure CrearArbol(var unArbol : arbol; p : producto);
Begin
  if (unArbol = nil) then begin
    new(unArbol);
    unArbol^.dato := p;
    unArbol^.HI := nil;
    unArbol^.HD := nil;
  end
  else begin
    if(p.cod < unArbol^.dato.cod)then //Arbol ordenado x codigo de producto de manera ascendente
      CrearArbol(unArbol^.HI,p)
    else
      CrearArbol(unArbol^.HD,p);
  end;
End;

Procedure CargarVectorArboles(var vecA : vectorArboles);
var
  p : producto;
Begin
  InicializarVectorArboles(vecA);
  LeerProducto (p);
  while (p.cod <> fin) do begin  //Generar una estructura adecuada que permita agrupar los productos por rubro. A su vez, para cada rubro,
                                    //se requiere que la búsqueda de un producto por código sea lo más eficiente posible.
    CrearArbol(vecA[p.rubro],p);
    LeerProducto(p);
  end;
End;

Procedure ImprimirArboles(unArbol : arbol);
Begin
  if (unArbol <> nil) then begin
    ImprimirArboles(unArbol^.HI);
    writeln('Codigo de producto : ' , unArbol^.dato.cod);
    writeln('RUBRO : ' , unArbol^.dato.rubro);
    writeln('stock del producto : ' , unArbol^.dato.stock);
    writeln('precio unitario del producto : ' , unArbol^.dato.precioUnitario:2:2);
    writeln('------------------------------------------------------------------');
    ImprimirArboles(unArbol^.HD);
  end;
End;

Procedure RecorrerVectorArboles(vecA : vectorArboles);
var
  i : rangoRubros;
Begin
  for i := 1 to 10 do begin
    writeln('*****vector de arboles posicion nro : ' , i , ' ******');
    ImprimirArboles(vecA[i]);
  end;
End;

Procedure BuscarElemEnVectorDeArboles(unArbol : arbol; unCod : integer; var ok : boolean);
Begin
  if (unArbol <> nil) then begin
    if (unCod = unArbol^.dato.cod) then 
      ok := true
    else begin
      if (unCod < unArbol^.dato.cod) then  
        BuscarElemEnVectorDeArboles(unArbol^.HI,unCod,ok)
      else
        BuscarElemEnVectorDeArboles(unArbol^.HD,unCod,ok);
    end;
  end;
End;

Procedure SacarMaximo(unArbol : arbol; var{ MaxCod,maxStock : integer} p : producto);
Begin
  if (unArbol^.HD <> nil) then 
    SacarMaximo(unArbol^.HD,p)
  else begin
    p.cod := unArbol^.dato.cod;
    p.stock := unArbol^.dato.stock;
  end;
End;

Procedure RecorreryBuscarMaximosEnVectorDeArboles(vecA : vectorArboles);
var
  i : rangoRubros;
  //MaxCod,maxStock : integer;  //Tambien puedo hacerlo con estas 2 variables en vez de p : producto
  p : producto;
Begin
  for i := 1 to 10 do begin
    p.cod := -1; //Seteo los valores en valores minimos por cada iteracion para ser evaluados en cada posicion del vector de arboles
    p.stock := -1;
    if (vecA[i] <> nil) then begin
      SacarMaximo(vecA[i],p); 
      //if (MaxCod <> -1) and (maxStock <> -1) then  begin  //NO es necesario
      writeln('****Rubro nro : ' , i , ' ****');
      writeln('codigo del producto con mayor codigo : ' , p.cod);  
      writeln('stock del producto con mayor codigo : ' , p.stock);
      writeln('------------------------------------------------');
      //end;
    end;
  end;
End;

{Procedure ContarProdsEnrango(unArbol: arbol;codInf,codSup : integer; var cantProds : integer);
Begin
  if (unArbol <> nil) then begin
    if ()
End;}

Function ContarProdsEnrango(a : arbol; codInf,codSup : integer) : integer; 
Begin
  if (a <> nil) then begin
    if (a^.dato.cod < codInf) then 
     ContarProdsEnrango:= ContarProdsEnrango(a^.HD, codInf, codSup)
    else begin
      if (a^.dato.cod > codSup) then
        ContarProdsEnrango:= ContarProdsEnrango(a^.HI,codInf,codSup)
      else
        ContarProdsEnrango:= ContarProdsEnrango(a^.HD, codInf, codSup) + ContarProdsEnrango(a^.HI, codInf, codSup) + 1;
    end;
  end
  else
    ContarProdsEnrango := 0;
End;

Procedure RecorrerYContarProdsEnVectorDeArboles(vecA : vectorArboles; codInf,codSup : integer);
var
  aux,i : integer;  //aux que cuenta la cantidad de productos por rubro (se setea a cero x cada iteracion(rubro))
Begin
  for i := 1 to 10 do begin
    aux := 0;
    if (vecA[i] <> nil) then begin
      aux := aux + (ContarProdsEnrango(vecA[i],codInf,codSup));
      writeln('CANTIDAD DE PRODUCTOS EN EL RUBRO : ' , i , ' = ' , aux);
    end;
  end;
End;

//P.P
VAR
  vecA : vectorArboles;
  unRubro,unCod,codInf,codSup : integer; 
  ok : boolean;
BEGIN
  randomize;
  CargarVectorArboles (vecA);
  RecorrerVectorArboles(vecA);  //Recorre todos los arboles generados del vector e imprime (verificacion)
 { writeln('--Busqueda--');
  writeln('Ingrese un rubro (1..10)');
  readln(unRubro);
  writeln('Ingrese un codigo de producto a buscar');
  readln(unCod);
  ok := false;
  BuscarElemEnVectorDeArboles (vecA[unRubro],unCod,ok);
  
  if (ok) then  
    writeln('El codigo : ' , unCod , ' se encuentra en el arbol ,En el rubro nro : ' , unRubro)
  else
    writeln('No existe el codigo ' , unCod , ' Para el rubro nro ' , unRubro);}
  RecorreryBuscarMaximosEnVectorDeArboles(vecA);
  
  writeln('Ingrese codigo inferior');
  readln(codInf);
  writeln('Ingrese codigo superior');
  readln(codSup);
  RecorrerYContarProdsEnVectorDeArboles(vecA,codInf,codSup); //Entre 2 valores ingresados (se hacia largo el nombre)
  
END.

//Otra posible solucion con respecto al inciso c) , se podria generar un vector de 1..10 de tipo registro que 
//contenga solo 2 campos, (stock y cod), inicializar cada posicion del vector en los 2 campos con -1 
//y luego ir comparando con el indice del for , pasando como parametro al procedimiento maximo , un registro y el vector de arboles( vecA[i]) y sacar el maximo corrspondiente