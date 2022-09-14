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

d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de película con menor puntaje.}

Program uno;
const
  fin = -1;  // condicion de corte para el cod de pelicula
type
  rangoGeneros = 1..8;
  pelicula = record
                cod :  integer;
                codGenero : rangoGeneros;
                puntajeProm : real;
             end;
             
  Lista = ^nodo;
  nodo = record
            dato : pelicula;
            sig : Lista;
         end;
  
  vectorLista = array[rangoGeneros] of Lista;  //Lea los datos de películas y los almacene por orden de llegada y agrupados por código de género, 
                                              //en una estructura de datos adecuada.
                                              
  vectorPeliculas = array[rangoGeneros] of pelicula;
//procesos-Funciones

Procedure InicializarVectorListas(var vec : vectorLista);
var
  i : rangoGeneros;
Begin
  for i := 1 to 8 do 
    vec[i] := nil;
End;

Procedure LeerPelicula(var p : pelicula);
Begin
  with p do begin
    writeln('Ingrese codigo de pelicula');
    readln(cod);
    if (cod <> fin) then begin
      writeln('ingrese codigo de genero de la pelicula(1..8)');
      readln(codGenero);
      writeln('Ingrese puntaje promedio otorgado x las criticas');
      readln(puntajeProm);
    end;
  end;
End;

Procedure AgregarAdelante(var UnaLista : Lista; p : pelicula);
var
  aux : Lista;
Begin
  new (aux);
  aux^.dato := p;
  aux^.sig := UnaLista;
  UnaLista := aux;
End;

Procedure CargarVectorLista(var vec : vectorLista);
var
  p : pelicula;
Begin
  InicializarVectorListas(vec);  //Siempre se debe inicializar el vector de listas
  LeerPelicula (p);
  while (p.cod <> fin) do begin
    AgregarAdelante(vec[p.codGenero],p);  //vec[p.codGenero] es una ubicacion de una lista y se pide almacenar y agrupar x codGenero
    LeerPelicula(p);
  end;
End;

Procedure ImprimirVectorLista(vec : vectorLista);
var
  i : rangoGeneros;
Begin
  for i := 1 to 8 do begin
    writeln('------Lista nro : '   , i ,'------');
    while (vec[i] <> nil) do begin
      writeln('Codigo de pelicula : ' ,vec[i]^.dato.cod);
      writeln('codigo de genero : ' , vec[i]^.dato.codGenero);
	  writeln('Puntaje promedio otorgado : ' , vec[i]^.dato.puntajeProm:2:2);
	  vec[i]:= vec[i]^.sig;
	end;
  end;
End;

Procedure SacarMaximoPuntajeyCod(unPuntajeProm : real; unCodPelicula : integer; var max : real;var maxCod : integer);

Begin
  if (unPuntajeProm > max) then begin
    max := unPuntajeProm;
    maxCod := unCodPelicula;
  end;
End;

Procedure  Asignacion(var p : pelicula; max : real; unCodP : integer; uncodGenero : integer);
Begin
  if (max <> -1) then begin
    p.cod := unCodP;
    p.puntajeProm := max;
    p.codGenero := uncodGenero;
  end;
End;

Procedure AgregarEnVector(var vecP : vectorPeliculas; p : pelicula; i : integer);
Begin
  if (i <>0) then 
    vecP[i] := p;
End;

Procedure CargarVectorPeliculas(vec : vectorLista; var vecP : vectorPeliculas);
var
  i : integer;
  max : real;
  unCodP : integer;
  p : pelicula;
Begin
  for i := 1 to 8 do begin
    max := -1;
    unCodP := 0;
   { writeln('DEBUGGING');
    writeln('Lista nro ' , i); }
    while (vec[i] <> nil) do begin
      SacarMaximoPuntajeyCod(vec[i]^.dato.puntajeProm,vec[i]^.dato.cod,max,unCodP);
      
      if (max <> -1) then begin
        Asignacion(p,max,unCodP,vec[i]^.dato.codGenero);
        AgregarEnVector(vecP,p,i);
      end;
      vec[i] := vec[i]^.sig;
    end;
  end;
End;

Procedure ImprimirVectorPeliculas(vecp : vectorPeliculas);
var
  i : rangoGeneros;
Begin
  writeln('---------Vector de películas---------');
  for i := 1 to 8 do begin
    writeln('----------------------------------------');
    writeln('Genero nro : ' , i);
    if (vecP[i].cod <> 0) and (vecP[i].puntajeProm <> 0)  then begin
      writeln('Puntaje promedio otorgado maximo : ' , vecP[i].puntajeProm:2:2);
      writeln('codigo de pelicula : ' , vecP[i].cod);
    end
    else
      writeln('No hubo datos en este genero');

  end;
End;

Procedure OrdenarVector(var vecP : vectorPeliculas);
var 
  i,j,p : integer;
  item : pelicula;
Begin
  for i := 1 to 8-1  do begin
    p := i;
    for j := i+1 to 8 do 
      if (vecP[j].puntajeProm < vecP[p].puntajeProm) then 
        p := j;
    item := vecP[p];
    vecP[p] := vecP[i];
    vecP[i] := item;
  end;
End;

Procedure InformarMaxyMinPuntajes(vecP : vectorPeliculas);
var
  i : integer;
Begin
  i := 1;
  while (vecP[i].puntajeProm = 0 ) and (vecP[i].cod = 0) do
    i := i+1;
  writeln('posicion del vector NRO : ' , i );
  writeln('---Minimo---');
  writeln('El codigo de pelicula con menor puntaje es : ' , vecP[i].cod , ' ,y su puntaje = ' , vecP[i].puntajeProm:2:2);
  
  //sabiendo que el vector esta ordenado y la ultima posicion esta cargada 
  writeln('---Maximo---');
  writeln('El codigo de pelicula con mayor puntaje es : ' , vecP[8].cod , ' ,y su puntaje = ' , vecP[8].puntajeProm:2:2);

End;

//P.P
VAR
  vec : vectorLista;
  vecP : vectorPeliculas;
BEGIN
  CargarVectorLista(vec);
  ImprimirVectorLista(vec);
  CargarVectorPeliculas (vec,vecP);
  ImprimirVectorPeliculas(vecP);
  
  //Estoy suponiendo el caso en el que todo el vector esta cargado y que no requiere de una dimL
  //el vector contiene posiciones sin elementos pero luego del ordenar se deja de lado las posiciones vacias
  OrdenarVector(vecP);
  writeln('------VECTOR ORDENADO X CRITERIO DE PUNTAJES PROMEDIOS------');
  ImprimirVectorPeliculas(vecP);  //Todas las posiciones vacias quedan ordenadas de menor a mayor
  InformarMaxyMinPuntajes(vecP);
END.