program aerolinea ;
const
    LARGOPATENTE      = 8   ;
    CANTDECODSDEVIAJE = 200 ;

type
    TRangoPatente       = 1..LARGOPATENTE      ;
    TRangoCodigoDeViaje = 1..CANTDECODSDEVIAJE ;
    TRangoDia           = 1..31                ;
    TRangoMes           = 1..12                ;
    TRangoAño           = 0..2024              ;

    TCadena50 = string [ 50 ] ;

    TPatente = array [ TRangoPatente ] of char ;

    TFecha = record
        dia : TRangoDia ;
        mes : TRangoMes ;
        año : TRangoAño ;
    end ;

    TPasajero = record
        nombre : TCadena50 ;
        DNI    : TDNI      ;
    end ;

    TPasaje = record
        patenteDeLaAeronave : TPatente            ;
        codigoDeViaje       : TRangoCodigoDeViaje ;
        fecha               : TFecha              ;
        pasajero            : TPasajero           ;
        precio              : Real                ;
    end ;

    TLista = ^nodo ;

    nodo = record
        pasaje : TPasaje ;
        sig    : TLista  ;
    end ;

    TNombresDeAeropuertos = array [ TRangoCodigoDeViaje ] of TCadena50 ;

    TCantidadDePasajeros = array [ TRangoCodigoDeViaje ] of Integer ;

    TMaximos = record
        aeropuerto          : TCadena50 ;
        cantidadDePasajeros : Integer   ; 
    end ;
    
    TMaximos = array [ 1..2 ] of TMaximo ;

    TListas = array [ TRangoCodigoDeViaje ] of TLista ;

    TAeronave = record
        cantidadDePasajes : Integer ;
        costoTotal        : Real    ;
    end ;

// procedure recorrerLista ( var L : TLista ; nombresDeAeropuertos : TNombresDeAeropuertos ) ;
    procedure recorrerLista ( var L : TLista ; nombresDeAeropuertos : TNombresDeAeropuertos ) ;
    var
        ant      : TLista    ;
        act      : TLista    ;
        aeronave : TAeronave ;

    begin
        ant := L ;
        act := L ;

        reiniciarAeronave ( aeronave)

        while ( act <> Nil ) do
        begin

        end ;
    end ;
//


var

begin
  
end.