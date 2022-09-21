{1.- El administrador de un edificio de oficinas, cuenta en papel,
con la información del pago de las expensas de dichas oficinas.  

Implementar un programa que: 

a) Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. 
De cada oficina se ingresa código de identificación, DNI del propietario y valor de la expensa. 
La lectura finaliza cuando llega el código de identificación -1. 

b) Ordene el vector, aplicando uno de los métodos vistos en la cursada, para obtener el vector ordenado 
por código de identificación de la oficina. 

c) Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de identificación de oficina 
y retorne si dicho código está en el vector. En el caso de encontrarlo, se debe informar el DNI del propietario
y en caso contrario informar que el código buscado no existe. 

d) Tenga un módulo recursivo que retorne el monto total de las expensas }

Program uno;
const
  dimF = 300;
  fin = -1;  //condicion de corte para el codigo de identificación
type
  rango = 1..dimF;
  oficina = record
                codIdentificacion : integer;  //rango (sin orden)
                dniPropietario : integer;
                valorExpensa : real;
            end;
  
  vectorOficinas =array[rango] of oficina;

//Procesos-Funciones

Procedure LeerOficina(var f : oficina);
Begin
  with f do begin
    writeln('Ingrese un codigo de identificación');
    readln(codIdentificacion);
    if (codIdentificacion <> fin) then begin
      writeln('Ingrese dni del propietario');
      readln(dniPropietario);
      {writeln('Ingrese valor de la expensa de la oficina');
      readln(valorExpensa);}
      valorExpensa := 1+random(2300);
    end;
  end;
End;


Procedure CargarVectorOficinas(var vec : vectorOficinas; var dimL : integer);
var
  f : oficina;
Begin
  LeerOficina(f);
  while(f.codIdentificacion <> fin) and (dimL < dimF) do begin //Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra.
    dimL := dimL + 1;
    vec[dimL] := f;
    LeerOficina(f);
  end;
   { if (f.codIdentificacion <> -1) then begin
      dimL := dimL +1;
      writeln('un cod de identificación : ' , f.codIdentificacion);
      vec[f.codIdentificacion] := f; }  //Por alguna razon me da error si almaceno el vector sin orden
End;

Procedure OrdenarVector(var vec: vectorOficinas; dimL : integer);
var
  i,j,p : integer;
  item : oficina;
Begin
  for i := 1 to dimL-1 do begin
    p := i;
    for j := i+1 to dimL do 
      if (vec[j].codIdentificacion < vec[p].codIdentificacion) then 
        p := j;
    item := vec[p];
    vec[p] := vec[i];
    vec[i] := item;
  end;
End;

Procedure BusquedaDicotomicaEnVector(var vec : vectorOficinas; var j,UnDni : integer; dimL : integer; cod : integer);
var
  pri,ult,medio : integer;
Begin
  j := 0;
  pri := 1;
  ult := dimL;
  medio := (pri+ult) DIV 2;
  while (pri <= ult) and (cod <> vec[medio].codIdentificacion) do begin
    if (cod < vec[medio].codIdentificacion) then 
      ult := medio-1
    else
      pri := medio+1;
    medio := (pri+ult) DIV 2;
  end;
  
  if(pri <= ult) then begin
    j := medio;
    UnDni := vec[j].dniPropietario;
  end
  else
    j := 0;
End;

Procedure ImprimirVector(vec : vectorOficinas; dimL : integer);
var
  i : rango;
Begin
  writeln('VECTOR ORDENADO X CODIGO DE IDENTIFICACION');
  for i := 1 to dimL do begin
    writeln('--Posicion del vector numero : ' , i , ' --');
    writeln('Codigo de identificación : ' , vec[i].codIdentificacion);
    writeln('dni del propietario : ' , vec[i].dniPropietario);
    writeln('valor expensa de la oficina : ' , vec[i].valorExpensa:2:2);
    writeln('--------------------------------------------------------');
  end;
End;

Procedure ContadorTotalExpensas(vec : vectorOficinas; dimL : integer; var suma : real);
Begin
  if (dimL >0) then begin 
    suma := suma + vec[dimL].valorExpensa;
    dimL := dimL-1;
    ContadorTotalExpensas(vec,dimL,suma);
  end;
End;

//Con funcion
Function SumaExpensas (vec : vectorOficinas; dimL : integer) : real;
Begin
   if (dimL >0) then 
     SumaExpensas := SumaExpensas(vec,dimL-1) + vec[dimL].valorExpensa;
End;

//P.P
VAR
  vec : vectorOficinas;
  dimL,cod,j,UnDni : integer;   //j : variable que retorna la posicion en donde se encuentra el valor a buscar,-1 si no lo encontro
  suma : real;
BEGIN
  dimL := 0; UnDni := -1;
  CargarVectorOficinas(vec,dimL);
  OrdenarVector(vec,dimL);  //Ordenar x seleccion
  ImprimirVector(vec,dimL);
 { writeln('Ingrese un nuevo codigo de identificación a buscar en el vector');
  readln(cod);
  BusquedaDicotomicaEnVector(vec,j,UnDni,dimL,cod);
  if (j <> 0) then begin
    writeln('Se encontro el codigo de identificación : ' , cod , ' En el vector');
    writeln('Dni del propietario : ' , UnDni);
    writeln('posicion del elemento en el vector : ' , j);
  end
  else
    writeln('No se encontro');}
  suma := 0;
  ContadorTotalExpensas(vec,dimL,suma);  //Modulo recursivo
  writeln('suma :  ' , suma:2:2);
  writeln(SumaExpensas(vec,dimL):2:2)
END.