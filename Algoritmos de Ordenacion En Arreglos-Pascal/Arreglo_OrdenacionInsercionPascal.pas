// ARREGLOS - ORDENACION- INSERCION
Program uno;
const
  dimF = 10;
  fin = 0;  // condicion de corte
type
    rango = 1..dimF;
    vector = array [rango] of integer;
    
//Procesos - funciones
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

Procedure OrdenarInsercion( var v : vector; dimL : rango);
var
  i,j : rango; 
  actual : integer;

Begin
    for i:= 2 to dimL do begin   {Busca el minimo y lo guarda en la posicion p}
       actual  := v[i];
       j := i-1;
       
       while (j >0) and (v[j] > actual) do begin
            v[j+1] := v[j];
            j := j-1;
       end;
       v[j+1] := actual;
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
  OrdenarInsercion(vec,dimL);
  writeln('---------------------------------------------------');
  ImprimirVector(vec,dimL);
END.
    