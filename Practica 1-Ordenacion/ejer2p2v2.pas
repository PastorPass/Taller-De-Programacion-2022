{2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas 
de dichas oficinas.  

Implementar un programa modularizado que: 

a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa el código
de identificación, DNI del propietario y valor de la expensa.
La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa. 

b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina. 

c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina. }

Program uno;
const
  dimF = 300;
  fin = -1;
type
  rango = 1..dimF;
  oficina = record
                codIdentificacion : integer;  // condicion de corte -1
                dni : integer;
                valorExpensa : real;
            end;
  vectorOficinas = array[rango] of oficina;
  
//Procesos-Funciones

Procedure LeerOficina(var f : oficina);
Begin
  with f do begin
    writeln('ingrese codigo de identificación');
    readln(codIdentificacion);
    if (codIdentificacion <> fin) then begin
      writeln('Ingrese dni del propietario');
      readln(dni);
      writeln('Ingrese valor de la expensa');
      readln(valorExpensa);
    end;
  end;
End;


Procedure GenerarVector(var vec : vectorOficinas; var dimL : integer);
var
  f : oficina;
Begin
  dimL := 0;
  LeerOficina(f);
  while (f.codIdentificacion <> fin) and (dimL < dimF) do begin
    dimL := dimL +1;
    vec[dimL] := f;
    LeerOficina(f);
  end;
End;

Procedure ImprimirVector(vec : vectorOficinas; dimL : integer);
var
  i : rango;
Begin
  for i := 1 to dimL do begin
    writeln('codigo de identificación = ' , vec[i].codIdentificacion);
    writeln('dni del propietario = ' , vec[i].dni);
    writeln('valor de la expensa = ' , vec[i].valorExpensa:2:2);
  end;
End;

Procedure OrdenarvectorSeleccion(var vec : vectorOficinas; dimL : integer);
var
  i,j,p : integer;
  item : oficina;
Begin
  for i := 1 to dimL-1 do begin
    p := i;
    for j := i+1 to dimL do 
      if(vec[j].codIdentificacion < vec[p].codIdentificacion) then
        p := j;
    item := vec[p];
    vec[p] := vec[i];
    vec[i] := item;
  end;
End;

Procedure OrdenarvectorInserccion (var vec : vectorOficinas; dimL : integer);
var
  i,j,p : integer;
  item : oficina;
Begin
  for i := 2 to dimL do begin
    item := vec[i];
    j := i-1;
    while (j > 0) and (vec[j].codIdentificacion > item.codIdentificacion) do begin
      vec[j+1] := vec[j];
      j := j-1;
    end;
    vec[j+1] := item;
  end;
End;

//P.P
VAR
  vec : vectorOficinas;
  dimL : integer;
BEGIN
  GenerarVector(vec,dimL);
  //ImprimirVector(vec,dimL);  
  //OrdenarvectorSeleccion(vec,dimL);
  OrdenarvectorInserccion (vec,dimL);
  ImprimirVector(vec,dimL);
END.