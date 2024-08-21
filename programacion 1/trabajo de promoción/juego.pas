program juego ;
uses sysutils ;
const
    CANT_OPCIONES       = 3  ;
    CANT_JUGADORES      = 2  ;
    CANT_CATEGORIAS     = 3  ;
    CANT_MIN_CASILLEROS = 7  ;
    CANT_MAX_CASILLEROS = 10 ;

type
    TCadena1   = string [ 1   ] ;
    TCadena2   = string [ 2   ] ;
    TCadena200 = string [ 200 ] ;

    TRangoOpciones   = 1..CANT_OPCIONES       ;
    TRangoJugadores  = 1..CANT_JUGADORES      ;
    TRangoCategorias = 1..CANT_CATEGORIAS     ;
    TRangoCasilleros = 1..CANT_MAX_CASILLEROS ;
    TRangoResultados = 0..CANT_JUGADORES      ;

    TJugador = record
        posicion : TRangoCasilleros ;
        aciertos : integer          ;
        errores  : integer          ;
    end ;

    TJugadores = array [ TRangoJugadores ] of TJugador ;

    TOpciones = array [ TRangoOpciones ] of TCadena200 ;

    TPregunta = record
        contenido : TCadena200 ;
        opciones  : TOpciones  ;
        correcta  : TCadena1   ;
    end ;

    TPreguntas = text ;

    TCAtegorias = array [ TRangoCategorias ] of TPreguntas ;

    TCasilleros = array [ TRangoCasilleros ] of TRangoCategorias ;

    TTablero = record
        casilleros : TCasilleros      ;
        largo      : TRangoCasilleros ;
    end ;

    TGanadas = array [ TRangoJugadores ] of Integer ;

    TPartidas = record
        jugadas : Integer  ;
        empates : Integer  ;
        ganadas : TGanadas ;
    end ;

// procedure separador ( cantidad : integer ) ;
    procedure separador ( cantidad : integer ) ;
    var
        i : integer ;

    begin
        for i := 1 to cantidad do
        begin
            writeln () ;
        end ;
    end ;
//

// procedure generarTablero ( var tablero : TTablero ) ;
    procedure generarTablero ( var tablero : TTablero  ) ;
    var
        categoria       : TRangoCategorias ;
        casillero       : TRangoCasilleros ;
        deltaCasilleros : TRangoCasilleros ;

    begin
        deltaCasilleros := ( CANT_MAX_CASILLEROS     - CANT_MIN_CASILLEROS ) ;
        tablero.largo   := ( random(deltaCasilleros) + CANT_MIN_CASILLEROS ) ;

        for casillero := 1 to tablero.largo do
        begin
            categoria := ( random( CANT_CATEGORIAS ) + 1 ) ;

            tablero.casilleros[ casillero ] := categoria ;
        end ;
    end ;
//

// procedure imprimirTablero ( tablero : TTablero ; jugadores : TJugadores ) ;
    procedure imprimirTablero ( tablero : TTablero ; jugadores : TJugadores ) ;
    var
        jugador   : TRangoJugadores  ;
        posicion  : TRangoCasilleros ;
        casillero : TRangoCasilleros ;

    begin
        separador ( 1          ) ;
        writeln   ( 'TABLERO:' ) ;

        for jugador := 1 to CANT_JUGADORES do
        begin
            posicion := 1 ;

            while ( posicion < jugadores[ jugador ].posicion ) do
            begin
                write ( '  - ' ) ;

                posicion := ( posicion + 1 ) ;
            end ;

            writeln ('  ' , jugador ) ;
        end ;

        for casillero := 1 to ( tablero.largo - 1 ) do
        begin
            write ( '| ' , tablero.casilleros[ casillero ] , ' ' ) ;
        end ;
        
        writeln ( '| META |' ) ;
    end ;
//

// procedure inicializarJugadores ( var jugadores : TJugadores ) ;
    procedure inicializarJugadores ( var jugadores : TJugadores ) ;
    var
        jugador : TRangoJugadores ;

    begin
        for jugador := 1 to CANT_JUGADORES do
        begin
            jugadores[ jugador ].posicion := 1 ;
            jugadores[ jugador ].aciertos := 0 ;
            jugadores[ jugador ].errores  := 0 ;
        end ;
    end ;
//

// procedure inicializarCategorias ( var categorias : TCAtegorias ) ;
    procedure inicializarCategorias ( var categorias : TCategorias ) ;
    var
        categoria : TRangoCategorias ;

    begin
        for categoria := 1 to CANT_CATEGORIAS do
        begin
            Assign ( categorias[ categoria ] , 'categoria' + IntToStr(categoria) + '.txt' ) ;
        end ;
    end ;
//

// procedure abrirArchivos ( var categorias : TCAtegorias ) ;
    procedure abrirArchivos ( var categorias : TCAtegorias ) ;
    var
        categoria : TRangoCategorias ;

    begin
        for categoria := 1 to CANT_CATEGORIAS do
        begin
            Reset ( categorias[ categoria ] ) ;
        end ;
    end ;
//

// procedure cerrarArchivos ( var categorias : TCAtegorias ) ;
    procedure cerrarArchivos ( var categorias : TCAtegorias ) ;
    var
        categoria : TRangoCategorias ;

    begin
        for categoria := 1 to CANT_CATEGORIAS do
        begin
            Close ( categorias[ categoria ] ) ;
        end ;
    end ;
//

// procedure leerPregunta ( var pregunta : TPregunta ; var categorias : TCAtegorias ; categoria : TRangoCategorias ) ;
    procedure leerPregunta ( var pregunta : TPregunta ; var categorias : TCAtegorias ; categoria : TRangoCategorias ) ;
    var
        opcion : TRangoOpciones ;

    begin        
        ReadLn ( categorias[ categoria ] , pregunta.contenido ) ;

        for opcion := 1 to CANT_OPCIONES do
        begin
            ReadLn ( categorias[ categoria ] , pregunta.opciones[ opcion ] ) ;
        end ;

        ReadLn ( categorias[ categoria ] , pregunta.correcta ) ;
    end ;
//

// procedure imprimirPregunta ( pregunta : TPregunta ) ;
    procedure imprimirPregunta ( pregunta : TPregunta ) ;
    var
        opcion : TRangoOpciones ;

    begin
        separador ( 1                  ) ;
        writeln   ( pregunta.contenido ) ;

        for opcion := 1 to CANT_OPCIONES do
        begin
            writeln ( '    ' , pregunta.opciones[ opcion ] ) ;
        end ;

        writeln ( 'Machete: ' , pregunta.correcta ) ;
    end ;
//

// procedure avanzarJugador ( var jugadores : TJugadores ; jugador : TRangoJugadores ) ;
    procedure avanzarJugador ( var jugadores : TJugadores ; jugador : TRangoJugadores ) ;
    begin
        writeln   ( 'CORRECTO, avanza una posicion' ) ;

        jugadores[ jugador ].posicion := ( jugadores[ jugador ].posicion + 1 ) ;
    end ;
//

// procedure retrocederJugador ( var jugadores : TJugadores ; jugador : TRangoJugadores ) ;
    procedure retrocederJugador ( var jugadores : TJugadores ; jugador : TRangoJugadores ) ;
    begin
        if ( jugadores[ jugador ].posicion = 1 ) then
        begin
            writeln ( 'INCORRECTO' ) ;
        end else
        begin
            writeln ( 'INCORRECTO, retrocede una posicion' ) ;

            jugadores[ jugador ].posicion := ( jugadores[ jugador ].posicion - 1 ) ;
        end ;
    end ;
//

// procedure jugada ( var jugadores : TJugadores ; jugador : TRangoJugadores ; var categorias : TCategorias ; categoria : TRangoCategorias ) ;
    procedure jugada ( var jugadores : TJugadores ; jugador : TRangoJugadores ; var categorias : TCategorias ; categoria : TRangoCategorias ) ;
    var
        opcion   : TCadena200 ;
        pregunta : TPregunta  ;

    begin
        leerPregunta     ( pregunta               , categorias        , categoria ) ;
        separador        ( 1                                                      ) ;
        writeln          ( 'Turno del jugador N ' , jugador                       ) ;
        imprimirPregunta ( pregunta                                               ) ;
        separador        ( 1                                                      ) ;
        write            ( 'Respuesta: '                                          ) ;
        readln           ( opcion                                                 ) ;
        writeln          ( 'Opcion correcta: '    , pregunta.correcta             ) ;
        separador        ( 1                                                      ) ;

        if ( LowerCase(opcion) = LowerCase(pregunta.correcta) ) then
        begin
            avanzarJugador ( jugadores , jugador ) ;

            jugadores[ jugador ].aciertos := ( jugadores[ jugador ].aciertos + 1 ) ;
        end else
        begin
            retrocederJugador ( jugadores , jugador ) ;

            jugadores[ jugador ].errores := ( jugadores[ jugador ].errores + 1 ) ;
        end ;
    end ;
//

// procedure imprimirEstadistica ( jugadores : TJugadores ; jugador : TRangoJugadores ) ;
    procedure imprimirEstadistica ( jugadores : TJugadores ; jugador : TRangoJugadores ) ;
    begin
        separador ( 1                                                ) ;
        writeln   ( 'Jugador N ' , jugador , ':'                     ) ;
        writeln   ( '    Aciertos: ' , jugadores[ jugador ].aciertos ) ;
        writeln   ( '    Errores: '  , jugadores[ jugador ].errores  ) ;
    end ;
//

// procedure estadisticas ( jugadores : TJugadores) ;
    procedure estadisticas ( jugadores : TJugadores) ;
    var
        jugador      : integer  ;
        estadisticas : TCadena2 ;

    begin
        repeat
            separador ( 1                                            ) ;
            write     ( 'Mostrar estadisticas de la partida si/no : ') ;
            readln    ( estadisticas                                 ) ;
        until ( (estadisticas = 'si') or (estadisticas = 'no') ) ;

        if ( LowerCase(estadisticas) = 'si' ) then
        begin
            for jugador := 1 to CANT_JUGADORES do
            begin
                imprimirEstadistica ( jugadores , jugador ) ;
            end ;
        end ;
    end ;
//

// procedure juego ( categorias : TCAtegorias ; var resultado : TRangoResultados ) ;
    procedure juego ( categorias : TCAtegorias ; var resultado : TRangoResultados ) ;
    var
        fin       : boolean          ;
        jugador   : integer          ;
        tablero   : TTablero         ;
        categoria : TRangoCategorias ;
        jugadores : TJugadores       ;

    begin
        generarTablero        ( tablero    ) ;
        inicializarJugadores  ( jugadores  ) ;
        abrirArchivos         ( categorias ) ;

        separador ( 2                                                                                    ) ;
        writeln   ( 'Gana quien llega primero a la meta.'                                                ) ;
        writeln   ( 'Empatan si se quedan sin preguntas.'                                                ) ;
        writeln   ( 'Existen tres categorias de preguntas:'                                              ) ;
        writeln   ( '    Categoria 1: Conceptos generales de programacion.'                              ) ;
        writeln   ( '    Categoria 2: Tipos y estructuras de datos.'                                     ) ;
        writeln   ( '    Categoria 3: Modularizacion con pasaje de parametros y estructuras de control.' ) ;
        writeln   ( 'Cada pregunta tiene tres opciones de respuesta(A,B,C), una sola es correcta.'       ) ;
        writeln   ( 'No imoporta si la respuesta es en mayuscula o no.'                                  ) ;
        writeln   ( 'NO USAR ACENTOS.'                                                                   ) ;

        repeat
            jugador := 1 ;

            repeat
                imprimirTablero ( tablero , jugadores ) ;

                categoria := tablero.casilleros[ jugadores[jugador].posicion ] ;

                fin := EOF( categorias[ categoria ] ) ;

                if ( fin ) then
                begin
                    resultado := 0 ;

                    separador ( 1                                   ) ;
                    writeln   ( 'EMPATE, SE AGOTARON LAS PREGUNTAS' ) ;
                end else
                begin
                    jugada ( jugadores , jugador , categorias , categoria ) ;

                    fin := ( jugadores[ jugador ].posicion = tablero.largo ) ;
            
                    if ( fin ) then
                    begin
                        resultado := jugador ;

                        separador           ( 10                               ) ;
                        imprimirTablero     ( tablero              , jugadores ) ;
                        separador           ( 1                                ) ;
                        writeln             ( 'GANO EL JUGADOR N ' , jugador   ) ;
                        imprimirEstadistica ( jugadores            , jugador   ) ;
                    end else
                    begin
                        jugador := ( jugador + 1 ) ;
                        
                        separador ( 4 ) ;
                    end ;
                end ;
            until ( (CANT_JUGADORES < jugador) or fin ) ;
        until ( fin ) ;

        estadisticas   ( jugadores  ) ;
        cerrarArchivos ( categorias ) ;
    end ;
//

// procedure nuevaPartida ( var fin : boolean ) ;
    procedure nuevaPartida ( var fin : boolean ) ;
    var
        continuar  : TCadena2    ;
    begin
        repeat
            separador             ( 1                                   ) ;
            write                 ( 'Desea jugar otra partida si/no : ' ) ;
            readln                ( continuar                           ) ;
        until ( (continuar = 'si') or (continuar = 'no') ) ;

        fin := ( LowerCase(continuar) = 'no' ) ;

        if ( NOT fin ) then
        begin
            separador ( 10 ) ;
        end ;
    end ;
//

// procedure inicializarPartidas ( var partidas : TPartidas ) ;
    procedure inicializarPartidas ( var partidas : TPartidas ) ;
    var
        jugador : TRangoJugadores ;

    begin
        partidas.jugadas := 0 ;
        partidas.empates := 0 ;

        for jugador := 1 to CANT_JUGADORES do
        begin
            partidas.ganadas[ jugador ] := 0 ;
        end ;
    end ;
//

// procedure actualizarPartidas ( var partidas : TPartidas ; resultado : TRangoResultados ) ;
    procedure actualizarPartidas ( var partidas : TPartidas ; resultado : TRangoResultados ) ;
    begin
        partidas.jugadas := ( partidas.jugadas + 1 ) ;

        if ( resultado = 0 ) then
        begin
            partidas.empates := ( partidas.empates + 1 ) ;
        end
        else
        begin
            partidas.ganadas[ resultado ] := ( partidas.ganadas[ resultado ] + 1 ) ;
        end ;
    end ;
//

// procedure informarPartidas ( partidas : TPartidas ) ;
    procedure informarPartidas ( partidas : TPartidas ) ;
    var
        salir   : char            ;
        jugador : TRangoJugadores ;

    begin
        separador ( 2                                           ) ;
        writeln   ( 'Partidas jugadas: ' , partidas.jugadas     ) ;
        writeln   ( '    Empates : '         , partidas.empates ) ;

        if ( partidas.empates < partidas.jugadas ) then
        begin
            for jugador := 1 to CANT_JUGADORES do
            begin
                separador ( 1                                                 ) ;
                writeln   ( '    Jugador N '    , jugador , ':'               ) ;
                writeln   ( '        ganadas: ' , partidas.ganadas[ jugador ] ) ;
            end ;
        end ;

        separador ( 2                                     ) ;
        write     ( 'PRESIONE CUALQUIR BOTON PARA SALIR ' ) ;
        readln    ( salir                                 ) ;
    end ;
//

var
    fin        : boolean          ;
    partidas   : TPartidas        ;
    resultado  : TRangoResultados ;
    categorias : TCategorias      ;

begin
    randomize ;

    inicializarCategorias ( categorias ) ;
    inicializarPartidas   ( partidas   ) ;

    repeat
        juego              ( categorias , resultado ) ;
        actualizarPartidas ( partidas   , resultado ) ;
        nuevaPartida       ( fin                    ) ;
    until ( fin ) ;

    informarPartidas ( partidas ) ;
end .