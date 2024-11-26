Program TPGrupoX; 
Uses
     sysutils;
Type
     str70= string[70];
     
	 jugador = record
        DNI: longint;
	    nombre_apellido: str70;
        seleccion: str70;
	    goles: integer;
     end ;

     lista = ^nodoLista;
     nodoLista = record
	    dato: jugador;
	    sig: lista;
     end ;

	fecha=record
		dia:1..31;
		mes:1..12;
		anio:integer;
	end ;
	
    partido= record
		codigo: longint;
		seleccion_l: str70;
		seleccion_2: str70;
		fecha_partido: fecha;
        estadio: str70;
		goleadores: lista;
     end ;

     listaPartidos = ^nodoPartidos;
     nodoPartidos = record
            dato: partido;
            sig: listaPartidos;
     end ;

     nombres= array [1..20] of str70;

     {Completar con los tipos de datos necesarios}

procedure cargarFecha(var f: fecha);
begin
  f.dia:= random(30)+1;
  f.mes := random(1)+6;
  if((f.mes = 6) and (f.dia = 31))then
            f.dia := 30;
  f.anio:=2024;
end ;

Procedure agregar(var l: listaPartidos; p: partido);
var
   aux: listaPartidos;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end ;

Procedure agregarJugador(var l: lista; j: jugador);
var
   aux: lista;
begin
     new(aux);
     aux^.dato := j;
     aux^.sig := l;
     l:= aux;
end ;

procedure cargarEquipos(var v:nombres );
begin
     v[1]:='Argentina';
     v[2]:='Brasil';
     v[3]:='Colombia';
     v[4]:='Canada';
     v[5]:='Ecuador';
     v[6]:='Peru';
     v[7]:='Chile';
     v[8]:='Bolivia';
     v[9]:='Venezuela';
     v[10]:='Mexico';
     v[11]:='Costa Rica';
     v[12]:='Estados Unidos';
     v[13]:='Jamaica';
     v[14]:='Panama';
     v[15]:='Paraguay';
     v[16]:='Uruguay';
end ;

procedure cargarJugadores(var l: lista; local, visitante:str70);
var
   j: jugador;
   cant, i, pos, loc_vis: integer;
   v: nombres;
begin
     cant := random(3);
     v[1]:='Lionel Perez';
     v[2]:='Martin Fernandez';
     v[3]:='Mariano Gomez';
     v[4]:='Alejandro Gonzalez';
     v[5]:='Fermin Martinez';
     v[6]:='Nicolas Castro';
     v[7]:='Gonzalo Villareal';
     v[8]:='Tadeo Parodi';
     v[9]:='Juan Pablo Silvestre';
     v[10]:='Mariano Sanchez';
     v[11]:='Alejo Monden';
     v[12]:='Agustin Paz';
     v[13]:='Juan Salto';
     v[14]:='Matias Pidone';
     v[15]:='Luis Hernandez';
     v[16]:='Cristian Herrera';
     v[17]:='Santiago Manzur';
     v[18]:='Julian Darino';
     v[19]:='Victor Abila';
     v[20]:='Luciano Segura';
     if((local='Argentina')or(visitante='Argentina'))then
     begin
        with(j) do begin
           DNI := 34807474;
           nombre_apellido:='Leandro Romanut';
		   seleccion:='Argentina';
		   goles:=random(3)+1;
        end ;
        agregarJugador(l, j);
     end ;
     for i:=1 to cant do
     begin
       with(j) do begin
          DNI := random(18000000)+20000000;
          pos:= random(20)+1;
          nombre_apellido:= v[pos];
          loc_vis:= random(2)+1;
          if(loc_vis=1)then
            seleccion:=local
          else
            seleccion:=visitante;
	      goles:=random(3)+1;
       end ;
       agregarJugador(l, j);
     end ;
end ;

procedure crearLista(var l: listaPartidos);
var
   p: partido;
   cant,i,pos,loc,vis: integer;
   v, v2: nombres;
begin
     cant := random(30)+1;
     v[1]:= 'Mercedes-Benz Stadium';
     v[2]:= 'Levi`s Stadium';
     v[3]:= 'Bank of America Stadium';
     v[4]:= 'State Farm Stadium';
     v[5]:= 'SoFi Stadium';
     v[6]:= 'Inter&Co Stadium';
     v[7]:= 'NRG Stadium';
     v[8]:= 'Q2 Stadium';
     v[9]:= 'AT&T Stadium';
     v[10]:= 'MetLife Stadium';
     v[11]:= 'Allegiant Stadium';
     v[12]:= 'Arrowhead Stadium';
     v[13]:= 'Children`s Mercy Park';
     v[14]:= 'Hard Rock Stadium';
     cargarEquipos(v2);
     for i:=1 to cant do
     begin
          with(p) do begin
               codigo:= random (100000)+1;
               pos:= random(14)+1;
               estadio:= v[pos];
               loc:= random(16)+1;
               seleccion_l:=v2[loc];
               vis:= random(16)+1;
               seleccion_2:=v2[vis];
               while(seleccion_l=seleccion_2)do
               begin
                   vis:= random(16)+1;
                   seleccion_2:=v2[vis];
               end ;
               cargarFecha(fecha_partido);
               goleadores:= nil;
               cargarJugadores(goleadores, seleccion_l, seleccion_2);
          end ;
          agregar(l, p);
       end ;
end ;


procedure imprimirJugador(j: jugador);
begin
     with (j) do begin
          writeln('JUGADOR: ', nombre_apellido, ' | DNI: ',DNI, ' | SELECCION: ', seleccion, ' | GOLES: ', goles);
     end ;
end ;

procedure imprimirJugadores(l: lista);
begin
     while (l <> nil) do begin
          imprimirJugador(l^.dato);
          l:= l^.sig;
     end ;
end ;

procedure imprimir(p: partido);
begin
     with (p) do begin
          writeln('');
          writeln('PARTIDO: ', codigo, ' | SELECCION 1: ',seleccion_l, ' | SELECCION 2: ', seleccion_2, ' | FECHA: ', fecha_partido.dia,'/',fecha_partido.mes,'/',fecha_partido.anio, ' | ESTADIO: ', estadio);
          imprimirJugadores(goleadores);
     end ;
end ;

procedure imprimirLista(l: listaPartidos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end ;
end ;


var
   l: listaPartidos;
begin
     Randomize;

     l:= nil;
     crearLista(l); {carga automatica de la estructura disponible}
     writeln ('LISTA GENERADA: ');
     imprimirLista(l);

     {Completar el programa}

     writeln('Fin del programa');
     readln;
end.
