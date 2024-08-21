{
    3.
    Se dispone de una lista con la información de los ingresantes a la Facultad en el año anterior.
    De cada ingresante se conoce: 
        apellido
        nombre
        ciudad de origen
        fecha de nacimiento (día, mes, año), 
        si presentó el título del colegio secundario
        código de la carrera en la que se inscribe (APU, LI, LS)

    Con esta información de los ingresantes se pide que recorra la lista una vez para: 
        a. Informar el apellido de los ingresantes cuya ciudad origen es “Brandsen”. 
        b. Calcular e informar el año en que más ingresantes nacieron (asumir que los años de nacimientos de los
            ingresantes pueden variar entre 1970 y 2000). 
        c. Informar la carrera con la mayor cantidad de inscriptos.
        d. Eliminar de la lista aquellos ingresantes que no presentaron el título.
}

program ej3 ;
const
    CANTDECARRERAS = 3    ;
    ANOMIN         = 1970 ;
    ANOMAX         = 2000 ;

type
    TCadena50 = string [ 50 ] ;

    TRangoDias         = 1..31             ;
    TRangoMeses        = 1..12             ;
    TRangoAnos         = 1..2024           ;
    TRangoCodDeCarrera = 1..CANTDECARRERAS ;


    TFecha = record
        dia : TRangoDias  ;
        mes : TRangoMeses ;
        ano : TRangoAnos  ;
    end ;

    TIngresante  = record
        apellido          : TCadena50          ;
        nombre            : TCadena50          ;
        cuidadDeOrigen    : TCadena50          ;
        fechaDeNacimiento : TFecha             ;
        tituloPresentado  : Boolean            ;
        codDeCarrera      : TRangoCodDeCarrera ;
    end ;

    TLista = ^nodo ;

    nodo = record
        ingresante : TIngresante ;
        sig        : TLista      ;
    end ;

    TAnos = array [ ANOMIN..ANOMAX ] of Integer ;

    TCarreras = array [ CANTDECARRERAS ] of Integer ;

// procedure inicializarAnos ( var anos : TAnos ) ;
    procedure inicializarAnos ( var anos : TAnos ) ;
    var
        i : Integer ;

    begin
        for i := ANOMIN to ANOMAX do
        begin
            anos[ i ] := 0 ;
        end ;
    end ;
//

// procedure inicializarCarreras ( var carreas : TCarreras ) ;
    procedure inicializarCarreras ( var carreas : TCarreras ) ;
    var
        i : Integer ;

    begin
        for i := 1 to CANTDECARRERAS do
        begin
            carreas[ i ] := 0 ;
        end ;
    end ;
//

// procedure actualizarAnos ( var anos : TAnos ; ano : TRangoAnos ) ;
    procedure actualizarAnos ( var anos : TAnos ; ano : TRangoAnos ) ;
    begin
        anos[ ano ] := ( anos[ ano ] + 1 ) ;
    end ;
//

// procedure actualizarCarreras ( var carreras : TCarreras ; codDeCarrea : TRangoCodDeCarrera ) ;
    procedure actualizarCarreras ( var carreras : TCarreras ; codDeCarrea : TRangoCodDeCarrera ) ;
    begin
        carreras[ codDeCarrea ] := ( carreras[ codDeCarrea ] + 1 ) ;
    end ;
//

// procedure informarApellido ( ingresante : TIngresante ) ;
    procedure informarApellido ( ingresante : TIngresante ) ;
    begin
        if ( ingresante.cuidadDeOrigen = 'Brandsen') then
        begin
            WriteLn ( ingresante.apellido ) ;
        end ;
    end ;
//

// procedure informarAnos ( anos : TAnos ) ;
    procedure informarAnos ( anos : TAnos ) ;
    var
        i   : Integer ;
        max : Integer ;

    begin
        max := -1 ;

        for i := ANOMIN TO ANOMAX do
        begin
            if ( max < anos[ i ] ) then
            begin
                max := i ;
            end ;
        end ;

        WriteLn ( max ) ;
    end ;
//

// procedure informarCarrera ( carreras : TCarreras ) ;
    procedure informarCarrera ( carreras : TCarreras ) ;
    var
        i   : Integer ;
        max : Integer ;

    begin
        max := -1 ;

        for i := 1 to CANTDECARRERAS do
        begin
            if ( max < carreras[ i ] ) then
            begin
                max := i ;
            end ;
        end ;

        WriteLn ( max ) ;
    end ;
//

// procedure eliminarNodo ( var L : TLista ; var ant : TLista ; var act : TLista ) ;
    procedure eliminarNodo ( var L : TLista ; var ant : TLista ; var act : TLista ) ;
    var
        aux : TLista ;

    begin
        if ( ant = act ) then
        begin
            aux := L ;

            L := L^.sig ;

            ant := L ;
            act := L ;
        end else
        begin
            aux := act ;

            act      := act^.sig ;
            ant^.sig := act      ;
        end ;

        Dispose ( aux ) ;
    end ;
//

// procedure recorrerLista ( var L : TLista ) ;
    procedure recorrerLista ( var L : TLista ) ;
    var
        ant      : TLista    ;
        act      : TLista    ;
        anos     : TAnos     ;
        carreras : TCarreras ;
    
    begin
        ant := L ;
        act := L ;

        inicializarAnos     ( anos     ) ;
        inicializarCarreras ( carreras ) ;

        while ( act <> Nil ) do
        begin
            actualizarAnos     ( anos     , act^.ingresante.fechaDeNacimiento.ano ) ;
            actualizarCarreras ( carreras , act^.ingresante.codDeCarrera          ) ;
            informarApellido   ( act^.ingresante                                  ) ;

            if ( not act^.ingresante.tituloPresentado ) then
            begin
                eliminarNodo ( L , ant , act ) ;
            end else
            begin
                ant := act      ;
                act := act^.sig ;
            end ;
        end ;

        informarAnos    ( anos     ) ;
        informarCarrera ( carreras ) ;
    end ;
//

// procedure liberarMemoria ( var L : TLista ) ;
    procedure liberarMemoria ( var L : TLista ) ;
    var
        aux : TLista ;

    begin
        while ( L <> Nil ) do
        begin
            aux := L ;

            L := L^.sig ;

            Dispose ( aux ) ;
        end ;
    end ;
//
    
var
    L : TLista ;

begin
    generarLista   ( L ) ;
    recorrerLista  ( L ) ;
    liberarMemoria ( L ) ;
end.