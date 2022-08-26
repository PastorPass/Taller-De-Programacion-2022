// ARREGLOS - ORDENACION- SELECCION

//Procesos - funciones
Program uno;
const
  dimF = 10;
  fin = 0;  // condicion de corte
type
    rango = 1..dimF;
    vector = array [rango] of integer;
    
Procedure CargarVector(var v : vector; var dimL : integer);
var
  num : integer;
Begin
  dimL := 0;
  writeln('Ingrese un numero a cargar en el vector');
  readln(num);
  
  while (num <> fin) and (dimL < dimF) do begin
    dimL := dimL + 1;
    v[dimL] := num;
    writeln('Vuelva a Ingresar un numero');
    readln(num);
  end;
End;

Procedure Ordenar( var v : vector; dimL : rango);
var
  i,j,p : rango; 
  item : integer;

Begin
    for i:= 1 to dimL-1 do begin   {Busca el minimo y lo guarda en la posicion p}
        p := i;
        for j := i+1 to dimL do
          if (v[j] < v[p]) then
                p := j;
        
        {Intercambia  v[i] y v[p]}
        item := v[p];
        v[p] := v[i];
        v[i] := item;
    end;
End;

Procedure ImprimirVector(v : vector; dimL : integer);
var
  i : integer;
Begin
  for i := 1 to dimL do 
    writeln('posicion del vector.' , i , ' Elemento = ' , v[i]);
End;

//P.P
VAR
  vec : vector;
  dimL : integer;
BEGIN
  CargarVector(vec,dimL); 
  ImprimirVector(vec,dimL);
  Ordenar(vec,dimL);
  writeln('---------------------------------------------------');
  ImprimirVector(vec,dimL);
END.
    