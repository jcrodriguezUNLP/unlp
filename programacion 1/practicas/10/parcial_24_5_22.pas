program parcial_24_5_22 ;
const
    CANTDEEQUIPOS = 32 ;
    CANTDENUMEROS = 99 ;

type
    TRangoNumeros = 1..CANTDENUMEROS ;
    TRangoEquipos = 1..CANTDEEQUIPOS ;
    
    TCadena50 = String [ 50 ] ;

    TJugador = record
        DNI    : Integer       ;
        nombre : TCadena50     ;
        numero : TRangoNumeros ;
    end ;

    TLista = ^nodo ;

    nodo = record
        jugador : TJugador ;
        sig     : TLista   ;
    end ;

    TEquipo = record
        nombre    : TCadena50 ;
        jugadores : TLista    ;
    end ;

    TEquipos = array [ TRangoEquipos ] of TEquipo ;

    TNumeros = array [ TRangoNumeros ] of Boolean ;

    TContador = array [ TRangoNumeros ] of Integer ;

    TMinimo = record
        numero   : TRangoNumeros ;
        cantidad : Integer       ;
    end ;

    TMinimos = array [ 1..2 ] of TMinimo ;

// procedure leerJugador ( var jugador : TJugador ; var fin : Boolean ) ;
    procedure leerJugador ( var jugador : TJugador ; var fin : Boolean ) ;
    var
        i       : Integer  ;
        numeros : TNumeros ;

    begin
        for i := 1 to CANTDENUMEROS do
        begin
            numeros[ i ] := False ;
        end ;

        ReadLn ( jugador.DNI ) ;

        fin := ( jugador.DNI = 0 ) ;

        if ( not fin ) then
        begin
            ReadLn ( jugador.nombre ) ;

            repeat
                ReadLn ( jugador.numero ) ;
              
            until ( not numeros[ jugador.numero ] )
        end ;
    end ;
    // insertarALista ( equipos[ i ].jugadores , jugador ) ;

// procedure generarEquipos ( var equipos : TEquipos ) ;
    procedure generarEquipos ( var equipos : TEquipos ) ;
    var
        i       : Integer  ;
        fin     : Boolean  ;
        jugador : TJugador ;

    begin
        for i := 1 to CANTDEEQUIPOS do
        begin
            ReadLn ( equipos[ i ].nombre ) ;

            repeat              
                leerJugador ( jugador , fin ) ;

                if ( not fin ) then
                begin
                    insertarALista ( equipos[ i ].jugadores , jugador ) ;
                end ;
            until ( fin ) ;
        end ;
    end ;
//

var
begin
  
end.