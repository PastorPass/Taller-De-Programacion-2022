{5.- Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el siguiente encabezado: 

   	Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);  

 

Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra en el vector. }

Program uno;
const
  dimF = 10;
type
  rango = 1..dimF;
  
  vector = array [rango] of integer;  //se dispone este vector

Procedure BusquedaDicotomica (vec : vector; ini,fin : rango; valor : integer; var pos : integer);
var
  medio : integer;
Begin
  pos := 0;
  medio := (ini + fin) DIV 2;
  while (ini <= fin) and ( valor <> vec[medio]) do begin
    if (valor < vec[medio]) then 
      fin := medio -1
    else
      ini := medio +1;
    medio := (ini + fin) DIV 2;
  end;
  
  if (ini <= fin) then 
    pos := medio
  else
    pos := -1;  // Retorna -1 cuando el elemento a buscar no está
End;

//Procedimiento recursivo de la busqueda dicotómica

Procedure busquedaDicotomica2 (v: vector; ini,fin: rango; dato:integer; var pos: integer);
Begin
  pos:= (ini + fin) DIV 2;
  if (ini<= fin) then begin
	if(v[pos]>dato) then 
	  busquedaDicotomica(v, ini, pos-1, dato, pos)
	else 
	  if v[pos]< dato then 
	    busquedaDicotomica(v, pos+1, fin, dato, pos);
  end
  else 
    if v[pos]<>dato then pos:=-1;
End;

Procedure CargarVector(var vec : vector);
var
  i : rango;
Begin
  for i := 1 to dimF do 
    vec[i] := i;
End;

//P.P
VAR
  vec : vector;
  valor,pos : integer;
BEGIN
  CargarVector(vec);  //Suponiendo que se carga de manera ascendente (menor a mayor)
  writeln('Ingrese valor a buscar en el vector');
  readln(valor);
  busquedaDicotomica2(vec,1,dimF,valor,pos);  //1 : inicio del vector ;  dimF : fin del vector;  valor : elemento a buscar ; pos :retorna la posicion del dato
  if (pos <> -1) then 
    writeln('El valor a buscar en el vector esta en la posicion nro : ' , pos)
  else
    writeln('No se encuentra el valor en el vector');
END.