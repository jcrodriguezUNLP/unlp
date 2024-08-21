{
    4. Una La Una empresa de la ciudad de La Plata, que realiza entregas de paquetes dentro del casco 
urbano, está interesada en procesar la información de sus paquetes. De cada paquete se conoce la 
fecha de envío, si pudo ser entregado al destinatario y la dirección que está compuesta por los 
campos: calle (de 1 a 122), número, piso y departamento. 
Se dispone de una lista con los envíos del pasado año. Se requiere procesar la lista recorriéndola 
una sola vez para: 
a. Informar la cantidad de envíos realizados para cada calle. 
b. Informar el nombre del mes con mayor cantidad de paquetes enviados. 
c. Eliminar de la lista de envíos, aquellos que no fueron entregados al destinatario. 
d. Generar 10 nuevas listas con los envíos de las calles 11 a la 20. Cada lista debe estar ordenada 
por el número de la dirección. 
}

program ej4 ;
const
    CANTDECALLES = 122 ;

type
    TDia   = 1..31           ;
    TMes   = 1..12           ;
    TAño   = 0..2024         ;
    TCalle = 1..CANTDECALLES ;

    TCadena50 = string [ 50 ] ;

    TFecha = record
        dia : TDia ;
        mes : TMes ;
        año : TAño ;
    end ;

    TDireccion = record
        calle  : TCalle  ;
        numero : Integer ;
        piso   : Integer ;
        depto  : Char    ;
    end ;

    TPaquete = record
        fechaDeEnvio : TFecha     ;
        entregado    : Boolean    ;
        direccion    : TDireccion ;
    end ;

    TLista = ^nodo ;

    nodo = record
        paquete : TPaquete ;
        sig     : TLista   ;
    end ;

    TCalles = array [ TCalle ] of Integer ;

    TMeses = array [ TMes ] of Integer ;

    TListas = array [ 11..20 ] of TLista ;

    TMax = record
        mes            : Integer ;
        cantDePaquetes : Integer ;
    end ;

    TNombres = array [ TMes ] of TCadena50 ;
 
// generarLista ( var L : TLista ) ; // SE DISPONE

// procedure iniclizarCalles ( var calles : TCalles ) ;
    procedure iniclizarCalles ( var calles : TCalles ) ;
    var
        i : Integer ;

    begin
        for i := 1 to CANTDECALLES do
        begin
            calles[ i ] := 0 ;
        end ;
    end ;
//

// procedure iniclizarMeses  ( var meses : TMeses ) ;
    procedure iniclizarMeses  ( var meses : TMeses ) ;
    var
        i : Integer ;

    begin
        for i := 1 to 12 do
        begin
            meses := 0 ;
        end ;
    end ;
//

// procedure actualizarCalles ( var calles , calle : TCalle ) ;
    procedure actualizarCalles ( var calles , calle : TCalle ) ;
    begin
        calles[ calle ] := ( calles[ calle ] + 1 ) ;
    end ;
//

// procedure actualizarMeses  ( var meses : TMeses ; mes : TMes ) ;
    procedure actualizarMeses  ( var meses : TMeses ; mes : TMes ) ;
    begin
        meses[ mes ] := ( meses[ mes ] + 1 ) ;
    end ;
//

// procedure agregarALista ( var L : TLista ; nuevo : TLista ) ;
    procedure agregarALista ( var L : TLista ; nuevo : TLista ) ;
    var
        ant : TLista ;
        act : TLista ;

    begin
        ant := L ;
        act := L ;

        while ( (act <> Nil) and (act^.paquete.direccion.numero < nuevo^.paquete.direccion.numero) ) do
        begin
            ant := act      ;
            act := act^.sig ;
        end ;

        if ( ant = act ) then
        begin
            L := nuevo ;
        end else
        begin
            ant^.sig := nuevo ;
        end ;

        nuevo^.sig := act ;
    end ;
//

// procedure agregarAListas ( var Listas : TListas ; act : TLista ) ;
    procedure agregarAListas ( var Listas : TListas ; act : TLista ) ;
    begin
        if ( 10 < act^.paquete.direccion.calle < 21 ) then
        begin
            agregarALista ( Listas[ act^.paquete.direccion.calle ] , act ) ;
        end ;
    end ;
//

// procedure informarCalles ( calles : TCalles ) ;
    procedure informarCalles ( calles : TCalles ) ;
    var
        i : Integer ;

    begin
        for i := 1 to CANTDECALLES do
        begin
            WriteLn ( 'calle ' , i , ': ' , calles[ i ] ) ;
        end ;
    end ;
//

// procedure informarMes ( meses : TMeses ) ;
    procedure informarMes ( meses : TMeses ) ;
    var
        i       : Integer  ;
        max     : TMax     ;

    begin
        max.cantDePaquetes := -1 ;

        for i := 1 to 12 do
        begin
            if ( max.cantDePaquetes < meses[ i ] ) then
            begin
                max.cantDePaquetes := meses[ i ] ;
                max.mes            := i          ;
            end ;
        end ;

        WriteLn ( 'El mes con mas paquetes fue ' , max.mes , ' con ' , max.cantDePaquetes , ' paquetes' ) ;
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
        ant    : TLista  ;
        act    : TLista  ;
        meses  : TMeses  ;
        calles : TCalles ;
        Listas : TListas ;
    
    begin
        iniclizarCalles ( calles ) ;
        iniclizarMeses  ( meses  ) ;

        ant := L ;
        act := L ;

        while ( act <> Nil ) do
        begin
            if ( act^.paquete.entregado ) then
            begin
                actualizarCalles ( calles , act^.paquete.direccion.calle  ) ;
                actualizarMeses  ( meses  , act^.paquete.fechaDeEnvio.mes ) ;
                agregarAListas   ( Listas , act                           ) ;

                ant := act      ;
                act := act^.sig ;
            end else
            begin
                eliminarNodo ( L , ant , act ) ;
            end ;
        end ;

        informarCalles ( calles ) ;
        informarMes    ( meses  ) ;
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