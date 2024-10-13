Program grupo11 ; 
Type
	TCadena70= string[70];
	
	TJugador = record
		DNI: longint;
		nombre_apellido: TCadena70;
		seleccion: TCadena70;
		goles: integer;
	end ;

	TListaGoleadores = ^TNodoListaGoleadores;
	
	TNodoListaGoleadores = record
		jugador: TJugador;
		sig: TListaGoleadores;
	end ;

	TFecha=record
		dia:1..31;
		mes:1..12;
		anio:integer;
	end ;
	
    TPartido= record
		codigo: longint;
		seleccion_l: TCadena70;
		seleccion_2: TCadena70;
		fecha: TFecha;
		estadio: TCadena70;
		goleadores: TListaGoleadores;
	end ;

	TListaPartidos = ^TNodoPartidos;
     
	TNodoPartidos = record
		partido: TPartido;
		sig: TListaPartidos;
	end ;

	TNombres= array [1..20] of TCadena70;

     {Completar con los tipos de datos necesarios}

	//
		TPartidoArbol = record
			codigo  : LongInt   ;
			fecha   : TFecha    ;
			estadio : TCadena70 ;
			goles   : Integer   ;
		end ;
	
		TListaPartidosArbol = ^TNodoListaPartidosArbol ;
		
		TNodoListaPartidosArbol = record
			partido : TPartidoArbol       ;
			sig      : TListaPartidosArbol ; 
		end ;
	
		TJugadorArbol = record
			nombre_apellido : TCadena70           ;
			DNI             : LongInt             ;
			seleccion       : TCadena70           ;
			partidos        : TListaPartidosArbol ;
		end ;

		TArbol = ^TNodoArbol ;
		
		TNodoArbol = record
			jugador : TJugadorArbol ;
			hijoIzq : TArbol        ;
			hijoDer : TArbol        ;
		end ;
		
		TListaSeleccionesConGoles = ^TNodoListaSeleccionesConGoles ;
		
		TNodoListaSeleccionesConGoles = record
			seleccion : TCadena70                 ;
			sig       : TListaSeleccionesConGoles ;
		end ;
	//

// creado por nosotros
    // procedure separador ( n : Integer ) ;
        procedure separador ( n : Integer ) ;
        var
            i : Integer ;

        begin
            for i := 1 to n do
            begin
                WriteLn ;
            end ;
        end ;
    //

    // procedure incrementar ( var a : Integer ) ;
        procedure incrementar ( var a : Integer ) ;
        begin
            a := ( a + 1 ) ;
        end ;
    //

    // procedure sumar ( var a : Integer ; b : Integer ) ;
        procedure sumar ( var a : Integer ; b : Integer ) ;
        begin
            a := ( a + b ) ;
        end ;
    //
//

procedure cargarFecha(var f: TFecha);
begin
  f.dia:= random(30)+1;
  f.mes := random(1)+6;
  if((f.mes = 6) and (f.dia = 31))then
            f.dia := 30;
  f.anio:=2024;
end ;

Procedure agregar(var LP: TListaPartidos; p: TPartido);
var
   aux: TListaPartidos;
begin
     new(aux);
     aux^.partido := p;
     aux^.sig := LP;
     LP:= aux;
end ;

Procedure agregarJugador(var LG: TListaGoleadores; j: TJugador);
var
   aux: TListaGoleadores;
begin
     new(aux);
     aux^.jugador := j;
     aux^.sig := LG;
     LG:= aux;
end ;

procedure cargarEquipos(var v:TNombres );
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

procedure cargarJugadores(var LG: TListaGoleadores; local, visitante:TCadena70);
var
   j: TJugador;
   cant, i, pos, loc_vis: integer;
   v: TNombres;
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
        agregarJugador(LG, j);
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
       agregarJugador(LG, j);
     end ;
end ;


procedure crearLista(var LP: TListaPartidos);
var
   p: TPartido;
   cant,i,pos,loc,vis: integer;
   v, v2: TNombres;
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
               cargarFecha(fecha);
               goleadores:= nil;
               cargarJugadores(goleadores, seleccion_l, seleccion_2);
          end ;
          agregar(LP, p);
       end ;
end ;


procedure imprimirJugador(j: TJugador);
begin
     with (j) do begin
          writeln('JUGADOR: ', nombre_apellido, ' | DNI: ',DNI, ' | SELECCION: ', seleccion, ' | GOLES: ', goles);
     end ;
end ;

procedure imprimirJugadores(LG: TListaGoleadores);
begin
     while (LG <> nil) do begin
          imprimirJugador(LG^.jugador);
          LG:= LG^.sig;
     end ;
end ;

procedure imprimir(p: TPartido);
begin
     with (p) do begin
          writeln('');
          writeln('PARTIDO: ', codigo, ' | SELECCION 1: ',seleccion_l, ' | SELECCION 2: ', seleccion_2, ' | FECHA: ', fecha.dia,'/',fecha.mes,'/',fecha.anio, ' | ESTADIO: ', estadio);
          imprimirJugadores(goleadores);
     end ;
end ;

procedure imprimirLista(LP: TListaPartidos);
begin
     while (LP <> nil) do begin
          imprimir(LP^.partido);
          LP:= LP^.sig;
     end ;
end ;

// creado por nosotros
	procedure inicializarEstructuras ( var arbol : TArbol;var LSCG : TListaSeleccionesConGoles ) ;
	begin
		arbol := Nil ;
		LSCG  := Nil ;
	end ;

	procedure agregarAListaPartidos ( var LPA : TListaPartidosArbol ; partido : TPartido ) ;
	var
		nue : TListaPartidosArbol ;

	begin
		if ( LPA = Nil ) then
		begin
			New( nue ) ;

			nue^.partido.codigo  := partido.codigo                    ;
			nue^.partido.fecha   := partido.fecha                     ;
			nue^.partido.estadio := partido.estadio                   ;
			nue^.partido.goles   := partido.goleadores^.jugador.goles ;
			nue^.sig             := Nil                               ;

			LPA := nue ;
		end else
		begin
			agregarAListaPartidos( LPA^.sig , partido ) ;
		end ;
	end ;

	procedure insertar ( var arbol : TArbol ; partido : TPartido ) ;
	var
		nue : TArbol ;

	begin
		if ( arbol <> Nil ) then
		begin
			if ( partido.goleadores^.jugador.DNI = arbol^.jugador.DNI ) then
			begin
				agregarAListaPartidos ( arbol^.jugador.partidos , partido ) ;
			end
			else if ( partido.goleadores^.jugador.DNI < arbol^.jugador.DNI ) then
			begin
				insertar( arbol^.hijoIzq , partido ) ;
			end else
			begin
				insertar( arbol^.hijoDer , partido ) ;
			end ;
		end else
		begin
			New( nue ) ;

			nue^.jugador.DNI             := partido.goleadores^.jugador.DNI             ;
			nue^.jugador.nombre_apellido := partido.goleadores^.jugador.nombre_apellido ;
			nue^.jugador.seleccion       := partido.goleadores^.jugador.seleccion       ;
			nue^.jugador.partidos        := Nil                                         ;
			nue^.hijoIzq                 := Nil                                         ;
			nue^.hijoDer                 := Nil                                         ;
			
			arbol := nue ;

			agregarAListaPartidos( arbol^.jugador.partidos , partido ) ;
		end ;
	end ;

	procedure generarArbol ( var arbol : TArbol ; LP : TListaPartidos ) ;
	begin
		if ( LP <> Nil ) then
		begin
			insertar     ( arbol , LP^.partido ) ;
			generarArbol ( arbol , LP^.sig     ) ;
		end ;
	end ;

    procedure graficarArbol ( arbol : TArbol ; espacio : Integer ; nivel : Integer ; var nivelAnt : Integer ) ;
    var
        i : Integer ;

    begin
        if (arbol <> Nil) then
        begin
        if ( nivel <= nivelAnt ) then
        begin
            separador( 2 ) ;

            for i := 1 to (espacio - 1) do
            begin
            Write ( '-' ) ;
            end ;
            
            Write( ' ^' ) ;

            separador( 1 ) ;
            for i := 1 to espacio do
            begin
            Write ( ' ' ) ;
            end ;

            Write ( '|' ) ;

            separador( 2 ) ;

            nivelAnt := ( nivel - 1 ) ;
        end ;

        Write ( 'Nivel: ' , nivel ) ;

        for i := 1 to (espacio - 8) do
        begin
            Write ( ' ' ) ;
        end ;

        WriteLn ( arbol^.jugador.DNI ) ;
        
        for i := 1 to (espacio - 1) do
        begin
            Write ( ' ' ) ;
        end ;

        WriteLn ( '/    \' ) ;

        nivel    := ( nivel    + 1 ) ;
        nivelAnt := ( nivelAnt + 1 ) ;

        graficarArbol( arbol^.hijoIzq, (ESPACIO - 5) , nivel , nivelAnt ) ;
        graficarArbol( arbol^.hijoDer, (ESPACIO + 5) , nivel , nivelAnt ) ;
        end ;
    end ;

	function cantidadDeGoles ( LPA : TListaPartidosArbol ; cantGoles : Integer ) : Integer ;
	begin
		if ( LPA <> Nil ) then
		begin
			sumar( cantGoles , LPA^.partido.goles ) ;

			cantidadDeGoles := cantidadDeGoles( LPA^.sig , cantGoles ) ;
		end else
		begin
			cantidadDeGoles := cantGoles ;
		end ;
	end ;

	procedure informarAcotado ( arbol : TArbol ; inf : LongInt ; sup : LongInt ) ;
	begin
		if ( arbol <> Nil ) then
		begin
			if ( (inf <= arbol^.jugador.DNI ) and (arbol^.jugador.DNI <= sup) ) then
			begin
				informarAcotado( arbol^.hijoDer , inf , sup ) ;
				
				separador ( 1                                                                       ) ;
				WriteLn   ( 'DNI                 ' , arbol^.jugador.DNI                             ) ;
				WriteLn   ( 'nombre y apellido   ' , arbol^.jugador.nombre_apellido                 ) ;
				WriteLn   ( 'Cantidad de goles   ' , cantidadDeGoles( arbol^.jugador.partidos , 0 ) ) ;

				informarAcotado( arbol^.hijoIzq , inf , sup ) ;
			end
			else if ( arbol^.jugador.DNI < inf ) then
			begin
				informarAcotado( arbol^.hijoDer , inf , sup ) ;
			end else
			begin
				informarAcotado( arbol^.hijoIzq , inf , sup ) ;
			end ;
		end ;
	end ;

	function cumpleEstadio ( estadio : TCadena70 ) : Boolean ;
	begin
		if ( (estadio = 'MetLife Stadium') or (estadio = 'Bank of America Stadium') or (estadio = 'Inter&Co Stadium') ) then
		begin
			cumpleEstadio := True ;
		end else
		begin
			cumpleEstadio := false ;
		end ;
	end ;
    
	function cumpleFecha ( fecha : TFecha ) : Boolean ;
	begin
		if ( ((6 = fecha.mes) and (15 <= fecha.dia)) or ((7 = fecha.mes) and (fecha.dia <= 15)) ) then
		begin
			cumpleFecha := True ;
		end else
		begin
			cumpleFecha := False ;
		end ;
	end ;
    
    procedure agregarAListaSeleccionesConGoles ( var LSCG : TListaSeleccionesConGoles ; seleccion : TCadena70 ) ;
    var
		nue : TListaSeleccionesConGoles ;
		
    begin
		if ( LSCG = Nil ) then
		begin
			New( nue ) ;
			
			nue^.seleccion := seleccion ;
			nue^.sig       := Nil       ;
			
			LSCG := nue ;
		end
		else if ( seleccion < LSCG^.seleccion ) then
		begin
			New( nue ) ;
		
			nue^.seleccion := seleccion ;
			nue^.sig       := LSCG      ;
			
			LSCG := nue ;
		end
		else if ( (LSCG^.seleccion < seleccion) ) then
		begin
			if ( seleccion < LSCG^.sig^.seleccion ) then
			begin
				New( nue ) ;
				
				nue^.seleccion := seleccion ;
				nue^.sig       := LSCG^.sig ;
				
				LSCG^.sig := nue ;
			end else
			begin
				agregarAListaSeleccionesConGoles( LSCG^.sig , seleccion) ;
			end ;
		end ;
    end ;
    
    procedure generarListaSeleccionesConGoles ( var LSCG : TListaSeleccionesConGoles ; arbol : TArbol ) ;
    begin
		if ( arbol <> Nil ) then
		begin
			if ( cumpleFecha(arbol^.jugador.partidos^.partido.fecha) and cumpleEstadio(arbol^.jugador.partidos^.partido.estadio)) then
			begin
				agregarAListaSeleccionesConGoles( LSCG , arbol^.jugador.seleccion ) ;
			end ;			
		end ;
    end ;
    
    procedure imprimirSeleccionConGol ( LSCG : TListaSeleccionesConGoles ) ;
    begin
		if ( LSCG <> Nil ) then
		begin
			writeLn( LSCG^.seleccion ) ;
		end ;
    end ;
    
    procedure imprimirSeleccionesConGoles( LSCG : TListaSeleccionesConGoles ) ;
    begin
		if ( LSCG <> Nil ) then
		begin
			writeln                 ( 'Selecciones con gol entre el 15 de junio y 15 de julio:' ) ;
			imprimirSeleccionConGol ( LSCG                                                      ) ;
		end else
		begin
			writeln( 'No se realizaron goles en ninguno de esos estadios entre esas fechas' ) ;
		end ;
    end ;
    
    function nodoMax ( arbol : TArbol ) : TArbol ;
	  begin
		if ( arbol^.hijoDer = Nil ) then
		begin
		  nodoMax := arbol ;
		end
		else
		begin
		  nodoMax := nodoMax( arbol^.hijoDer ) ;
		end ;
	  end ;
    
    procedure eliminar ( var arbol : TArbol ; DNI : LongInt ) ;
	  var
		aux : TArbol ;

	  begin
		if ( arbol <> Nil ) then
		begin
		  if ( DNI = arbol^.jugador.DNI ) then
		  begin
			aux := arbol ;

			if ( arbol^.hijoIzq = Nil ) then
			begin
			  arbol := arbol^.hijoDer ;
			end
			else if ( arbol^.hijoDer = Nil ) then
			begin
			  arbol := arbol^.hijoIzq ;
			end
			else
			begin
			  nodoMax( arbol^.hijoIzq )^.hijoDer := arbol^.hijoDer ;
			  arbol                              := arbol^.hijoIzq ;
			end ;

			Dispose( aux ) ;
		  end
		  else if ( DNI < arbol^.jugador.DNI ) then
		  begin
			eliminar( arbol^.hijoIzq , DNI ) ;
		  end
		  else
		  begin
			eliminar( arbol^.hijoDer , DNI ) ;
		  end ;
		end ;
	  end ;

	procedure menu ( var opcion : Integer ; var arbol : TArbol ; var LSCG : TListaSeleccionesConGoles ; LP : TListaPartidos ) ;
	var
		nivelAnt : Integer ;
		repetir  : Boolean ;

	begin
		separador ( 3                                       ) ;
		WriteLn   ( 'Menu: '                                ) ;
		WriteLn   ( '    1. Reiniciar estructuras'          ) ;
		WriteLn   ( '    2. Generar Arbol'                  ) ;
		WriteLn   ( '    3. Imprimir arbol'                 ) ;
		WriteLn   ( '    4. imprimir acotado'               ) ;
		WriteLn   ( '    5. imprimir Selecciones Con Goles' ) ;
		WriteLn   ( '    6. eliminar jugador 34807474'      ) ;
		separador ( 1                                       ) ;
		WriteLn   ( '    0. Finalizar programa'             ) ;


		repeat
			separador ( 1          ) ;
			Write     ( 'Opcion: ' ) ;
			ReadLn    ( opcion     ) ;

			repetir := ( (opcion < 0) or (6 < opcion) ) ;

			if ( repetir ) then
			begin
				separador ( 1                 ) ;
				WriteLn   ( 'Numero invalido' ) ;
			end ;
		until( not repetir ) ;

		separador( 3 ) ;

		case opcion of
			0:
				begin
					WriteLn( 'Programa Finalizado' ) ;
				end ;
			1:
				begin
					WriteLn                ( 'estructuras inicializadas' ) ;
					inicializarEstructuras ( arbol , LSCG                ) ;
				end ;
			2:
				begin
					generarArbol( arbol , LP ) ;
				end ;
			3:
				begin
					if ( arbol <> Nil ) then
					begin
						nivelAnt := -1 ;
						graficarArbol( arbol , 90 , 0 , nivelAnt ) ;
					end else
					begin
						WriteLn( 'Arbol esta vacio' ) ;
					end ;
				end ;
			4: 
				begin
					if ( arbol <> Nil ) then
					begin
						informarAcotado( arbol , 28000000 , 32000000 ) ;
					end else
					begin
						WriteLn( 'Arbol vacio' ) ;
					end ;
				end ;
			5:
				begin
					if ( arbol <> Nil ) then
					begin
						imprimirSeleccionesConGoles ( LSCG ) ;
					end else
					begin
						WriteLn( 'Arbol vacio' ) ;
					end ;
				end ;
			6:
				begin
					if ( arbol <> Nil ) then
					begin
						nivelAnt := -1 ;
						graficarArbol( arbol , 90 , 0 , nivelAnt ) ;
						
						eliminar( arbol , 34807474 ) ;
						
						nivelAnt := -1 ;
						graficarArbol( arbol , 90 , 0 , nivelAnt ) ;
					end else
					begin
						WriteLn( 'Arbol vacio' ) ;
					end ;
				end ;
		end ;
	end ;
//     
	
//
var
   LP: TListaPartidos;
   
   // creado por nosotros
	opcion : Integer ;
	arbol  : TArbol  ;
	LSCG   : TListaSeleccionesConGoles ;
   //
begin
     Randomize;

     LP:= nil;
     crearLista(LP); {carga automatica de la estructura disponible}
     writeln ('LISTA GENERADA: ');
     imprimirLista(LP);

     {Completar el programa}
     
     // creado por nosotros
     
		inicializarEstructuras ( arbol , LSCG ) ;
		
		repeat
			menu( opcion , arbol , LSCG , LP ) ;
		until( opcion = 0 ) ;
     //

     writeln('Fin del programa');
     readln;
end.