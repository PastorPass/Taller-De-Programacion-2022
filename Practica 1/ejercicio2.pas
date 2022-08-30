{.2- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de
dichas oficinas.  
Implementar un programa modularizado que: 

a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra.
De cada oficina se ingresa el código de identificación, DNI del propietario y valor de la expensa.

La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa. 

b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina. 
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.  }

program uno;
const
  dimF = 300;
  fin = -1;
type
  oficina = record
                codIdentificacion : integer;
                dniPropietario : integer;
                valorExpensa : real;
            end;
          
  vectorOficinas = array[1..dimF] of oficina;

//Procesos- Funciones

Procedure LeerOficina (var f : oficina);
Begin
  with f do begin
    writeln('ingrese codigo de identificación');
    readln(codIdentificacion);
    if (codIdentificacion <> fin) then begin
      writeln('Ingrese el dni del propietario');
      readln(dniPropietario);
      writeln('Ingrese el valor de la expensa');
      readln(valorExpensa);
    end;
  end;
End;

Procedure CargarVectorOficinas(var vec : vectorOficinas; var dimL : integer);
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
  i : integer;
Begin
  writeln('----------------VECTOR ORDENADO---------------');
  for i := 1 to dimL do
    writeln('Posicion nro. ', i , ' El codigo de identificación = ' ,vec[i].codIdentificacion);
End; 

Procedure OrdenarVectorSeleccion(var vec : vectorOficinas; dimL : integer);
var
  i,j,p : integer;
  auxCod : oficina;
Begin
  for i := 1 to dimL-1 do begin
    p := i;
    for j := (i+1) to dimL do 
        if (vec[j].codIdentificacion < vec[p].codIdentificacion) then
            p := j;
            
    {Intercambia  v[i] y v[p]}
    auxCod := vec[p];
    vec[p] := vec[i];
    vec[i] := auxCod;
  end;
End;

Procedure OrdenarVectorInsercion( var v : vectorOficinas; dimL : integer);
var
  i,j : integer; 
  actual : oficina;
Begin
    for i:= 2 to dimL do begin   {Busca el minimo y lo guarda en la posicion p}
       actual  := v[i];
       j := i-1;
       
       while (j >0) and (v[j].codIdentificacion > actual.codIdentificacion) do begin
            v[j+1] := v[j];
            j := j-1;
       end;
       v[j+1] := actual;
    end;
End;

//P.P
VAR
  dimL : integer;
  vec : vectorOficinas;

BEGIN
  CargarVectorOficinas(vec,dimL);  //Inciso a)
  ImprimirVector(vec,dimL); 
  
  //Se ordenan los codigos de identificación del vector
  //OrdenarVectorInsercion(vec,dimL);  
  OrdenarVectorSeleccion(vec,dimL);
  ImprimirVector(vec,dimL);

END.