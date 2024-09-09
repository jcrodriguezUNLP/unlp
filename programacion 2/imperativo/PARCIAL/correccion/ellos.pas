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
			nombre [ 1  ] := 'Lionel Perez'         ;
			nombre [ 2  ] := 'Martin Fernandez'     ;
			nombre [ 3  ] := 'Mariano Gomez'        ;
			nombre [ 4  ] := 'Alejandro Gonzalez'   ;
			nombre [ 5  ] := 'Fermin Martinez'      ;
			nombre [ 6  ] := 'Nicolas Castro'       ;
			nombre [ 7  ] := 'Gonzalo Villareal'    ;
			nombre [ 8  ] := 'Tadeo Parodi'         ;
			nombre [ 9  ] := 'Juan Pablo Silvestre' ;
			nombre [ 10 ] := 'Mariano Sanchez'      ;
			nombre [ 11 ] := 'Alejo Monden'         ;
			nombre [ 12 ] := 'Agustin Paz'          ;
			nombre [ 13 ] := 'Juan Salto'           ;
			nombre [ 14 ] := 'Matias Pidone'        ;
			nombre [ 15 ] := 'Luis Hernandez'       ;
			nombre [ 16 ] := 'Cristian Herrera'     ;
			nombre [ 17 ] := 'Santiago Manzur'      ;
			nombre [ 18 ] := 'Julian Darino'        ;
			nombre [ 19 ] := 'Victor Abila'         ;
			nombre [ 20 ] := 'Luciano Segura'       ;

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