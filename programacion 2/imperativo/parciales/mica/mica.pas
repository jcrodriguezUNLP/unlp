Program mica ;
Type
    TCadena70= string[70];
   
	TPaciente = record
		DNI: longint;
		nombre_apellido: TCadena70;
	end ;

	TFecha=record
		dia:1..31;
		mes:1..12;
		anio:integer;
	end ;
	
    TVacuna= record
		nombre : TCadena70 ;
		lote: Integer;
		fecha: TFecha;
		dosis : Integer ;
		paciente: TPaciente;
    end ;
   
	TListaVacunas = ^TNodoLista;

    TNodoLista = record
	    vacuna: TVacuna;
	    sig: TListaVacunas;
    end ;
 
// creado por mi
	TVacunaArbol = record
		nombre : TCadena70 ;
		lote   : Integer   ;
		fecha  : TFecha    ;
		dosis  : Integer   ;
    end ;
    
    TListaVacunasArbol = ^TNodoListaVacunasArbol ;
    
    TPacienteArbol = record
		DNI             : LongInt            ;
		nombre_apellido : TCadena70          ;
		vacunas         : TListaVacunasArbol ;
    end ;
    
    TNodoListaVacunasArbol = record
		vacuna : TVacunaARbol       ;
		sig    : TListaVacunasArbol ;
    end ;

	TArbol = ^TNodoArbol ;
	
	TNodoArbol = record
		paciente : TPacienteArbol     ;
		vacunas  : TListaVacunasArbol ;
		hijoIzq  : TArbol             ;
		hijoDer  : TArbol             ;
	end ;
	
	TPacienteMax = record
		paciente     : TPaciente ;
		totalVacunas : Integer   ;
	end ;
//

// creado por mi
	procedure separador ( n : Integer ) ;
	var
		i : Integer ;

	begin
		for i := 1 to n do
		begin
			WriteLn ;
		end ;
	end ;

	procedure incrementar ( var a : Integer ) ;
	begin
		a := ( a + 1 ) ;
	end ;

	procedure sumar ( var a : Integer ; b : Integer ) ;
	begin
		a := ( a + b ) ;
	end ;

	procedure sumarReal ( var a : Real ; b : Real ) ;
	begin
		a := ( a + b ) ;
	end ;
//

procedure cargarFecha( var fecha : TFecha ) ;
begin
  fecha.dia  := random(31) + 1 ;
  fecha.mes  := random(12) + 1 ;
  fecha.anio := 2023           ;  // Supongamos que todas son del año 2023
end ;

procedure cargarPaciente(var paciente: TPaciente);
const
  nombres: array[1..5] of TCadena70 = ('Juan Perez', 'Ana Gomez', 'Luis Lopez', 'Carla Diaz', 'Maria Jimenez');
begin
  //paciente.DNI := random(90000000) + 10000000; // DNI aleatorio entre 10,000,000 y 99,999,999
  paciente.DNI := random(3) + 25000000; // DNI aleatorio entre 10,000,000 y 99,999,999
  //paciente.nombre_apellido := nombres[random(5) + 1];
  paciente.nombre_apellido := nombres[1];
end ;

procedure agregarVacuna(var lista: TListaVacunas; vacuna: TVacuna);
var
  nuevoNodo: TListaVacunas;
begin
  new(nuevoNodo);
  nuevoNodo^.vacuna := vacuna;
  nuevoNodo^.sig := lista;
  lista := nuevoNodo;
end ;

procedure crearListaVacunas(var lista: TListaVacunas);
var
  vacuna: TVacuna;
  cant, i: Integer;
begin
  cant := random(10) + 1;  // Generamos entre 1 y 10 vacunas
  for i := 1 to cant do
  begin
    with vacuna do
    begin
      nombre := 'Vacuna COVID-19';
      lote := random(10000) + 1;
      dosis := random(3) + 1;  // Dosis entre 1 y 3
      cargarFecha(fecha);
      cargarPaciente(paciente);
    end ;
    agregarVacuna(lista, vacuna);
  end ;
end ;

procedure imprimirVacuna(vacuna: TVacuna);
begin
  with vacuna do
  begin
    writeln('Nombre: ', nombre);
    writeln('Lote: ', lote);
    writeln('Dosis: ', dosis);
    writeln('Fecha: ', fecha.dia, '/', fecha.mes, '/', fecha.anio);
    writeln('Paciente: ', paciente.nombre_apellido, ' (DNI: ', paciente.DNI, ')');
    writeln('-----------------------------------');
  end ;
end ;

procedure imprimirListaVacunas(lista: TListaVacunas);
begin
  while lista <> nil do
  begin
    imprimirVacuna(lista^.vacuna);
    lista := lista^.sig;
  end ;
end ;

// creado por mi
	procedure inicializarArbol ( var arbol : TArbol ) ; //ATR
	begin
		arbol := Nil ;
	end ;

	procedure agregarALista ( var LVA : TListaVacunasArbol ; vacuna : TVacuna ) ; //ATR
	var
		nue : TListaVacunasArbol ;

	begin
		if ( LVA = Nil ) then
		begin
			New( nue ) ;

			nue^.vacuna.nombre := vacuna.nombre ;
			nue^.vacuna.lote   := vacuna.lote   ;
			nue^.vacuna.fecha  := vacuna.fecha  ;
			nue^.vacuna.dosis  := vacuna.dosis  ;
			nue^.sig           := Nil           ;

			LVA := nue ;
		end else
		begin
			agregarALista( LVA^.sig , vacuna ) ;
		end ;
	end ;

	procedure insertar ( var arbol : TArbol ; vacuna : TVacuna ) ; // ATR
	var
		nue : TArbol ;

	begin
		if ( arbol <> Nil ) then
		begin
			if ( vacuna.paciente.DNI = arbol^.paciente.DNI ) then
			begin
				agregarALista ( arbol^.vacunas , vacuna ) ;
			end
			else if ( vacuna.paciente.DNI < arbol^.paciente.DNI ) then
			begin
				insertar( arbol^.hijoIzq , vacuna ) ;
			end else
			begin
				insertar( arbol^.hijoDer , vacuna ) ;
			end ;
		end else
		begin
			New( nue ) ;

			nue^.paciente.DNI             := vacuna.paciente.DNI             ;
			nue^.paciente.nombre_apellido := vacuna.paciente.nombre_apellido ;
			nue^.vacunas                  := Nil                             ;
			nue^.hijoIzq                  := Nil                             ;
			nue^.hijoDer                  := Nil                             ;
			
			arbol := nue ;

			agregarALista( arbol^.vacunas , vacuna ) ;
		end ;
	end ;

	procedure generarArbol ( var arbol : TArbol ; LV : TListaVacunas ) ; //ATR
	begin
		if ( LV <> Nil ) then
		begin
			insertar     ( arbol , LV^.vacuna ) ;
			generarArbol ( arbol , LV^.sig    ) ;
		end ;
	end ;

	procedure graficarArbol ( arbol : TArbol ; espacio : Integer ; nivel : Integer ; var nivelAnt : Integer ) ; //ATR
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

		WriteLn ( arbol^.paciente.DNI ) ;
		
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

	procedure imprimirVacunas ( LVA : TListaVacunasArbol ) ; //ATR
	begin
		if ( LVA <> Nil ) then
		begin
			write( LVA^.vacuna.nombre ) ;
			
			if ( LVA^.sig <> Nil ) then
			begin
				write           ( ', '      ) ;
				imprimirVacunas ( LVA^.sig  ) ;
			end ;
		end ;
	end ;

	procedure informarAcotado ( arbol : TArbol ; inf : LongInt ; sup : LongInt ; NumPaciente : Integer ) ; // ATR
	begin
		if ( arbol <> Nil ) then
		begin
			if ( (inf <= arbol^.paciente.DNI ) and (arbol^.paciente.DNI <= sup) ) then
			begin
				write           ( NumPaciente , '.  ' , arbol^.paciente.DNI , '    ' ) ;
				imprimirVacunas ( arbol^.vacunas                                     ) ;
				separador       ( 1                                                  ) ;
				incrementar     ( NumPaciente                                        ) ;

				informarAcotado( arbol^.hijoIzq , inf , sup , NumPaciente ) ;
				informarAcotado( arbol^.hijoDer , inf , sup , NumPaciente ) ;
			end
			else if ( arbol^.paciente.DNI < inf ) then
			begin
				informarAcotado( arbol^.hijoDer , inf , sup , NumPaciente ) ;
			end else
			begin
				informarAcotado( arbol^.hijoIzq , inf , sup , NumPaciente ) ;
			end ;
		end ;
	end ;

	procedure inicializarPacienteMax ( var pacienteMax : TPacienteMax ; NyA : TCadena70 ; DNI : LongInt ) ; // ATR
	begin
		pacienteMax.paciente.nombre_apellido := NyA ;
		pacienteMax.paciente.DNI             := DNI ;

		pacienteMax.totalVacunas := 0 ;
	end ;
	
	procedure compararPacienteMax ( var pacienteMax : TPacienteMax ; aux : TPacienteMax ) ; // ATR
	begin
		if ( pacienteMax.totalVacunas < aux.totalVacunas ) then
		begin
			pacienteMax := aux ;
		end ;
	end ;
	
	procedure actualizarPacienteMax ( LVA : TListaVacunasArbol ; var pacienteMax : TPacienteMax ) ; // ATR
	begin
		if ( LVA <> Nil ) then
		begin
			incrementar           ( pacienteMax.totalVacunas ) ;
			actualizarPacienteMax ( LVA^.sig , pacienteMax   ) ;
		end ;
	end ;
	
	procedure calcularPacienteMax ( arbol : TArbol ; var pacienteMax : TPacienteMax ) ; // ATR
	var
		pacienteMax_Aux : TPacienteMax ;

	begin
		if ( arbol <> Nil ) then
		begin
			inicializarPacienteMax ( pacienteMax_Aux , arbol^.paciente.nombre_apellido , arbol^.paciente.DNI ) ;
			actualizarPacienteMax  ( arbol^.vacunas  , pacienteMax_Aux                                       ) ;
			compararPacienteMax    ( pacienteMax     , pacienteMax_Aux                                       ) ;

			calcularPacienteMax( arbol^.hijoIzq , pacienteMax ) ;
			calcularPacienteMax( arbol^.hijoDer , pacienteMax ) ;
		end ;
	end ;
	
	procedure imprimirMasVacunasAplicadas ( arbol : TArbol ) ; // ATR
	var
		pacienteMax : TPacienteMax ;
	
	begin
		inicializarPacienteMax ( pacienteMax , arbol^.paciente.nombre_apellido , arbol^.paciente.DNI ) ;
		calcularPacienteMax    ( arbol       , pacienteMax                                           ) ;

		WriteLn( 'Paciente:'                                           ) ;
		WriteLn( '    Nombre  ' , pacienteMax.paciente.nombre_apellido ) ;
		WriteLn( '    DNI     ' , pacienteMax.paciente.DNI             ) ;
		WriteLn( '    Total   ' , pacienteMax.totalVacunas             ) ;
	end ;
	
	procedure menu ( var opcion : Integer ; var arbol : TArbol ; LV : TListaVacunas ) ; // ATR
	var
		nivelAnt : Integer ;
		repetir  : Boolean ;

	begin
		separador ( 3                                       ) ;
		WriteLn   ( 'Menu: '                                ) ;
		WriteLn   ( '    1. Reiniciar estructura'           ) ;
		WriteLn   ( '    2. Generar Arbol'                  ) ;
		WriteLn   ( '    3. Imprimir arbol'                 ) ;
		WriteLn   ( '    4. Imprimir acotado'               ) ;
		WriteLn   ( '    5. Informar paciente mas vacunas ' ) ;
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
					WriteLn          ( 'Arbol inicializado' ) ;
					inicializarArbol ( arbol                ) ;
				end ;
			2:
				begin
					WriteLn      ( 'Arbol generado' ) ;
					generarArbol ( arbol , LV       ) ;
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
						writeln( '    DNI         Vacunas aplicadas' ) ;
						writeln( '.................................' ) ;
						
						informarAcotado( arbol , 20000000 , 50000000 , 1 ) ;
						
						writeln( '.................................' ) ;
					end else
					begin
						WriteLn( 'Arbol vacio' ) ;
					end ;
				end ;
			5:
				begin
					if ( arbol <> Nil ) then
					begin
						imprimirMasVacunasAplicadas( arbol ) ;
					end else
					begin
						WriteLn( 'Arbol vacio' ) ;
					end ;
				end ;
		end ;
	end ;
//

var
   LV: TListaVacunas;
   
   // creado por mi
	   arbol  : TArbol  ;
	   opcion : Integer ;
   //
begin
    Randomize;

    LV:= nil;
    LV := nil;

	crearListaVacunas(LV);
	writeln('Lista de Vacunas generada:');
	imprimirListaVacunas(LV);

    // creado por mi
		inicializarArbol( arbol ) ;
		repeat
			menu( opcion , arbol , LV ) ;
		until( opcion = 0 ) ;
    //
end.
