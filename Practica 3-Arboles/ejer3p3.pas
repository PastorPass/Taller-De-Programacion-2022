{Implementar un programa que contenga: 

a. Un módulo que lea información de alumnos de Taller de Programación y almacene en una estructura de datos
sólo a aquellos alumnos que posean año de ingreso posterior al 2010. De cada alumno se lee legajo, DNI y año de ingreso.
La estructura generada debe ser eficiente para la búsqueda por número de legajo.  

b. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo
legajo sea inferior a un valor ingresado como parámetro.  

c. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo 
legajo esté comprendido entre dos valores que se reciben como parámetro.  

d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande. 

e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar. }

Program uno;
type
  rangoAnio = 2010..2022;
  alumno = record
                legajo : integer;
                dni : integer;
                anioIngreso : rangoAnio;
          end;
  
  arbol = ^nodo;
  nodo = record
            dato : alumno;
            HI : arbol;
            HD : arbol;
         end;
  
//Procesos-Funciones

Procedure LeerAlumno(var t : alumno);
Begin
  with t do begin
    writeln('Ingrese anio de ingreso');
    readln(anioIngreso);
   // anioIngreso := 2010+random(12);  //Genera numeros entre el 2010 y el 2022
//    writeln(anioIngreso);
    if (anioIngreso > 2010) then begin
     { writeln('Ingrese dni');
      readln(dni); }
      dni := 1+random(3500);
      
      writeln('Ingrese número de legajo');
      readln(legajo);
      //legajo := 1+random(1000);
    end;
  end;
End;

Procedure CrearArbol(var a : arbol; t : alumno);
Begin
  if (a = nil) then begin
    new(a);
    a^.dato := t;
    a^.HI := nil;
    a^.HD := nil;
  end
  else begin
    if (t.legajo < a^.dato.legajo) then  //La estructura generada debe ser eficiente para la búsqueda por número de legajo. 
      CrearArbol(a^.HI,t)
    else
      CrearArbol(a^.HD,t);
  end;
End;

Procedure CargarArbol(var a : arbol);
var
  t : alumno;
Begin
  LeerAlumno(t);
  while (t.anioIngreso > 2010) do begin
    CrearArbol(a,t);
    LeerAlumno(t);
  end;
End;

Procedure ImprimeNodo ( a : arbol );  //Imprime varios datos de cada lado o cada hijo de cada nodo, en orden
Begin
  if ( a<> nil ) then begin
    ImprimeNodo(a^.HI);
    writeln('Numero de legajo = ' , a^.dato.legajo);
    writeln('Numero de dni = ' , a^.dato.dni);
    writeln('Año de ingreso = ' , a^.dato.anioIngreso);
    writeln('--------------------------');
	ImprimeNodo(a^.HD);
  end;
End; 
 
Procedure ImprimeAlumno(t : alumno);
Begin
	  writeln('Numero de legajo = ' , t.legajo);
      writeln('Numero de dni = ' , t.dni);
      writeln('Año de ingreso = ' , t.anioIngreso);
      writeln('--------------------------');
End;
 
Procedure BuscarEnArboleInformar(a : arbol; valor : integer);
Begin
  if(a<>nil) then begin
	if (a^.dato.legajo <= valor )then begin //En este caso asumo que toma el valor( <= valor)
	  ImprimeNodo(a^.HI);
	  ImprimeAlumno(a^.dato);
      BuscarEnArboleInformar(a^.HD, valor);
	end 
	else 
	  BuscarEnArboleInformar(a^.HI,valor);
  end;
End;
 
Procedure BuscarEnArboleInformar2(a : arbol; valorinf, valorSup : integer);
Begin
  if(a<>nil) then begin
    if (a^.dato.legajo > valorinf) then
	  BuscarEnArboleInformar2(a^.HI, valorinf,valorSup);
	  
    if (a^.dato.legajo <= valorSup) then begin
	  if(a^.dato.legajo>= valorinf )then 
		ImprimeAlumno(a^.dato);
	BuscarEnArboleInformar2(a^.HD,valorinf,valorSup);
	end;
  end;
End;
 
Function MaximoEnArbol(a : arbol;max : integer) : integer;
var 
  DniMaxI,DniMaxD :integer;
Begin
  if (a <> nil) then begin
	DniMaxI := MaximoEnArbol(a^.HI,max);  //Saca el maximo dni del hijo izquierdo
	DniMaxD := MaximoEnArbol(a^.HD,max);  //Saca el maximo dni del hijo derecho
	if (DniMaxI > DniMaxD) then
	  max := DniMaxI
	else
	  max := DniMaxD;
	if (max>a^.dato.dni) then 
	  MaximoEnArbol := max 
	else 
	  MaximoEnArbol := a^.dato.dni;
  end
  else
    MaximoEnArbol := -1;
End;
 
Function ContarLegajoImpar(a : arbol) : integer;
Begin
  if (a <> nil) then
    ContarLegajoImpar := ((ContarLegajoImpar(a^.HI) + ContarLegajoImpar(a^.HD)) + (a^.dato.legajo MOD 2))
  else
    ContarLegajoImpar := 0;
End;
 
//P.P
VAR
  a : arbol;
  valor1,valor2 : integer;
  dniMax : integer;
BEGIN
  a := niL;
  randomize;
  CargarArbol(a);
  writeln('Ingrese un numero de legajo para imprimir los datos de los alumnos menores a tal numero de legajo');
  readln(valor1);
  BuscarEnArboleInformar(a,valor1);
  writeln('Ingrese un valor inicial de numero de legajo');
  readln(valor1);
  writeln('Ingrese un valor final de numero de legajo');
  readln(valor2);
  BuscarEnArboleInformar2(a,valor1,valor2);
  dniMax := -1;
  writeln('El dni mas grande del alumno en todo el arbol = ' , MaximoEnArbol(a,dniMax));
  writeln('La cantidad de alumnos con legajo impar = ' , ContarLegajoImpar(a));
END.