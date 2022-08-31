{3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre de 2022. 
De cada película se conoce: código de película, 
código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) 
y puntaje promedio otorgado por las críticas.  
Implementar un programa modularizado que: 
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de género, 
en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de la película -1.  
b. Una vez almacenada la información, genere un vector que guarde, para cada género, el código de película 
con mayor puntaje obtenido entre todas las críticas. 
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos vistos en la teoría.  
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de película con menor puntaje }

program uno;
const
  dimF = 8;
  fin = -1;
  
type
  rango = 1..dimF;
  pelicula = record
                codPelicula : integer;
                codGenero : rango;
                puntajeProm : real;
             end;
  
  Lista = ^nodo;
  nodo = record
            dato : pelicula;
            sig : Lista;
         end;

  vectorLista = array[rango] of Lista;  // Vector de Listas
  vector2 = array[rango] of pelicula;  // guarda un cod de genero con su maximo puntaje de  critica

//Procesos- Funciones

Procedure LeerPelicula(var p : pelicula);
Begin
  with p do begin
    writeln('ingrese codigo de la pelicula');
    readln(codPelicula);
    if(codPelicula <> fin) then begin
      writeln('Ingrese codigo de genero (1..8)');
      readln(codGenero);
      writeln('Ingrese puntaje promedio otorgado por las críticas');
      readln(puntajeProm);
    end;
  end;
End;

Procedure AgregarAtras(var vec : vectorLista ;p : pelicula; var vecUlt : vectorLista);
                                                            //Uso de otro vector con 8 ultimos
var
  aux:Lista;
  i : integer;
Begin
  i := p.codGenero;
  new(aux);
  aux^.dato:=p;
  aux^.sig:=nil;
  if (vec[i] = nil) then
    vec[i] := aux
  else
    vecUlt[i]^.sig := aux; 
  vecUlt[i] := aux;
End;

Procedure InicializarVectorDeListas(var vec : vectorLista);
var
  i : rango;
Begin
  for i := 1 to dimF do 
    vec[i] := nil;  //inicializa en nil cada posicion del vector de listas
End;

Procedure CargarVectorListaPeliculas(var vec : vectorLista);
var
  p : pelicula;
  vecUlt : vectorLista;
Begin
  InicializarVectorDeListas(vec);
  InicializarVectorDeListas(vecUlt);
  LeerPelicula(p);
  while (p.codPelicula <> fin) do begin
    AgregarAtras(vec,p,vecUlt);  // se almacena por orden de llegada y agrupados por código de género
    LeerPelicula(p);
  end;
End;

Procedure ImprimirVectorDeListas(vecL: vectorLista);
var
  i : integer;
Begin
  for i := 1 to dimF do begin
    if(vecL[i] <> nil) then
      writeln('lista NRO .' ,i);
    while(vecL[i] <> nil) do begin
      writeln('codigo de pelicula: ',vecL[i]^.dato.codPelicula);
      writeln('puntaje Promedio: ',vecL[i]^.dato.puntajeProm:2:2);
      writeln('-------------------------');
      vecL[i]:=vecL[i]^.sig;
    end;
  end;
End;

Procedure ImprimirVectorMaxyMin(vc:vector2; dimL:integer);
Begin

	if (dimL > 0) then begin
		writeln('codigo de pelicula con mejor puntaje:');
		writeln(vc[1].codPelicula);
		writeln('codigo de pelicula con peor puntaje (entre las que entraron al top 8):');
		writeln(vc[dimL].codPelicula);
	end
	else 
		writeln('el vector esta  vacio, no se puede mostrar informacion');
End;


Procedure ObtenerMaxRegistro(var p : pelicula; vecL : vectorLista; var i : integer);
Begin
  p.puntajeProm := -1;
  while (vecL[i] <> nil) do begin
    if (vecL[i]^.dato.puntajeProm > p.puntajeProm) then
      p := vecL[i]^.dato;
    vecL[i] := vecL[i]^.sig;
  end;
End;

procedure ArmarVectorC(var vc:vector2; p:pelicula; v:vectorLista; var dimL:integer);
var
  i,j:integer;
Begin
	dimL:=0;
	for i:=1 to 8 do begin
    	j:=i;
		ObtenerMaxRegistro(p, v, j);
		vc[i]:=p;
		if (vc[i].puntajeProm <> -1) then
		  dimL:=dimL+1;
	end;
End;

Procedure OrdenarVc(var vc:vector2; dimL:integer);
var
  i,j :integer;
  actual:pelicula;
Begin
	for i:=2 to 8 do begin
	  actual:=vc[i]; 
	  j:=i-1;
	  while (j > 0) and (vc[j].puntajeProm < actual.puntajeProm) do begin
		vc[j+1]:=vc[j];
		j:=j-1;
	  end;
	  vc[j+1]:=actual;
	end;
End;


Procedure imprimirNuevoVector(vecP : vector2);
var
  i : integer;
Begin
  for i := 1 to dimF do begin
    writeln('Posicion del vector Nro : ' ,i);
    writeln('Codigo de pelicula = ' , vecP[i].codPelicula);
    writeln('Puntaje promedio = ' , vecP[i].puntajeProm:2:2);
    writeln('Codigo de genero = ' , vecP[i].codGenero);
    writeln('----------------------------');
  end;
End;

Procedure GeneroVectorC(var vecP : vector2; vecL : vectorLista);
var
  dimL : integer;
  p : pelicula;
Begin
  ArmarVectorC(vecP,p,vecL,dimL);
  imprimirNuevoVector(vecP);
  OrdenarVc(vecP,dimL);
  writeln('Vector Ordenado');
  imprimirNuevoVector(vecP);
  
  ImprimirVectorMaxyMin(vecP,dimL);
End;

//P.P
VAR
  dimL : integer;
  vecL : vectorLista;
  vecP : vector2;
BEGIN
  
  CargarVectorListaPeliculas(vecL);
  ImprimirVectorDeListas(vecL);
  
  GeneroVectorC(vecP,vecL);

END.
