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
{
Procedure ImprimirVector(vec : vectorOficinas; dimL : integer);
var
  i : integer;
Begin
  writeln('----------------VECTOR ORDENADO---------------');
  for i := 1 to dimL do
    writeln('Posicion nro. ', i , ' El codigo de identificación = ' ,vec[i].codIdentificacion);
End; }

Procedure OrdenarVectorSeleccion(var vec : vector2; dimL : integer);
var
  i,j,p : integer;
  auxt : pelicula;
Begin
  for i := 1 to dimL-1 do begin
    p := i;
    for j := (i+1) to dimL do 
        if (vec[j].puntajeProm < vec[p].puntajeProm) then
            p := j;
            
    {Intercambia  v[i] y v[p]}
    auxt := vec[p];
    vec[p] := vec[i];
    vec[i] := auxt;
  end;
End;

{Procedure OrdenarVectorInsercion( var v : vectorOficinas; dimL : integer);
var
  i,j : integer; 
  actual : oficina;
Begin
    for i:= 2 to dimL do begin  } {Busca el minimo y lo guarda en la posicion p}
       {actual  := v[i];
       j := i-1;
       
       while (j >0) and (v[j].codIdentificacion > actual.codIdentificacion) do begin
            v[j+1] := v[j];
            j := j-1;
       end;
       v[j+1] := actual;
    end;
End; }

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

{Procedure InsertarOrdenado(var L : Lista; p : pelicula);
var
  ant,act,nue : Lista;
Begin
  new(nue);
  nue^.dato := p;
  act := L;
  ant := L;
  while (act <> nil) and (act^.dato.codGenero < p.codGenero) do begin
    ant := act;
    act := act^.sig;
  end;
  if(ant = act) then
    L := nue
  else
    ant^.sig := nue;
  nue^.sig := act;
End; }


Procedure AgregarAlFinal2(var L,ult : Lista; p : pelicula);
var
  nue:Lista;
Begin
  new(nue);
  nue^.dato:=p;
  nue^.sig:=nil;
  if (L <> nil)then
    ult^.sig := nue
  else
    L := nue;
  ult:=nue;
End;

Procedure InicializarVectorDeListas(var vec : vectorLista);
var
  i : rango;
Begin
  for i := 1 to dimF do 
    vec[i] := nil;  //inicializa en nil cada posicion del vector de listas
End;

Procedure CargarVectorListaPeliculas(var vec : vectorLista; var dimL : integer);
var
  p : pelicula;
  ult : Lista;
Begin
  dimL := 0;
  ult := nil;
  InicializarVectorDeListas(vec);
  LeerPelicula(p);
  while (p.codPelicula <> fin) do begin
    dimL := dimL +1;
    AgregarAlFinal2(vec[p.codGenero],ult,p);  // se almacena por orden de llegada y agrupados por código de género
    LeerPelicula(p);
  end;
End;

Procedure GenerarNuevoVector(var vecP : vector2; vecL : vectorLista; dimL : integer);
var
  i : integer;
  promMax : real;
Begin
  for i := 1 to dimL do begin
    promMax := -1;
    while (vecL[i] <> nil) do begin
      if(vecL[i]^.dato.puntajeProm > promMax) then begin
        promMax := vecL[i]^.dato.puntajeProm;
        //Asigno los datos del registro del vector de listas al nuevo vector
        vecP[i].puntajeProm := vecL[i]^.dato.puntajeProm;
        vecP[i].codPelicula := vecL[i]^.dato.codPelicula;
      end;
      vecL[i] := vecL[i]^.sig;
    end;
  end;
End;

Procedure ImprimirVectorDeListas(vecL: vectorLista; dimL : integer);
var
  i : integer;
Begin
  for i := 1 to dimL do begin
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

Procedure imprimirVector(vecP : vector2);
var
  i : integer;
Begin
  for i := 1 to dimF do 
    writeln('el codigo de pelicula con puntaje maximo del codigo de genero ',i,' es: ', vecP[i].codPelicula);
End;

Procedure ImprimirVectorOrdenado(vecP : vector2);
var
  i : rango;
Begin
  for i := 1 to dimF do begin
    writeln('Posicion del vector NRO: ' ,i);
    writeln('Codigo de pelicula : ' ,vecP[i].codPelicula);
    writeln('puntaje Promedio : ' ,vecP[i].puntajeProm:2:2);
    writeln('-------------------------------------------');
  end;
End;

//P.P
VAR
  dimL : integer;
  vecL : vectorLista;
  vecP : vector2;
BEGIN
  CargarVectorListaPeliculas(vecL,dimL);
  ImprimirVectorDeListas(vecL,dimL);

  GenerarNuevoVector(vecP,vecL,dimL);
  imprimirVector(vecP);
 
  OrdenarVectorSeleccion(vecP,dimL);
  ImprimirVectorOrdenado(vecP);
  //Se ordenan los codigos de identificación del vector
  //OrdenarVectorInsercion(vec,dimL);  
  //OrdenarVectorSeleccion(vec,dimL);

END.