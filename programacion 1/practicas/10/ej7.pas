{
    7. Una empresa de gas tiene que revisar los montos facturados a sus clientes durante el mes Junio.
    De cada factura se conoce el código de cliente, categoría de consumo (1 a 10), metros cúbicos (m3) 
    consumidos, monto total de la factura y cada monto facturado durante los 12 meses del año anterior.

    Se dispone de una lista con la información anterior y de una estructura que se accede por categoría 
    de consumo al nombre de esta. Procesar la lista de facturas recorriéndola una sola vez para: 
    • separar la lista por las 3 condiciones, ordenándolas por código de cliente: 
    o sin revisión: facturas cuyo monto es menor que el promedio del año anterior. 
    o revisión: facturas cuyo monto es mayor que el promedio del año anterior y tiene más de 1000m3 consumidos. 
    o refacturación: facturas cuyo monto es mayor que el promedio del año anterior y tiene menos de 1000m3 consumidos. 
    • calcular e informar el nombre y los m3 consumidos para todas las categorías de consumo. 
}

program ej7 ;
const
    CANTDECATEGORIAS = 10 ;
type
    TRangoCategorias = 1..CANTDECATEGORIAS ;

    TCadena50 = String [ 50 ] ;

    TAñoAnt = array [ 1..12 ] of Real ;

    TFactura = record
        codDeCliente  : Integer          ;
        catDeConsumo  : TRangoCategorias ;
        m3Consumidos  : Real             ;
        monto         : Real             ;
        añoAnt        : TAñoAnt          ;
    end ;

    TLista = ^nodo ;

    nodo = record
        factura : TFactura ;
        sig     : TLista   ;
    end ;

    TNombres = array [ TCatDeConsumo ] of TCadena50 ; 

    TListas = array [ 1..3 ] of TLista ;

    TCategorias = array [ TRangoCategorias ] of Real ;

// procedure generarLista   ( var L       : TLista   ) ; // SE DISPONE
// procedure generarNombres ( var nombres : TNombres ) ; // SE DISPONE

// procedure inicializarCategorias ( var categorias : TCategorias ) ;
    procedure inicializarCategorias ( var categorias : TCategorias ) ;
    var
        i : Integer ;

    begin
        for i := 1 to CANTDECATEGORIAS do
        begin
            categorias[ i ] := 0 ;
        end ;
    end ;
//

// function promedioAñoAnterior ( añoAnt : TAñoAnt ) : Real ;
    function promedioAñoAnterior ( añoAnt : TAñoAnt ) : Real ;
    var
        i    : Integer ;
        suma : Real    ;

    begin
        suma := 0 ;

        for i := 1 to 12 do
        begin
            suma := ( suma + añoAnt[ i ] ) ;
        end ;

        promedioAñoAnterior := ( suma / 12 ) ;
    end ;
//

// procedure inicializarListas ( var Listas : TListas ) ;
    procedure inicializarListas ( var Listas : TListas ) ;
    var
        i : Integer ;

    begin
        for i := 1 to 3 do
        begin
            Listas[ i ] := Nil ;
        end ;
    end ;
//

// procedure agregarALista ( var L : TLista ; factura : TFactura ) ;
    procedure agregarALista ( var L : TLista ; factura : TFactura ) ;
    var
        ant   : TLista ;
        act   : TLista ;
        nuevo : TLista ;
    
    begin
        New ( nuevo ) ;

        nuevo^.factura := factura ;

        ant := L ;
        act := L ;

        while ( (act <> Nil) and ( act^.factura.codDeCliente < factura.codDeCliente) ) do
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

// procedure agregarAListas ( var Listas : TListas ; factura : TFactura ) ;
    procedure agregarAListas ( var Listas : TListas ; factura : TFactura ) ;
    begin
        if ( factura.monto < promedioAñoAnterior( factura.añoAnt ) ) then
        begin
            agregarALista ( Listas[ 1 ] , factura ) ;
        end
        else if ( (promedioAñoAnterior( factura.añoAnt ) < factura.monto) and (1000 < factura.m3Consumidos) ) then
        begin
            agregarALista ( Listas[ 2 ] , factura ) ;
        end else
        begin
            agregarALista ( Listas[ 3 ] , factura ) ;
        end ;
    end ;
//

// procedure actualizarCategorias ( var categorias : TCategorias ; factura : TFactura ) ;
    procedure actualizarCategorias ( var categorias : TCategorias ; factura : TFactura ) ;
    var
        i : Integer ;

    begin
        for i := 1 to CANTDECATEGORIAS do
        begin
            categorias[ factura.catDeConsumo ] := ( categorias[ factura.catDeConsumo ] + factura.m3Consumidos ) ;
        end ;
    end ;
//

// procedure informarCategorias ( categorias : TCategorias ; nombres : TNombres ) ;
    procedure informarCategorias ( categorias : TCategorias ; nombres : TNombres ) ;
    var
        i : Integer ;

    begin
        for i := 1 to CANTDECATEGORIAS do
        begin
            WriteLn ( 'la categoria ' , nombres[ i ] , ' consumio ' , categorias[ i ] , ' metros cubicos' ) ;
        end ;
    end ;
//

// procedure recorrerLista ( L : TLista ; nombres : TNombres ; var Listas : TListas ) ;
    procedure recorrerLista ( L : TLista ; nombres : TNombres ; var Listas : TListas ) ;
    var
        categorias : TCategorias ;

    begin
        inicializarCategorias ( categorias ) ;

        while ( L <> Nil ) do
        begin
            agregarAListas       ( Listas     , L^.factura ) ;
            actualizarCategorias ( categorias , L^.factura ) ;
        end ;

        informarCategorias ( categorias , nombres ) ;
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
    L       : TLista   ;
    Listas  : TListas  ;
    nombres : TNombres ;

begin
    generarLista      ( L           ) ;
    generarNombres    ( nombres     ) ;
    inicializarListas ( Listas      ) ;
    recorrerLista     ( L , nombres ) ;
    liberarMemoria    ( L           ) ;

    for i := 1 to 3 do
    begin
        liberarMemoria ( Listas[ i ] ) ;
    end ;
end.