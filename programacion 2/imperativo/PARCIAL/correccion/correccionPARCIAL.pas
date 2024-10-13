Program correccionPARCIAL; 
Type
	// creado por ellos
		TCadena70 = string[ 70 ] ;
		
		TJugador = record
			DNI             : longint	;
			nombre_apellido : TCadena70	;
			seleccion       : TCadena70	;
			goles		    : Integer	;
		end ;

		TListaGoleadores = ^TNodoListaGoleadores ;
		
		TNodoListaGoleadores = record
			jugador : TJugador		   ;
			sig     : TListaGoleadores ;
		end ;

		TFecha = record
			dia  : 1..31	;
			mes  : 1..12	;
			anio : Integer	;
		end ;
		
		TPartido = record
			codigo		: longint		   ;
			seleccion_l	: TCadena70		   ;
			seleccion_2	: TCadena70		   ;
			fecha		: TFecha		   ;
			estadio		: TCadena70		   ;
			goleadores	: TListaGoleadores ;
		end ;

		TListaPartidos = ^TNodoPartidos ;
		
		TNodoPartidos = record
			partido : TPartido       ;
			sig     : TListaPartidos ;
		end ;

		TVectorNombres = array [ 1..20 ] of TCadena70 ;

		TSelecciones = TVectorNombres ;
		TEstadios    = TVectorNombres ;
		TNombres     = TVectorNombres ;
	//

	// creado por nosotros
		TPartidoArbol = record
			codigo  : LongInt   ;
			fecha   : TFecha    ;
			estadio : TCadena70 ;
			goles   : Integer   ;
		end ;
	
		TListaPartidosArbol = ^TNodoListaPartidosArbol ;
		
		TNodoListaPartidosArbol = record
			partido : TPartidoArbol       ;
			sig     : TListaPartidosArbol ; 
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

// tests
	// procedure cargarFecha_TEST ( var fecha : TFecha ) ;
		procedure cargarFecha_Test ( var fecha : TFecha ) ;
		begin
			fecha.dia  := 20   ;
			fecha.mes  := 6    ;
			fecha.anio := 2024 ;
		end ;
	//

	// Procedure agregarAListaPartidos_TEST ( var LP : TListaPartidos ; partido : TPartido ) ;
		Procedure agregarAListaPartidos_TEST ( var LP : TListaPartidos ; partido : TPartido ) ;
		var
			aux : TListaPartidos ;

		begin
			New( aux ) ;

			aux^.partido := partido ;
			aux^.sig     := LP      ;

			LP := aux ;
		end ;
	//

	// Procedure agregarJugadorAListaGoleadores_TEST ( var LG : TListaGoleadores ; jugador : TJugador ) ;
		Procedure agregarJugadorAListaGoleadores_TEST ( var LG : TListaGoleadores ; jugador : TJugador ) ;
		var
			aux : TListaGoleadores ;

		begin
			New( aux ) ;

			aux^.jugador := jugador ;
			aux^.sig     := LG      ;
			
			LG := aux ;
		end ;
	//

	// procedure cargarSelecciones_TEST ( var selecciones : TSelecciones ) ;
		procedure cargarSelecciones_TEST ( var selecciones : TSelecciones ) ;
		begin
			selecciones [ 1  ] := 'Argentina'	   ;
			selecciones [ 2  ] := 'Brasil'		   ;
			selecciones [ 3  ] := 'Colombia'	   ;
			selecciones [ 4  ] := 'Canada'		   ;
			selecciones [ 5  ] := 'Ecuador'		   ;
			selecciones [ 6  ] := 'Peru'		   ;
			selecciones [ 7  ] := 'Chile'		   ;
			selecciones [ 8  ] := 'Bolivia'		   ;
			selecciones [ 9  ] := 'Venezuela'	   ;
			selecciones [ 10 ] := 'Mexico'		   ;
			selecciones [ 11 ] := 'Costa Rica'	   ;
			selecciones [ 12 ] := 'Estados Unidos' ;
			selecciones [ 13 ] := 'Jamaica'		   ;
			selecciones [ 14 ] := 'Panama'		   ;
			selecciones [ 15 ] := 'Paraguay'	   ;
			selecciones [ 16 ] := 'Uruguay'		   ;
		end ;
	//
	
	// procedure cargarNombres_TEST ( var nombres : TNombres ) ;
		procedure cargarNombres_TEST ( var nombres : TNombres ) ;
		begin
			nombres [ 1  ] := 'Lionel Perez'         ;
			nombres [ 2  ] := 'Martin Fernandez'     ;
			nombres [ 3  ] := 'Mariano Gomez'        ;
			nombres [ 4  ] := 'Alejandro Gonzalez'   ;
			nombres [ 5  ] := 'Fermin Martinez'      ;
			nombres [ 6  ] := 'Nicolas Castro'       ;
			nombres [ 7  ] := 'Gonzalo Villareal'    ;
			nombres [ 8  ] := 'Tadeo Parodi'         ;
			nombres [ 9  ] := 'Juan Pablo Silvestre' ;
			nombres [ 10 ] := 'Mariano Sanchez'      ;
			nombres [ 11 ] := 'Alejo Monden'         ;
			nombres [ 12 ] := 'Agustin Paz'          ;
			nombres [ 13 ] := 'Juan Salto'           ;
			nombres [ 14 ] := 'Matias Pidone'        ;
			nombres [ 15 ] := 'Luis Hernandez'       ;
			nombres [ 16 ] := 'Cristian Herrera'     ;
			nombres [ 17 ] := 'Santiago Manzur'      ;
			nombres [ 18 ] := 'Julian Darino'        ;
			nombres [ 19 ] := 'Victor Abila'         ;
			nombres [ 20 ] := 'Luciano Segura'       ;
		end ;
	//
	
	// procedure cargarEstadios_TEST ( var estadios : TEstadios ) ;
		procedure cargarEstadios_TEST ( var estadios : TEstadios ) ;
		begin
			estadios [ 1  ] := 'Mercedes-Benz Stadium'   ;
			estadios [ 2  ] := 'Levi`s Stadium'          ;
			estadios [ 3  ] := 'Bank of America Stadium' ;
			estadios [ 4  ] := 'State Farm Stadium'      ;
			estadios [ 5  ] := 'SoFi Stadium'            ;
			estadios [ 6  ] := 'Inter&Co Stadium'        ;
			estadios [ 7  ] := 'NRG Stadium'             ;
			estadios [ 8  ] := 'Q2 Stadium'              ;
			estadios [ 9  ] := 'AT&T Stadium'            ;
			estadios [ 10 ] := 'MetLife Stadium'         ;
			estadios [ 11 ] := 'Allegiant Stadium'       ;
			estadios [ 12 ] := 'Arrowhead Stadium'       ;
			estadios [ 13 ] := 'Children`s Mercy Park'   ;
			estadios [ 14 ] := 'Hard Rock Stadium'       ;
		end ;
	//

	// procedure cargarJugadores_TEST ( var LG : TListaGoleadores ; local : TCadena70 ; visitante : TCadena70 ) ;
		procedure cargarJugadores_TEST ( var LG : TListaGoleadores ; local : TCadena70 ; visitante : TCadena70 ) ;
		var
			jugador       : TJugador ;
			cantJugadores : Integer  ;
			i             : Integer  ;
			pos           : Integer  ;
			loc_vis       : Integer  ;
			nombres       : TNombres ;

		begin
			cargarNombres_TEST( nombres ) ;

			if ( (local = 'Argentina') or (visitante = 'Argentina') ) then
			begin
				with( jugador ) do
				begin
					DNI             := 34807474          ;
					nombre_apellido := 'Leandro Romanut' ;
					seleccion       := 'Argentina'       ;
					goles           := ( random(3) + 1 ) ;
				end ;
				
				agregarJugadorAListaGoleadores_TEST( LG , jugador ) ;
			end ;

			cantJugadores := random( 3 ) ;

			for i := 1 to cantJugadores do
			begin
				with( jugador ) do
				begin
					DNI := ( random(18000000) + 20000000 ) ;

					pos     := ( random(20) + 1 ) ;
					loc_vis := ( random(2 ) + 1 ) ;

					nombre_apellido := nombres[ pos ] ;
					
					if ( loc_vis = 1 ) then
					begin
						seleccion := local ;
					end else
					begin
						seleccion := visitante ;
					end ;
					
					goles := ( random(3) + 1 ) ;
				end ;

				agregarJugadorAListaGoleadores_TEST( LG , jugador ) ;
			end ;
		end ;
	//

	// procedure crearListaPartidos_TEST ( var LP : TListaPartidos ) ;
		procedure crearListaPartidos_TEST ( var LP : TListaPartidos ) ;
		var
			partido      : TPartido     ;
			cantPartidos : Integer      ;
			i            : Integer      ;
			loc          : Integer      ;
			vis          : Integer      ;
			estadios     : TEstadios    ;
			selecciones  : TSelecciones ;

		begin
			cargarEstadios_TEST    ( estadios    ) ;
			cargarSelecciones_TEST ( selecciones ) ;

			cantPartidos := 5 ;

			for i := 1 to cantPartidos do
			begin
				with ( partido ) do
				begin
					codigo := ( random(100000) + 1 ) ;

					estadio := estadios[ 10 ] ;

					loc := ( random(16) + 1 ) ;
					vis := ( random(16) + 1 ) ;

					seleccion_l := selecciones[ loc ] ;
					seleccion_2 := selecciones[ vis ] ;

					while( seleccion_l = seleccion_2 )do
					begin
						vis := ( random(16) + 1 ) ;

						seleccion_2 := selecciones[ vis ] ;
					end ;

					cargarFecha_Test( fecha ) ;

					goleadores := Nil ;

					cargarJugadores_TEST( goleadores , seleccion_l , seleccion_2 ) ;
				end ;

				agregarAListaPartidos_TEST( LP , partido ) ;
			end ;
		end ;
	//

	// function cantidadDeGolesLG_TEST ( LG : TListaGoleadores ; seleccion : TCadena70 ; cantGoles : Integer ) : Integer ;
		function cantidadDeGolesLG_TEST ( LG : TListaGoleadores ; seleccion : TCadena70 ; cantGoles : Integer ) : Integer ;
		begin
			if ( LG <> Nil ) then
			begin
				if ( LG^.jugador.seleccion = seleccion ) then
				begin
					sumar( cantGoles , LG^.jugador.goles ) ;
				end ;

				cantidadDeGolesLG_TEST := cantidadDeGolesLG_TEST( LG^.sig , seleccion , cantGoles ) ;
			end else
			begin
				cantidadDeGolesLG_TEST := cantGoles ;
			end ;
		end ;
	//

	// procedure imprimirGoleadores_TEST ( LG : TListaGoleadores ; seleccion : TCadena70 ) ;
		procedure imprimirGoleadores_TEST ( LG : TListaGoleadores ; seleccion : TCadena70 ) ;
		begin
			if ( LG <> Nil ) then
			begin
				if ( LG^.jugador.seleccion = seleccion ) then
				begin
					WriteLn( '        '         , LG^.jugador.nombre_apellido ) ;
					WriteLn( '        '         , LG^.jugador.DNI             ) ;
					WriteLn( '        Goles   ' , LG^.jugador.goles           ) ;
					
					separador( 1 ) ;
				end ;

				imprimirGoleadores_TEST( LG^.sig , seleccion )
			end ;
		end ;
	//

	// procedure imprimirSeleccion_TEST ( LG : TListaGoleadores ; seleccion : TCadena70 ) ;
		procedure imprimirSeleccion_TEST ( LG : TListaGoleadores ; seleccion : TCadena70 ) ;
		begin
			writeLn( '    ' , seleccion , ' ' , cantidadDeGolesLG_TEST(LG , seleccion , 0) ) ;

			imprimirGoleadores_TEST( LG , seleccion ) ;
		end ;
	//

	// procedure imprimirPartido_TEST ( partido : TPartido ) ;
		procedure imprimirPartido_TEST ( partido : TPartido ) ;
		begin
			with ( partido ) do
			begin
				separador( 2 ) ;

				WriteLn( '.................................................................' ) ;

				writeln( 'PARTIDO: '      , codigo                                         ) ;
				writeln( '    FECHA     ' , fecha.dia , '/' , fecha.mes , '/' , fecha.anio ) ;
				writeln( '    ESTADIO   ' , estadio                                        ) ;

				imprimirSeleccion_TEST( partido.goleadores , seleccion_l ) ;
				imprimirSeleccion_TEST( partido.goleadores , seleccion_2 ) ;
			end ;
		end ;
	//

	// procedure imprimirListaPartidos_TEST ( LP : TListaPartidos ) ;
		procedure imprimirListaPartidos_TEST ( LP : TListaPartidos ) ;
		begin
			if ( LP <> Nil ) then
			begin
				imprimirPartido_TEST       ( LP^.partido ) ;
				imprimirListaPartidos_TEST ( LP^.sig     ) ;
			end ;
		end ;
	//
//

// creado por ellos
	// procedure cargarFecha ( var fecha : TFecha ) ;
		procedure cargarFecha ( var fecha : TFecha ) ;
		begin
			fecha.dia := ( random(30) + 1 ) ;
			fecha.mes := ( random(1)  + 6 ) ;

			if ( (fecha.mes = 6) and (fecha.dia = 31) ) then
			begin
			    fecha.dia := 30;
			end ;

			fecha.anio := 2024 ;
		end ;
	//

	// Procedure agregarAListaPartidos ( var LP : TListaPartidos ; partido : TPartido ) ;
		Procedure agregarAListaPartidos ( var LP : TListaPartidos ; partido : TPartido ) ;
		var
			aux : TListaPartidos ;

		begin
			New( aux ) ;

			aux^.partido := partido ;
			aux^.sig     := LP      ;

			LP := aux ;
		end ;
	//

	// Procedure agregarJugadorAListaGoleadores ( var LG : TListaGoleadores ; jugador : TJugador ) ;
		Procedure agregarJugadorAListaGoleadores ( var LG : TListaGoleadores ; jugador : TJugador ) ;
		var
			aux : TListaGoleadores ;

		begin
			New( aux ) ;

			aux^.jugador := jugador ;
			aux^.sig     := LG      ;
			
			LG := aux ;
		end ;
	//

	// procedure cargarSelecciones ( var selecciones : TSelecciones ) ;
		procedure cargarSelecciones ( var selecciones : TSelecciones ) ;
		begin
			selecciones [ 1  ] := 'Argentina'	   ;
			selecciones [ 2  ] := 'Brasil'		   ;
			selecciones [ 3  ] := 'Colombia'	   ;
			selecciones [ 4  ] := 'Canada'		   ;
			selecciones [ 5  ] := 'Ecuador'		   ;
			selecciones [ 6  ] := 'Peru'		   ;
			selecciones [ 7  ] := 'Chile'		   ;
			selecciones [ 8  ] := 'Bolivia'		   ;
			selecciones [ 9  ] := 'Venezuela'	   ;
			selecciones [ 10 ] := 'Mexico'		   ;
			selecciones [ 11 ] := 'Costa Rica'	   ;
			selecciones [ 12 ] := 'Estados Unidos' ;
			selecciones [ 13 ] := 'Jamaica'		   ;
			selecciones [ 14 ] := 'Panama'		   ;
			selecciones [ 15 ] := 'Paraguay'	   ;
			selecciones [ 16 ] := 'Uruguay'		   ;
		end ;
	//

	// procedure cargarJugadores ( var LG : TListaGoleadores ; local : TCadena70 ; visitante : TCadena70 ) ;
		procedure cargarJugadores ( var LG : TListaGoleadores ; local : TCadena70 ; visitante : TCadena70 ) ;
		var
			jugador       : TJugador ;
			cantJugadores : Integer  ;
			i             : Integer  ;
			pos           : Integer  ;
			loc_vis       : Integer  ;
			nombre        : TNombres ;

		begin
			nombre [ 1  ] := 'Lionel Andres Messi Cuccittini' ;
			nombre [ 2  ] := 'Martin Demichele'     		  ;
			nombre [ 3  ] := 'Papu Gomez'        			  ;
			nombre [ 4  ] := 'Alejandro GARNACHOOOOOOOO'   	  ;
			nombre [ 5  ] := 'Lautaro Martinez'      		  ;
			nombre [ 6  ] := 'Nicolas Dominguez'       		  ;
			nombre [ 7  ] := 'Gonzalo Montiel'    			  ;
			nombre [ 8  ] := 'Leandro Paredes'         		  ;
			nombre [ 9  ] := 'Adrian Suar' 			          ;
			nombre [ 10 ] := 'Mariano Andujar'      		  ;
			nombre [ 11 ] := 'Iker Muniain'         		  ;
			nombre [ 12 ] := 'Nicolas Paz'          		  ;
			nombre [ 13 ] := 'Juan Hurtado'           		  ;
			nombre [ 14 ] := 'Matias Reali'        			  ;
			nombre [ 15 ] := 'Luisito Comunica'       		  ;
			nombre [ 16 ] := 'Cuti Romero'     				  ;
			nombre [ 17 ] := 'Santi Lopez'      			  ;
			nombre [ 18 ] := 'Julian Alvarez'        		  ;
			nombre [ 19 ] := 'Hector Villalba'         		  ;
			nombre [ 20 ] := 'Luciano Castro'       		  ;

			if ( (local = 'Argentina') or (visitante = 'Argentina') ) then
			begin
				with( jugador ) do
				begin
					DNI             := 34807474          ;
					nombre_apellido := 'Leandro Romanut' ;
					seleccion       := 'Argentina'       ;
					goles           := ( random(3) + 1 ) ;
				end ;
				
				agregarJugadorAListaGoleadores( LG , jugador ) ;
			end ;

			cantJugadores := random( 3 ) ;

			for i := 1 to cantJugadores do
			begin
				with( jugador ) do
				begin
					DNI := ( random(18000000) + 20000000 ) ;

					pos     := ( random(20) + 1 ) ;
					loc_vis := ( random(2 ) + 1 ) ;

					nombre_apellido := nombre[ pos ] ;
					
					if ( loc_vis = 1 ) then
					begin
						seleccion := local ;
					end else
					begin
						seleccion := visitante ;
					end ;
					
					goles := ( random(3) + 1 ) ;
				end ;

				agregarJugadorAListaGoleadores( LG , jugador ) ;
			end ;
		end ;
	//

	// procedure crearListaPartidos ( var LP : TListaPartidos ) ;
		procedure crearListaPartidos ( var LP : TListaPartidos ) ;
		var
			partido      : TPartido     ;
			cantPartidos : Integer      ;
			i            : Integer      ;
			pos          : Integer      ;
			loc          : Integer      ;
			vis          : Integer      ;
			estadios     : TEstadios    ;
			selecciones  : TSelecciones ;

		begin
			estadios [ 1  ] := 'Mercedes-Benz Stadium'   ;
			estadios [ 2  ] := 'Levi`s Stadium'          ;
			estadios [ 3  ] := 'Bank of America Stadium' ;
			estadios [ 4  ] := 'State Farm Stadium'      ;
			estadios [ 5  ] := 'SoFi Stadium'            ;
			estadios [ 6  ] := 'Inter&Co Stadium'        ;
			estadios [ 7  ] := 'NRG Stadium'             ;
			estadios [ 8  ] := 'Q2 Stadium'              ;
			estadios [ 9  ] := 'AT&T Stadium'            ;
			estadios [ 10 ] := 'MetLife Stadium'         ;
			estadios [ 11 ] := 'Allegiant Stadium'       ;
			estadios [ 12 ] := 'Arrowhead Stadium'       ;
			estadios [ 13 ] := 'Children`s Mercy Park'   ;
			estadios [ 14 ] := 'Hard Rock Stadium'       ;

			cargarSelecciones( selecciones ) ;

			cantPartidos := ( random(30) + 1 ) ;

			for i := 1 to cantPartidos do
			begin
				with ( partido ) do
				begin
					codigo := ( random(100000) + 1 ) ;
					pos    := ( random(14    ) + 1 ) ;

					estadio := estadios[ pos ] ;

					loc := ( random(16) + 1 ) ;
					vis := ( random(16) + 1 ) ;

					seleccion_l := selecciones[ loc ] ;
					seleccion_2 := selecciones[ vis ] ;

					while( seleccion_l = seleccion_2 )do
					begin
						vis := ( random(16) + 1 ) ;

						seleccion_2 := selecciones[ vis ] ;
					end ;

					cargarFecha( fecha ) ;

					goleadores := Nil ;

					cargarJugadores( goleadores , seleccion_l , seleccion_2 ) ;
				end ;

				agregarAListaPartidos( LP , partido ) ;
			end ;
		end ;
	//

	// procedure imprimirJugador ( jugador : TJugador ) ;
		procedure imprimirJugador ( jugador : TJugador ) ;
		begin
			with ( jugador ) do
			begin
				writeln( 'JUGADOR: ', nombre_apellido , ' | DNI: ' , DNI , ' | SELECCION: ' , seleccion , ' | GOLES: ' , goles ) ;
			end ;
		end ;
	//

	// procedure imprimirGoleadores ( LG : TListaGoleadores ) ;
		procedure imprimirGoleadores ( LG : TListaGoleadores ) ;
		begin
			while ( LG <> Nil ) do
			begin
				imprimirJugador( LG^.jugador ) ;

				LG := LG^.sig ;
			end ;
		end ;
	//

	// procedure imprimirPartido ( partido : TPartido ) ;
		procedure imprimirPartido ( partido : TPartido ) ;
		begin
			with ( partido ) do
			begin
				writeln( '' ) ;

				writeln( 'PARTIDO: ' , codigo , ' | SELECCION 1: ' , seleccion_l , ' | SELECCION 2: ' , seleccion_2 , ' | FECHA: ' , fecha.dia , '/' , fecha.mes , '/' , fecha.anio , ' | ESTADIO: ' , estadio ) ;
				
				imprimirGoleadores( goleadores ) ;
			end ;
		end ;
	//

	// procedure imprimirListaPartidos ( LP : TListaPartidos ) ;
		procedure imprimirListaPartidos ( LP : TListaPartidos ) ;
		begin
			while ( LP <> Nil ) do
			begin
				imprimirPartido( LP^.partido ) ;

				LP := LP^.sig ;
			end ;
		end ;
	//
//

// creado por nosotros
	// procedure inicializarEstructuras ( var arbol : TArbol;var LSCG : TListaSeleccionesConGoles ) ;
		procedure inicializarEstructuras ( var arbol : TArbol;var LSCG : TListaSeleccionesConGoles ) ;
		begin
			arbol := Nil ;
			LSCG  := Nil ;
		end ;
	//

	// procedure agregarAListaPartidos ( var LPA : TListaPartidosArbol ; partido : TPartido ) ;
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
	//

	// procedure insertar ( var arbol : TArbol ; partido : TPartido ) ;
		procedure insertar ( var arbol : TArbol ; partido : TPartido ) ;
		var
			nue : TArbol ;

		begin
			if ( arbol <> Nil ) then
			begin
				if ( partido.goleadores <> Nil ) then
				begin
					if ( partido.goleadores^.jugador.DNI = arbol^.jugador.DNI ) then
					begin
						agregarAListaPartidos( arbol^.jugador.partidos , partido ) ;
					end
					else if ( partido.goleadores^.jugador.DNI < arbol^.jugador.DNI ) then
					begin
						insertar( arbol^.hijoIzq , partido ) ;
					end else
					begin
						insertar( arbol^.hijoDer , partido ) ;
					end ;
				end ;
			end else
			begin
				if ( partido.goleadores <> Nil ) then
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
		end ;
	//

	// procedure generarArbol ( var arbol : TArbol ; LP : TListaPartidos ) ;
		procedure generarArbol ( var arbol : TArbol ; LP : TListaPartidos ) ;
		begin
			if ( LP <> Nil ) then
			begin
				insertar     ( arbol , LP^.partido ) ;
				generarArbol ( arbol , LP^.sig     ) ;
			end ;
		end ;
	//

	// procedure graficarArbol ( arbol : TArbol ; espacio : Integer ; nivel : Integer ; var nivelAnt : Integer ) ;
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
	//

	// function cantidadDeGolesLPA ( LPA : TListaPartidosArbol ; cantGoles : Integer ) : Integer ;
		function cantidadDeGolesLPA ( LPA : TListaPartidosArbol ; cantGoles : Integer ) : Integer ;
		begin
			if ( LPA <> Nil ) then
			begin
				sumar( cantGoles , LPA^.partido.goles ) ;

				cantidadDeGolesLPA := cantidadDeGolesLPA( LPA^.sig , cantGoles ) ;
			end else
			begin
				cantidadDeGolesLPA := cantGoles ;
			end ;
		end ;
	//

	// procedure informarAcotado ( arbol : TArbol ; inf : LongInt ; sup : LongInt ) ;
		procedure informarAcotado ( arbol : TArbol ; inf : LongInt ; sup : LongInt ) ;
		begin
			if ( arbol <> Nil ) then
			begin
				if ( (inf <= arbol^.jugador.DNI ) and (arbol^.jugador.DNI <= sup) ) then
				begin
					informarAcotado( arbol^.hijoDer , inf , sup ) ;
					
					separador ( 1                                                                          ) ;
					WriteLn   ( 'DNI                 ' , arbol^.jugador.DNI                                ) ;
					WriteLn   ( 'nombre y apellido   ' , arbol^.jugador.nombre_apellido                    ) ;
					WriteLn   ( 'Cantidad de goles   ' , cantidadDeGolesLPA( arbol^.jugador.partidos , 0 ) ) ;

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
	//

	// function cumpleEstadio ( estadio : TCadena70 ) : Boolean ;
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
	//
		
	// function cumpleFecha ( fecha : TFecha ) : Boolean ;
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
	//
		
	// procedure agregarAListaSeleccionesConGoles ( var LSCG : TListaSeleccionesConGoles ; seleccion : TCadena70 ) ;
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
			else if ( LSCG^.seleccion < seleccion ) then
			begin
				agregarAListaSeleccionesConGoles( LSCG^.sig , seleccion ) ;
			end ;
		end ;
	//

	// procedure verificarPartidos ( var LSCG : TListaSeleccionesConGoles ; partidos : TListaPartidosArbol ; seleccion : TCadena70 ) ;
		procedure verificarPartidos ( var LSCG : TListaSeleccionesConGoles ; partidos : TListaPartidosArbol ; seleccion : TCadena70 ) ;
		begin
			if ( partidos <> Nil ) then
			begin
				if ( cumpleEstadio(partidos^.partido.estadio) and cumpleFecha(partidos^.partido.fecha) ) then
				begin
					agregarAListaSeleccionesConGoles( LSCG , seleccion ) ;
				end ;
			end ;
		end ;
	//
		
	// procedure generarListaSeleccionesConGoles ( var LSCG : TListaSeleccionesConGoles ; arbol : TArbol ) ;
		procedure generarListaSeleccionesConGoles ( var LSCG : TListaSeleccionesConGoles ; arbol : TArbol ) ;
		begin
			if ( arbol <> Nil ) then
			begin
				verificarPartidos               ( LSCG , arbol^.jugador.partidos , arbol^.jugador.seleccion ) ;
				
				generarListaSeleccionesConGoles ( LSCG , arbol^.hijoIzq                                     ) ;
				generarListaSeleccionesConGoles ( LSCG , arbol^.hijoDer                                     ) ;
			end ;
		end ;
	//
		
	// procedure imprimirSeleccionConGol ( LSCG : TListaSeleccionesConGoles ) ;
		procedure imprimirSeleccionConGol ( LSCG : TListaSeleccionesConGoles ) ;
		begin
			if ( LSCG <> Nil ) then
			begin
				writeLn                 ( LSCG^.seleccion ) ;
				imprimirSeleccionConGol ( LSCG^.sig       ) ;
			end ;
		end ;
	//
		
	// procedure imprimirSeleccionesConGoles ( LSCG : TListaSeleccionesConGoles ) ;
		procedure imprimirSeleccionesConGoles ( LSCG : TListaSeleccionesConGoles ) ;
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
	//

	// function nodoMax ( arbol : TArbol ) : TArbol ;
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
	//

	// procedure eliminar ( var arbol : TArbol ; DNI : LongInt ) ;
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
	//

	// procedure menu ( var opcion : Integer ; var arbol : TArbol ; var LSCG : TListaSeleccionesConGoles ; LP : TListaPartidos ) ;
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
						WriteLn      ( 'Arbol Generado' ) ;
						generarArbol ( arbol , LP       ) ;
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
							WriteLn( 'Jugadores con DNI entre 28000000 y 32000000:' ) ;
							
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
							generarListaSeleccionesConGoles ( LSCG , arbol ) ;
							imprimirSeleccionesConGoles     ( LSCG         ) ;
						end else
						begin
							WriteLn( 'Arbol vacio' ) ;
						end ;
					end ;
				6:
					begin
						if ( arbol <> Nil ) then
						begin
							WriteLn   ( 'Antes:' ) ;
							separador ( 2        ) ;

							nivelAnt := -1 ;
							graficarArbol( arbol , 90 , 0 , nivelAnt ) ;
							
							eliminar( arbol , 34807474 ) ;

							separador( 8 ) ;

							WriteLn   ( 'Despues:' ) ;
							separador ( 2        ) ;

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
	LP : TListaPartidos ;

	// test
		test    : Integer ;
		repetir : Boolean ;
	//

	// creado por nosotros
		opcion : Integer                   ;
		arbol  : TArbol                    ;
		LSCG   : TListaSeleccionesConGoles ;
	//
begin
	Randomize ;

	LP := Nil ;

	repeat
		separador( 1 ) ;

		Write  ( 'Ingrese 1 para ejecutar el codigo original / 2 para el modificado: ' ) ;
		ReadLn ( test                                                                ) ;

		repetir := ( (test < 1) or (2 < test) ) ;

		if ( repetir ) then
		begin
			separador ( 1                 ) ;
			WriteLn   ( 'Numero invalido' ) ;
		end ;
	until( not repetir ) ;

	if ( test = 1 ) then
	begin
	  	crearListaPartidos    ( LP                 ) ;
		writeln               ( 'LISTA GENERADA: ' ) ;
		imprimirListaPartidos ( LP                 ) ;
	end else
	begin
		crearListaPartidos_TEST    ( LP                 ) ;
		writeln                    ( 'LISTA GENERADA: ' ) ;
		imprimirListaPartidos_TEST ( LP                 ) ;
	end ;

	// creado por nosotros
		inicializarEstructuras ( arbol , LSCG ) ;
		
		repeat
			menu( opcion , arbol , LSCG , LP ) ;
		until( opcion = 0 ) ;
	//
end.