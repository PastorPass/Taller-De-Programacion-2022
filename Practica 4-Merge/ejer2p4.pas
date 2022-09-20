{2. Un cine posee la lista de películas que proyectará durante el mes de octubre.
De cada película se conoce: código de película,
código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) 
y puntaje promedio otorgado por las críticas. Implementar un programa que contenga: 

a. Un módulo que lea los datos de películas y los almacene ordenados por código de película y agrupados por código de género,
en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de película -1.  

b. Un módulo que reciba la estructura generada en el punto a y retorne una estructura de datos donde 
estén todas las películas almacenadas ordenadas por código de película.}

Program uno;
const
  tope = 8;
  fin = -1; //Condicion de corte para el codigo de pelicula
type
  rangoGeneros = 1..tope;
  pelicula = record
                codPelicula : integer;
                codGenero : rangoGeneros;
                puntajePromedio : real;
             end;
  
  Lista =^nodo;
  nodo = record
            dato : pelicula;
            sig :Lista;
         end; 
  
  vectorListas = array[rangoGeneros] of Lista;

//Procesos-Funciones

Procedure InicializarVectorListas(var vecL : vectorListas);
var
  i : rangoGeneros;
Begin
  for i := 1 to tope do 
    vecL[i] := nil;
End;

Procedure LeerPelicula(var p : pelicula);
Begin
  with p do begin
    writeln('Ingrese codigo de pelicula');
    readln(codPelicula);
    if (codPelicula <> fin) then begin
      writeln('Ingrese codigo de genero (1..8)');
      readln(codGenero);
      writeln('Ingrese puntaje promedio otorgado x las criticas');
      readln(puntajePromedio);
    end;
  end;
End;

Procedure InsertarOrdenado(var UnaLista : Lista; p : pelicula);
var
  aux,ant,act : Lista;
Begin
  new(aux);
  aux^.dato := p;
  act := UnaLista;
  ant := UnaLista;
  while (act <> nil) and (act^.dato.codPelicula < p.codPelicula) do begin
    ant := act;
    act := act^.sig;
  end;
  
  if(ant = act) then 
    UnaLista := aux
  else
    ant^.sig := aux;
  aux^.sig := act;
End;

Procedure CargarVectorListas(var vecL : vectorListas);
var
  p :pelicula;
Begin
  InicializarVectorListas(vecL);
  LeerPelicula(p);
  while (p.codPelicula <> fin) do begin
    InsertarOrdenado(vecL[p.codGenero],p);  // almacene ordenados por código de película y agrupados por código de género,
    LeerPelicula(p);
  end;
End;

Procedure ImprimirNuevaLista(L : Lista);
Begin
  while (L <> nil) do begin
    writeln('Codigo de pelicula = ' , L^.dato.codPelicula);
    writeln('Codigo de Genero = ' , L^.dato.codGenero);
    writeln('puntaje promedio = ' , L^.dato.puntajePromedio:2:2);
    writeln('---------------------------------------------');
    L := L^.sig;
  end;
End;

Procedure Minimo(var vecL : vectorListas; var pMin : pelicula);  // el vector de listas se pasa x referencia
var
  indiceMin,i : integer;
Begin
  pMin.codPelicula := 9999;  //inicializo en un codigo de pelicula hasta donde quiera que guarde un maximo de cod de pelicula
  indiceMin := -1;
  for i := 1 to tope do begin
    if (vecL[i] <> nil) then begin
      if(vecL[i]^.dato.codPelicula <= pMin.codPelicula) then begin
        indiceMin := i;
        pMin := vecL[i]^.dato;
      end;
    end;
  end;
  
  if (indiceMin <> -1) {(pMin.codPelicula <> 999)} then begin
    pMin := vecL[indiceMin]^.dato;  //guardo el registro para ser usado en la carga de la nueva lista
    vecL[indiceMin] := vecL[indiceMin]^.sig;
  end; 
End;


Procedure Merge(vecL : vectorListas; var L : Lista);  //Una carga de lista + METODO MERGE
var
  pMin : pelicula;
Begin
  Minimo(vecL,pMin); 
  while  (pMin.codPelicula <> 9999) do begin
    InsertarOrdenado(L,pMin);
    Minimo(vecL,pMin);
  end;
End;

//P.P

//Como en el inciso a) se generan 8 listas que se almacenan ordenadas ordenadas x codigo de pelicula.
//Se debe aprovechar ese orden para generar otra lista utilizando merge.
VAR
  vecL : vectorListas;
  L : Lista;
BEGIN
  CargarVectorListas(vecL);
  L := nil;
  Merge(vecL,L);  //Saca de las 8 listas ( o vector de listas) ordenas x algun criterio la informacion de sus registros  para ser almacenada y ordenada x algun criterio en otra lista que contiene todos los registros de sus 8 listas.
  writeln('DATOS DE PELICULAS DE LA NUEVA LISTA');
  writeln('ORDENADAS POR CODIGO DE PELICULA');
  ImprimirNuevaLista(L);
END.