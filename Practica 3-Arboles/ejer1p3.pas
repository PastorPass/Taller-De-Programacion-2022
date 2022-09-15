{1. Escribir un programa que: 

a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol binario de búsqueda. 
De cada socio se lee número de socio, nombre y edad. La lectura finaliza con el número de socio 0 y el árbol debe
quedar ordenado por número de socio. 

b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como parámetro y que :  

i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que retorne dicho valor. 

ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo recursivo que retorne dicho socio. 

iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor. 

iv. Aumente en 1 la edad de todos los socios. 

v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un módulo recursivo 
que reciba el valor leído y retorne verdadero o falso. 

vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a un módulo recursivo que 
reciba el nombre leído y retorne verdadero o falso. 

vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad. 

viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso vii e invocar a un módulo 
recursivo que retorne la suma de las edades de los socios. 

ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo número de socio 
se encuentra entre los dos valores ingresados. Debe invocar a un módulo recursivo que reciba los dos valores leídos
y retorne dicha cantidad. 

x. Informe los números de socio en orden creciente.  

xi. Informe los números de socio pares en orden decreciente.  }

Program uno;
const
  fin = 0;  //condicion de corte para el numero de socio
type
  rangoEdad = 0..127;
  socio = record
            numSocio : integer;
            nombre : string;
            edad : rangoEdad;
          end;
  
  arbol = ^nodo;
  nodo = record
            dato : socio;
            HI : arbol;
            HD : arbol;
         end;

//Procesos-Funciones

Procedure CrearArbol(var a : arbol; s : socio);
Begin
  if (a = nil) then begin
    new(a);
    a^.dato := s;
    a^.HI := nil;
    a^.HD := nil;
  end
  else begin
    if (s.numSocio < a^.dato.numSocio) then 
      CrearArbol(a^.HI,s)
    else
      CrearArbol(a^.HD,s);
  end;
End;

Procedure LeerSocio(var s : socio);
Begin
  with s do begin
    writeln('ingrese numero de socio');
    readln(numSocio);
    if (numSocio <> fin) then begin
      writeln('ingrese nombre de socio');
      readln(nombre);
      writeln('Ingrese edad de socio');
      readln(edad);
    end;
  end;
End;

Procedure CargarArbol(var a : arbol);
var
  s : socio;
Begin
  LeerSocio(s);
  while (s.numSocio <> fin) do begin
    CrearArbol(a,s);
    LeerSocio(s);
  end;
End;

Function InformarmaxNumSocio(a : arbol; max : integer) : integer;  //Recorro solo los hijos derechos, ya que ahi estan los numeros mas grandes
Begin
  if (a = nil) then 
    InformarmaxNumSocio := max
  else begin
    if (a^.dato.numSocio > max) then 
      max := a^.dato.numSocio;
    InformarmaxNumSocio := InformarmaxNumSocio(a^.HD,max);
  end;
End;

Function numMinSocio (a : arbol; min : integer) : socio;  //Recorro solo los hijos izquierdos

Begin
  if (a <> nil) then begin  
    if (a^.dato.numSocio < min) then begin
      min := a^.dato.numSocio;
      numMinSocio := a^.dato;
    end;
    numMinSocio := numMinSocio(a^.HI,min);
  end;
End;

Procedure ImprimirSocio(s : socio);
Begin
  writeln('---Datos del socio x el numero de socio mas chico---');
  writeln('numero de socio : ' , s.numSocio);
  writeln('edad del socio : ' , s.edad);
  writeln('nombre del socio : ' , s.nombre);
End;

Function InformarMaxEdadSocio (a : arbol; max : integer) : integer;
Begin
  if (a = nil) then 
    InformarMaxEdadSocio := max
  else begin
    if (a^.dato.edad > max) then 
      max := a^.dato.edad;
    if (a^.HI <> nil) then 
      InformarMaxEdadSocio := InformarMaxEdadSocio(a^.HI,max)
    else
      InformarMaxEdadSocio := InformarMaxEdadSocio(a^.HD,max);
  end;
End;

Procedure AumentarEdadDeSocios(a : arbol);
Begin
  if (a <> nil) then begin  
    AumentarEdadDeSocios(a^.HD);
    a^.dato.edad := a^.dato.edad +1; //Aumenta +1 en un campo particular para cada hijo del arbol
    AumentarEdadDeSocios(a^.HI);
  end;
End;

Procedure ImprimirArbol(a : arbol);
Begin
  if (a <> nil) then begin
    ImprimirArbol(a^.HI);
    writeln(a^.dato.edad);
    ImprimirArbol(a^.HD);
  end;
End;

Function BuscarNuevoSocio(a : arbol; valor : integer) : boolean;
Begin
  if (a <> nil) then begin
    if (a^.dato.numSocio = valor) then 
      BuscarNuevoSocio := true
    else begin
      if (valor > a^.dato.numSocio) then 
        BuscarNuevoSocio := BuscarNuevoSocio(a^.HD,valor)
      else
        BuscarNuevoSocio := BuscarNuevoSocio(a^.HI,valor);
    end;
  end
  else
    BuscarNuevoSocio := false;
End;

Function InformarCantidadSocios(a : arbol) : integer;
Begin
  if (a <> nil) then
    InformarCantidadSocios := (InformarCantidadSocios(a^.HI) + InformarCantidadSocios(a^.HD)) +1
  else
    InformarCantidadSocios := 0;
End;

Function InformarPromedio(a : arbol;cantSocios : real) : real;
Begin
  if (a <> nil) then 
    InformarPromedio := (InformarPromedio(a^.HI,cantSocios) + InformarPromedio(a^.HD, cantSocios)) + ( a^.dato.edad / cantSocios)
  else
    InformarPromedio := 0;
End;

Function InformoCantidadSociosEnRango(a : arbol; ini,fin : integer) : integer;
Begin
  if (a <> nil) then begin
    if (a^.dato.numSocio >= ini) and (a^.dato.numSocio <= fin) then 
      InformoCantidadSociosEnRango := InformoCantidadSociosEnRango (a^.HD,ini,fin) + InformoCantidadSociosEnRango(a^.HI,ini,fin) + 1  //Aumento la cantidad de socios que cumplen en el rango
    else begin
      if (a^.dato.numSocio < ini) then
        InformoCantidadSociosEnRango := InformoCantidadSociosEnRango(a^.HD, ini, fin)
	  else 
	    InformoCantidadSociosEnRango := InformoCantidadSociosEnRango(a^.HI,ini, fin);
	end;
  end
  else
    InformoCantidadSociosEnRango := 0;
End;

Procedure InformoNumSocios(a : arbol);
Begin
  if (a <> nil) then begin
    InformoNumSocios(a^.HI);
    writeln('NUMERO DE SOCIO = ' , a^.dato.numSocio);
    InformoNumSocios(a^.HD);
  end;
End;

Procedure InformoNumSociosPares(a : arbol);
Begin
  if (a <> nil) then begin
    InformoNumSociosPares(a^.HD);
    if (a^.dato.numSocio MOD 2 = 0) then 
      writeln('NUMERO DE SOCIO PAR = ' , a^.dato.numSocio);
    InformoNumSociosPares(a^.HI);
  end;
End;

//P.P
VAR
  a : arbol;
  max,min,valor,valorInf,valorSup : integer;
  sMin : socio;
  aux : integer;
BEGIN
  a := nil;
  max := -1;  min := 999;
  CargarArbol(a);
  writeln('El numero de socio mas grande en el arbol es : ' , InformarmaxNumSocio(a,max));
  //sMin := numMinSocio(a,min);  //Devuelve un registro del campo donde se encuentra el numero minimo de socio a otro registro para la futura impresion
  //ImprimirSocio(sMin);
  //writeln('La edad mas grande entre todos los socios arbol es  : ' , InformarMaxEdadSocio(a,max));
  //AumentarEdadDeSocios(a);  //Aumenta las edades de cada socio, el arbol se pasa por valor
 // writeln('EDADES AUMENTADAS DE TODOS LOS SOCIOS DEL ARBOL');
  //ImprimirArbol(a);  // Imprime Solo las edades de cada nodo que tiene a cada registro socio
 { writeln('Ingrese un nro de socio');
  readln(valor);
  if (BuscarNuevoSocio(a,valor)) then 
    writeln('el valor ' , valor , 'se encuentra en el arbol de socios')
  else
    writeln('el valor ' , valor , 'NO se encuentra en el arbol de socios'); }
  writeln('cantidad total de socios en el arbol = ' ,InformarCantidadSocios(a));
  aux := InformarCantidadSocios(a);  //aux = guarda la cantidad de socios en todo el arbol y se pasa a la funcion InformarPromedio
  writeln('El promedio de edad de los socios en todo el arbol = ' , InformarPromedio(a,aux):2:2);
  writeln('Se ingresan valores de numeros de socios y dentro de estos dos valores se suman cuantos socios hay en tal rango');
  writeln('ingrese valor inferior');
  readln(valorInf);
  writeln('Ingrese valor superior');
  readln(valorSup);
  writeln('La cantidad de socios entre los 2 valores ingresados es : ' , InformoCantidadSociosEnRango(a,valorInf,valorSup));
  writeln('---IMPRESION DE ARBOL EN FORMA CRECIENTE PARA LOS NUMEROS DE SOCIO---');
  InformoNumSocios(a);  //Informo los numeros de socio en forma creciente
  writeln('---IMPRESION DE ARBOL EN FORMA DECRECIENTE PARA LOS NUMEROS DE SOCIO PARES---');
  InformoNumSociosPares(a);  //Informo los numeros de socio pares en forma decreciente
END.