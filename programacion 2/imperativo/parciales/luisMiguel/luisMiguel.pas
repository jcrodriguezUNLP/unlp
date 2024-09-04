Program luisMiguel ;
Type
     TCadena70 = string[ 70 ] ;
     
    TPersona = record
        DNI             : longint   ;
        nombre_apellido : TCadena70 ;
        correo          : TCadena70 ;
        pago            : TCadena70 ;
    end ;

	TFecha =record
		dia:1..31;
		mes:1..12;
		anio:integer;
	end ;
	
    TEntrada = record
		codigo     : longint  ;
		butaca     : 1..100   ;
		fila       : 1..10    ;
		precio     : real     ;
		fecha_show : TFecha   ;
        platea     : 'A'..'K' ;
		comprador  : TPersona ;
    end ;
     
    TListaEntradas = ^TNodoTListaEntradas ;

    TNodoTListaEntradas = record
        entrada : TEntrada ;
        sig     : TListaEntradas   ;
    end ;
     
    TNombres = array [ 1..20 ] of TCadena70 ;
    TPlateas = array [ 1..11 ] of char      ;
    TDias    = array [ 1..10 ] of integer   ;

    {Completar con los tipos de entradas necesarios}

    TPersonaArbol = record
        DNI             : LongInt   ;
        nombre_apellido : TCadena70 ;
        correo          : TCadena70 ;
    end ; 

    TEntradaArbol = record
        codigo     : longint  ;
        butaca     : 1..100    ;
        fila       : 1..10     ;
        precio     : real      ;
        fecha_show : TFecha    ;
        platea     : 'A'..'K'  ;
        pago       : TCadena70 ;
    end ;

    TListaEntradasArbol = ^TNodoTListaEntradasArbol ;

    TNodoTListaEntradasArbol = record
        entrada : TEntradaArbol       ;
        sig     : TListaEntradasArbol ;
    end ;

    TArbol = ^TNodoArbol ;

    TNodoArbol = record
        persona  : TPersonaArbol       ;
        entradas : TListaEntradasArbol ;
        hijoIzq  : TArbol              ;
        hijoDer  : TArbol              ;
    end ;

    TMinimos = array [ 1..2 ] of TEntradaArbol ;

// creado por mi
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

// procedure cargarFecha ( var fecha : TFecha ) ;
    procedure cargarFecha ( var fecha : TFecha ) ;
    var
        dias : TDias   ;
        pos  : integer ;

    begin
        dias[ 1  ] := 3  ;
        dias[ 2  ] := 4  ;
        dias[ 3  ] := 6  ;
        dias[ 4  ] := 8  ;
        dias[ 5  ] := 9  ;
        dias[ 6  ] := 12 ;
        dias[ 7  ] := 15 ;
        dias[ 8  ] := 16 ;
        dias[ 9  ] := 17 ;
        dias[ 10 ] := 18 ;

        pos := ( random( 10 ) + 1 ) ;

        fecha.dia  := dias[ pos ] ;
        fecha.mes  :=  8          ;
        fecha.anio := 2023        ;
    end ;
//

// Procedure agregar ( var LE : TListaEntradas ; entrada : TEntrada ) ;
    Procedure agregar ( var LE : TListaEntradas ; entrada : TEntrada ) ;
    var
        aux : TListaEntradas ;

    begin
        New( aux ) ;

        aux^.entrada := entrada ;
        aux^.sig     := LE      ;

        LE := aux ;
    end ;
//

// procedure cargarComprador ( var persona : TPersona ) ;
    procedure cargarComprador ( var persona : TPersona ) ;
    var
        pos           : integer  ;
        nombres       : TNombres ;
        correos       : TNombres ;
        metodosDePago : TNombres ;

    begin
        {TNombres}
        nombres[ 1  ] := 'Lionel Perez'         ;
        nombres[ 2  ] := 'Martin Fernandez'     ;
        nombres[ 3  ] := 'Mariano Gomez'        ;
        nombres[ 4  ] := 'Alejandro Gonzalez'   ;
        nombres[ 5  ] := 'Fermin Martinez'      ;
        nombres[ 6  ] := 'Nicolas Castro'       ;
        nombres[ 7  ] := 'Gonzalo Villareal'    ;
        nombres[ 8  ] := 'Tadeo Pardo'          ;
        nombres[ 9  ] := 'Juan Pablo Silvestre' ;
        nombres[ 10 ] := 'Mariano Tello'        ;
        nombres[ 11 ] := 'Alejo Ruiz'           ;
        nombres[ 12 ] := 'Agustin Paz'          ;
        nombres[ 13 ] := 'Juan Salto'           ;
        nombres[ 14 ] := 'Matias Pidone'        ;
        nombres[ 15 ] := 'Luis Hernandez'       ;
        nombres[ 16 ] := 'Cristian Herrera'     ;
        nombres[ 17 ] := 'Santiago Manzur'      ;
        nombres[ 18 ] := 'Julian Darino'        ;
        nombres[ 19 ] := 'Victor Abila'         ;
        nombres[ 20 ] := 'Luciano Segura'       ;
        {Correos}
        correos[ 1  ] := 'lionel.perez@gmail.com'         ;
        correos[ 2  ] := 'martin.fernandez@gmail.com'     ;
        correos[ 3  ] := 'mariano.gomez@gmail.com'        ;
        correos[ 4  ] := 'alejandro.gonzalez@gmail.com'   ;
        correos[ 5  ] := 'fermin.martinez@gmail.com'      ;
        correos[ 6  ] := 'nicolas.castro@gmail.com'       ;
        correos[ 7  ] := 'gonzalo.villareal@gmail.com'    ;
        correos[ 8  ] := 'tadeo.pardo@gmail.com'          ;
        correos[ 9  ] := 'juan.pablo.silvestre@gmail.com' ;
        correos[ 10 ] := 'mariano.tello@gmail.com'        ;
        correos[ 11 ] := 'alejo.ruiz@gmail.com'           ;
        correos[ 12 ] := 'agustin.paz@gmail.com'          ;
        correos[ 13 ] := 'juan.salto@gmail.com'           ;
        correos[ 14 ] := 'matias.pidone@gmail.com'        ;
        correos[ 15 ] := 'luis.hernandez@gmail.com'       ;
        correos[ 16 ] := 'cristian.herrera@gmail.com'     ;
        correos[ 17 ] := 'santiago.manzur@gmail.com'      ;
        correos[ 18 ] := 'julian.darino@gmail.com'        ;
        correos[ 19 ] := 'victor.abila@gmail.com'         ;
        correos[ 20 ] := 'luciano.segura@gmail.com'       ;
        {M�todo de pago}
        metodosDePago[ 1 ] := 'Tarjeta de Credito' ;
        metodosDePago[ 2 ] := 'Tarjeta de Debito'  ;
        metodosDePago[ 3 ] := 'Efectivo'           ;
        
        with( persona ) do
        begin
            DNI := ( random(18000000) + 20000000 ) ;

            pos := ( random(20) + 1 ) ;

            nombre_apellido := nombres       [ pos             ] ;
            correo          := correos       [ pos             ] ;
            pago            := metodosDePago [ (random(3) + 1) ] ;
        end ;
    end ;
//

// procedure crearTListaEntradas ( var LE : TListaEntradas ) ;
    procedure crearTListaEntradas ( var LE : TListaEntradas ) ;
    var
        entrada : TEntrada ;
        cant    : integer  ;
        i       : integer  ;
        j       : integer  ;
        pos     : integer  ;
        repe    : integer  ;
        plateas : TPlateas ;

    begin
        cant := ( random(100) + 1 ) ;

        plateas[ 1  ] := 'A' ;
        plateas[ 2  ] := 'B' ;
        plateas[ 3  ] := 'C' ;
        plateas[ 4  ] := 'D' ;
        plateas[ 5  ] := 'E' ;
        plateas[ 6  ] := 'F' ;
        plateas[ 7  ] := 'G' ;
        plateas[ 8  ] := 'H' ;
        plateas[ 9  ] := 'I' ;
        plateas[ 10 ] := 'J' ;
        plateas[ 11 ] := 'K' ;

        for i := 1 to cant do
        begin
            with entrada do
            begin
                codigo := ( random(100000) + 1     ) ;
                butaca := ( random(100)    + 1     ) ;
                fila   := ( random(10)     + 1     ) ;
                pos    := ( random(11)     + 1     ) ;
                precio := ( random(75000)  + 10000 ) ;

                platea := plateas[ pos ] ;


                cargarFecha     ( fecha_show ) ;
                cargarComprador ( comprador  ) ;
            end ;

            agregar( LE , entrada ) ;

            repe := ( random(3) + 1 ) ;

            if ( repe > 2 ) then
            begin
                for j := 1 to repe do
                begin
                    with entrada do
                    begin
                        codigo := ( random(100000) + 1     ) ;
                        butaca := ( random(100)    + 1     ) ;
                        fila   := ( random(10)     + 1     ) ;
                        pos    := ( random(11)     + 1     ) ;
                        precio := ( random(75000)  + 10000 ) ;

                        platea := plateas[ pos ] ;


                        cargarFecha     ( fecha_show ) ;
                        cargarComprador ( comprador  ) ;
                    end ;

                    agregar( LE , entrada ) ;
                end ;
            end ;
        end ;
    end ;
//

// procedure imprimirComprador ( persona : TPersona ) ;
    procedure imprimirComprador ( persona : TPersona ) ;
    begin
        with persona do
        begin
            writeln( 'COMPRADOR  '  , nombre_apellido ) ;
            writeln( 'DNI        '        , DNI             ) ;
            writeln( 'CORREO     '     , correo          ) ;
            writeln( 'PAGO       '       , pago            ) ;
        end ;
    end ;
//

// procedure imprimir ( entrada : TEntrada ) ;
    procedure imprimir ( entrada : TEntrada ) ;
    begin
        with entrada do
        begin
            separador( 1 ) ;

            writeln( 'Entrada    ' , codigo                                                        ) ;
            writeln( 'BUTACA     '  , butaca                                                        ) ;
            writeln( 'FILA       '    , fila                                                          ) ;
            writeln( 'PLATEA     '  , platea                                                        ) ;
            writeln( 'precio     '  , precio:0:2                                                    ) ;
            writeln( 'Fecha      '   , fecha_show.dia , '/' , fecha_show.mes , '/' , fecha_show.anio ) ;
            
            imprimirComprador( comprador ) ;
        end ;
    end ;
//

// procedure imprimirTListaEntradas ( LE : TListaEntradas ) ;
    procedure imprimirTListaEntradas ( LE : TListaEntradas ) ;
    begin
        while ( LE <> Nil ) do
        begin
            imprimir( LE^.entrada ) ;
            
            LE := LE^.sig ;
        end ;
    end ;
//

// creado por mi
    // procedure inicializarArbol ( var arbol : TArbol ) ;
        procedure inicializarArbol ( var arbol : TArbol ) ;
        begin
            arbol := Nil ;
        end ;
    //

    // procedure agregarALista ( var LEA : TListaEntradasArbol ; entrada : TEntrada ) ;
        procedure agregarALista ( var LEA : TListaEntradasArbol ; entrada : TEntrada ) ;
        var
            nue : TListaEntradasArbol ;

        begin
            if ( LEA = Nil ) then
            begin
                New( nue ) ;

                nue^.entrada.codigo     := entrada.codigo         ;
                nue^.entrada.butaca     := entrada.butaca         ;
                nue^.entrada.fila       := entrada.fila           ;
                nue^.entrada.precio     := entrada.precio         ;
                nue^.entrada.fecha_show := entrada.fecha_show     ;
                nue^.entrada.platea     := entrada.platea         ;
                nue^.entrada.pago       := entrada.comprador.pago ;
                nue^.sig                := Nil                    ;

                LEA := nue ;
            end else
            begin
                agregarALista( LEA^.sig , entrada ) ;
            end ;
        end ;
    //

    // procedure insertar ( var arbol : TArbol ; entrada : TEntrada ) ;
        procedure insertar ( var arbol : TArbol ; entrada : TEntrada ) ;
        var
            nue : TArbol ;

        begin
            if ( arbol <> Nil ) then
            begin
                if ( entrada.comprador.DNI = arbol^.persona.DNI ) then
                begin
                    agregarALista ( arbol^.entradas , entrada ) ;
                end
                else if ( entrada.comprador.DNI < arbol^.persona.DNI ) then
                begin
                    insertar( arbol^.hijoIzq , entrada ) ;
                end else
                begin
                    insertar( arbol^.hijoDer , entrada ) ;
                end ;
            end else
            begin
                New( nue ) ;

                nue^.persona.DNI             := entrada.comprador.DNI             ;
                nue^.persona.nombre_apellido := entrada.comprador.nombre_apellido ;
                nue^.persona.correo          := entrada.comprador.correo          ;
                nue^.entradas                := Nil                               ;
                nue^.hijoIzq                 := Nil                               ;
                nue^.hijoDer                 := Nil                               ;
                
                arbol := nue ;

                agregarALista( arbol^.entradas , entrada ) ;
            end ;
        end ;
    //

    // procedure generarArbol ( var arbol : TArbol ; LE : TListaEntradas ) ;
        procedure generarArbol ( var arbol : TArbol ; LE : TListaEntradas ) ;
        begin
            if ( LE <> Nil ) then
            begin
                insertar     ( arbol , LE^.entrada ) ;
                generarArbol ( arbol , LE^.sig     ) ;
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

        WriteLn ( arbol^.persona.DNI ) ;
        
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

    // procedure inicializarMinimos ( var minimos : TMinimos ) ;
        procedure inicializarMinimos ( var minimos : TMinimos ) ;
        var
            i : Integer ;

        begin
            for i := 1 to 2 do
            begin
                minimos[ i ].precio := -1 ;
            end ;
        end ;
    //

    // procedure calcularMinimos ( LEA : TListaEntradasArbol ; var minimos : TMinimos ) ;
        procedure calcularMinimos ( LEA : TListaEntradasArbol ; var minimos : TMinimos ) ;
        begin
            if ( LEA <> Nil ) then
            begin
                if ( (minimos[ 1 ].precio = -1) or (LEA^.entrada.precio < minimos[ 1 ].precio) ) then
                begin
                    minimos[ 2 ] := minimos[ 1 ] ;
                    minimos[ 1 ] := LEA^.entrada ;
                end
                else if ( (minimos[ 2 ].precio = -1) or (LEA^.entrada.precio < minimos[ 2 ].precio) ) then
                begin
                    minimos[ 2 ] := LEA^.entrada ;
                end ;

                calcularMinimos( LEA^.sig , minimos ) ;
            end ;
        end ;
    //

    // procedure imprimirMinimos ( minimos : TMinimos ) ;
        procedure imprimirMinimos ( minimos : TMinimos ) ;
        var
            i : Integer ;

        begin
            for i := 1 to 2 do
            begin
                with minimos[ i ] do
                begin
                    WriteLn( '    entrada '       , i ,'  '                                                       ) ;
                    WriteLn( '        codigo    ' , codigo                                                        ) ;
                    WriteLn( '        butaca    ' , butaca                                                        ) ;
                    WriteLn( '        fila      ' , fila                                                          ) ;
                    WriteLn( '        platea    ' , platea                                                        ) ;
                    WriteLn( '        precio    ' , precio:2:2                                                    ) ;
                    WriteLn( '        pago      ' , pago                                                          ) ;
                    writeln( '        Fecha     ' , fecha_show.dia , '/' , fecha_show.mes , '/' , fecha_show.anio ) ;
                end ;
            end ;
        end ;
    //

    // procedure imprimirDosMasBaratas ( arbol : TArbol ) ;
        procedure imprimirDosMasBaratas ( arbol : TArbol ) ;
        var
            minimos : TMinimos            ;

        begin
            if ( arbol <> Nil ) then
            begin
                inicializarMinimos ( minimos                                    ) ;
                calcularMinimos    ( arbol^.entradas , minimos                  ) ;
                separador          ( 1                                          ) ;
                WriteLn            ( 'comprador     '                           ) ;
                WriteLn            ( '    DNI       '   , arbol^.persona.DNI    ) ;
                WriteLn            ( '    correo    '   , arbol^.persona.correo ) ;
                imprimirMinimos    ( minimos                                    ) ;

                imprimirDosMasBaratas( arbol^.hijoIzq ) ;
                imprimirDosMasBaratas( arbol^.hijoDer ) ;
            end ;
        end ;
    //
//

var
   LE : TListaEntradas ;

   arbol    : TArbol  ;
   nivelAnt : Integer ;

begin
    Randomize ;

    LE := Nil ;

    crearTListaEntradas    ( LE                         ) ; {carga automatica de la estructura disponible}
    writeln                ('TListaEntradas GENERADA: ' ) ;
    imprimirTListaEntradas ( LE                         ) ;

    {Completar el programa}

    nivelAnt := -1 ;

    separador             ( 1                         ) ;
    inicializarArbol      ( arbol                     ) ;
    generarArbol          ( arbol , LE                ) ;
    graficarArbol         ( arbol , 90 , 0 , nivelAnt ) ;
    imprimirDosMasBaratas ( arbol                     ) ;

    separador ( 1                  ) ;
    writeln   ( 'Fin del programa' ) ;
    ReadLn( );
end.