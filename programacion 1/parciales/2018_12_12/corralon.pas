program corralon ;
const
    LARGOCODDEPRODUCTO = 15 ;
    CANTDERUBROS       = 51 ;

type
    TCodigo = array [ 1..15 ] of char ;

    TRangoRubros = 1..CANTDERUBROS ;

    TCadena50 = String [ 50 ] ;
    TCadena2  = String [ 2  ] ;

    TProducto = record
        codDeProducto : TCodigo      ;
        descripcion   : TCadena50    ;
        stockMin      : Integer      ;
        stockAct      : Integer      ;
        codDeRubro    : TRangoRubros ;
    end ;

    TLista = ^nodo ;

    nodo = record
        producto : TProducto ;
        sig      : TLista    ;
    end ;

    TNombres = array [ TRangoRubros ] of TCadena50 ;

    TRubro = record
        cantidadDeProductos : Integer   ;
        // costoPromedio       : Real      ;
    end ;

    TRubros = array [ TRangoRubros ] of TRubro ;

    TMaximo = record
        nombre              : TCadena50 ;
        cantidadDeProductos : Integer   ;
    end ;

    TMaximos = array [ 1..2 ] of TMaximo ;

    TConjuntoDeChar = set of char ;

    TListas = array [ 1..3 ] of TLista ;

    // innecesario
        TLetras = array[ 1..CANTDERUBROS ] of char ;
    //

const
    CODVALIDO   : TCodigo = ( '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E' ) ;
    CODINVALIDO : TCodigo = ( 'I','N','V','A','L','I','D','O',' ','<','3',' ',':',')',' ' ) ;

    LETRAS : TLetras = ( 'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y' ) ;

// INNECESARIO
    // procedure imprimirLista ( L : TLista ) ;
        procedure imprimirLista ( L : TLista ) ;
        var
            i : Integer ;

        begin
            while ( L <> Nil ) do
            begin
                WriteLn () ;

                WriteLn ( 'Producto') ;

                Write ( '    codigoDeProducto: ') ;
                for i := 1 to LARGOCODDEPRODUCTO do
                begin
                    Write ( L^.producto.codDeProducto[ i ] ) ;
                end ;

                WriteLn () ;

                WriteLn ( '    Descripcion: '  , L^.producto.descripcion ) ;
                WriteLn ( '    Stock minimo: ' , L^.producto.stockMin    ) ;
                WriteLn ( '    Stock actual: ' , L^.producto.stockAct    ) ;

                L := L^.sig ;
            end ;
        end ;
    //

    // procedure generarLista2 ( var L : TLista ) ;
        procedure generarLista2 ( var L : TLista ) ;
        var
            i        : Integer   ;
            si       : TCadena2  ;
            fin      : Boolean   ;
            ult      : TLista    ;
            nuevo    : TLista    ;
            producto : TProducto ;

            j     : Integer ;

        begin
            i := 1 ;

            WriteLn () ;

            WriteLn ( 'Usted esta generando un Lista de productos' ) ;

            repeat
                Write  ( '  Desea ingresar un nuevo producto SI/NO: ') ;
                ReadLn ( si                                          ) ;


                fin := (
                        (si <> 'si') and
                        (si <> 'Si') and
                        (si <> 'SI')
                ) ;
                
                if ( not fin ) then
                begin
                    WriteLn ( '    Producto N°' , i , ':'       ) ;
                    Write   ( '        Codigo de Rubro(1..51): ') ;
                    ReadLn  ( producto.codDeRubro               ) ;

                    WriteLn  ( '        Codigo de producto: '                                           ) ;
                    Write    ( '            ingrese "0" para CODIGO INVALIDO o "1" para CODIGO VALIDO: ') ;
                    ReadLn   ( j                                                                        ) ;

                    if ( j = 0 ) then
                    begin
                        producto.codDeProducto := CODINVALIDO
                    end else
                    begin
                        producto.codDeProducto := CODVALIDO
                    end ;

                    producto.descripcion := LETRAS[ i ] ;
                    
                    Write  ( '        Stock minimo: ' ) ;
                    ReadLn ( producto.stockMin        ) ;
                    
                    Write  ( '        Stock actual: ' ) ;
                    ReadLn ( producto.stockAct        ) ;

                    WriteLn () ;

                    New ( nuevo ) ;

                    nuevo^.producto := producto ;
                    nuevo^.sig      := Nil      ;

                    if ( L = Nil ) then
                    begin
                        L   := nuevo ;
                    end else
                    begin
                        ult^.sig := nuevo ;
                    end ;

                    ult := nuevo ;

                    i := ( i + 1 ) ;
                end else
                begin
                    WriteLn ( 'Carga finalizada, Lista generada correctamente' ) ;
                end ;
            until ( fin ) 
        end ;
    //

    // procedure generarNombres2 ( var nombres : TNombres ) ;
        procedure generarNombres2 ( var nombres : TNombres ) ;
        var
            i : Integer ;

        begin
            for i := 1 to CANTDERUBROS do
            begin
                nombres[ i ] := LETRAS[ i ] ;
            end ;
        end ;
    //
//

// procedure generarLista ( var L : TLista ) ;
    procedure generarLista ( var L : TLista ) ;
    var
        i        : Integer   ;
        si       : TCadena2  ;
        fin      : Boolean   ;
        ult      : TLista    ;
        nuevo    : TLista    ;
        producto : TProducto ;

    begin
        i := 1 ;

        WriteLn () ;
        
        WriteLn ( 'Usted esta generando un Lista de productos' ) ;
        
        repeat
            Write  ( '  Desea ingresar un nuevo producto SI/NO: ' ) ;
            ReadLn ( si                                           ) ;


            fin := (
                    (si <> 'si') and
                    (si <> 'Si') and
                    (si <> 'SI')
            ) ;
            
            if ( not fin ) then
            begin
                WriteLn ( '    Producto N°' , i , ':'       ) ;
                Write   ( '        Codigo de Rubro(1..51): ') ;
                ReadLn  ( producto.codDeRubro               ) ;

                Write  ( '        Codigo de producto: ' ) ;
                ReadLn ( producto.codDeProducto         ) ;

                Write  ( '        Descripcion: ' ) ;
                ReadLn ( producto.descripcion    ) ;
                
                Write  ( '        Stock minimo: ' ) ;
                ReadLn ( producto.stockMin        ) ;
                
                Write  ( '        Stock actual: ' ) ;
                ReadLn ( producto.stockAct        ) ;

                WriteLn () ;

                New ( nuevo ) ;

                nuevo^.producto := producto ;
                nuevo^.sig      := Nil      ;

                if ( L = Nil ) then
                begin
                    L   := nuevo ;
                end else
                begin
                    ult^.sig := nuevo ;
                end ;

                ult := nuevo ;

                i := ( i + 1 ) ;
            end else
            begin
                WriteLn ( 'Carga finalizada, Lista generada correctamente' ) ;
            end ;
        until ( fin ) 
    end ;
//

// procedure generarNombres ( var nombres : TNombres ) ;
    procedure generarNombres ( var nombres : TNombres ) ;
    var
        i : Integer ;

    begin
        WriteLn () ;

        for i := 1 to CANTDERUBROS do
        begin
            Write  ( 'Ingrese el nombre del rubro N°' , i , ': ' ) ;
            ReadLn ( nombres[ i ]                                ) ;
        end ;
    end ;
//

// function cumpleCodigo ( cod : TCodigo ) : Boolean ;
    function cumpleCodigo ( cod : TCodigo ) : Boolean ;
    var
        i                : Integer         ;
        fin              : Boolean         ;
        digitos          : TConjuntoDeChar ;
        mayusculas       : TConjuntoDeChar ;
        cantDeDigitos    : Integer         ;
        cantDeMayusculas : Integer         ;

    begin
        digitos    := [ '0'..'9' ] ;
        mayusculas := [ 'A'..'Z' ] ;
        
        cantDeDigitos    := 0 ;
        cantDeMayusculas := 0 ;
        
        i   := 1     ;
        fin := false ;

        while ( (not fin) and (i <= 10) ) do
        begin
            if ( cod[ i ] in digitos ) then
            begin
                cantDeDigitos := ( cantDeDigitos + 1 ) ;
                i             := ( i             + 1 ) ;
            end else
            begin
                fin := true ;
            end ;
        end ;

        while ( (not fin) and (i <= LARGOCODDEPRODUCTO) ) do
        begin  
            if ( cod[ i ] in mayusculas ) then
            begin
                cantDeMayusculas := ( cantDeMayusculas + 1 ) ;
                i                := ( i                + 1 ) ;
            end else
            begin
                fin := true ;
            end ;
        end ;

        cumpleCodigo := ( not fin ) ;
    end ;
//

// procedure reiniciarRubros ( var rubros : TRubros ) ;
    procedure reiniciarRubros ( var rubros : TRubros ) ;
    var
        i : Integer ;
    
    begin
        for i := 1 to CANTDERUBROS do
        begin
            rubros[ i ].cantidadDeProductos := 0  ;
        end ;
    end ;
//

// procedure actualizarRubros ( var rubros : TRubros ; codDeRubro : Integer ) ;
    procedure actualizarRubros ( var rubros : TRubros ; codDeRubro : Integer ) ;
    begin
        rubros[ codDeRubro ].cantidadDeProductos := ( rubros[ codDeRubro ].cantidadDeProductos + 1 ) ;
    end ;
//

// procedure informarRubros ( rubros : TRubros ; nombres : TNombres ) ;
    procedure informarRubros ( rubros : TRubros ; nombres : TNombres ) ;
    var
        i : Integer ;
    
    begin
        WriteLn () ;
        
        WriteLn ( 'Rubros:' ) ;

        for i := 1 to CANTDERUBROS do
        begin
            WriteLn ( '    Rubro N°' , i , ':') ;
            WriteLn ( '        Nombre: '                , nombres[ i ]                   ) ;
            WriteLn ( '        Cantidad de productos: ' , rubros[ i ].cantidadDeProductos) ;
            WriteLn () ;
        end ;
    end ;
//

// procedure reiniciarMaximos( var maximos : TMaximos ) ;
    procedure reiniciarMaximos( var maximos : TMaximos ) ;
    var
        i : Integer ;

    begin
        for i := 1 to 2 do
        begin
            maximos[ i ].nombre              := '' ;
            maximos[ i ].cantidadDeProductos := 0  ;
        end ;
    end ;
//

// procedure actualizarMaximos ( var maximos : TMaximos ; rubros : TRubros ; nombres : TNombres ) ;
    procedure actualizarMaximos ( var maximos : TMaximos ; rubros : TRubros ; nombres : TNombres ) ;
    var
        i : Integer ;

    begin
        for i := 1 to CANTDERUBROS do
        begin
            if ( maximos[ 1 ].cantidadDeProductos < rubros[ i ].cantidadDeProductos ) then
            begin
                maximos[ 2 ] := maximos[ 1 ] ;

                maximos[ 1 ].nombre              := nombres[ i ]                     ;
                maximos[ 1 ].cantidadDeProductos := rubros [ i ].cantidadDeProductos ;
            end
            else if ( maximos[ 2 ].cantidadDeProductos < rubros[ i ].cantidadDeProductos ) then
            begin
                maximos[ 2 ].nombre              := nombres[ i ]                     ;
                maximos[ 2 ].cantidadDeProductos := rubros [ i ].cantidadDeProductos ;
            end ;
        end ;
    end ;
//

// procedure informarMaximos ( maximos : TMaximos ) ;
    procedure informarMaximos ( maximos : TMaximos ) ;
    var
        i : Integer ;
    
    begin
        WriteLn( 'maximos:' ) ;

        for i := 1 to 2 do
        begin
            WriteLn ( '    Maximo N°'                   , i , ': '                         ) ;
            WriteLn ( '        Nombre: '                , maximos[ i ].nombre              ) ;
            WriteLn ( '        Cantidad de productos: ' , maximos[ i ].cantidadDeProductos ) ;
            WriteLn () ;
        end ;
    end ;
//

// procedure agregarALista ( var L : TLista ; producto : TProducto ) ;
    procedure agregarALista ( var L : TLista ; producto : TProducto ) ;
    var
        ant   : TLista ;
        act   : TLista ;
        nuevo : TLista ;

    begin
        ant := L ;
        act := L ;

        New ( nuevo ) ;

        nuevo^.producto := producto ;

        while ( (act <> Nil) and (act^.producto.descripcion < producto.descripcion ) ) do
        begin
            ant := act      ;
            act := act^.sig ;
        end ;

        if ( ant =  act ) then
        begin
            L      := nuevo ;
            L^.sig := Nil   ;
        end else
        begin
            nuevo^.sig := act   ;
            ant^.sig   := nuevo ;
        end ;
    end ;
//

// procedure agregarAListas ( var Listas : TListas ; producto : TProducto ) ;
    procedure agregarAListas ( var Listas : TListas ; producto : TProducto ) ;
    begin
        if ( not cumpleCodigo(producto.codDeProducto) ) then
        begin
            agregarALista ( Listas[ 1 ] , producto ) ;
        end else
        begin
            if ( producto.stockAct < producto.stockMin ) then
            begin
                agregarALista ( Listas[ 2 ] , producto ) ;
            end ;

            if ( producto.stockMin < producto.stockAct ) then
            begin
                agregarALista ( Listas[ 3 ] , producto ) ;
            end ;
        end ;
    end ;
//

// procedure recorrerLista ( L : TLista ; var Listas : TListas ; nombres : TNombres ) ;
    procedure recorrerLista ( L : TLista ; var Listas : TListas ; nombres : TNombres ) ;
    var
        rubros  : TRubros  ;
        maximos : TMaximos ;

    begin
        reiniciarRubros  ( rubros  ) ;
        reiniciarMaximos ( maximos ) ;

        while ( L <> Nil ) do
        begin
            actualizarRubros  ( rubros  , L^.producto.codDeRubro ) ;

            agregarAListas ( Listas , L^.producto ) ;

            L := L^.sig ;
        end ;

        informarRubros    ( rubros  , nombres          ) ;
        actualizarMaximos ( maximos , rubros , nombres ) ;
        informarMaximos   ( maximos                    ) ;
    end ;
//

// procedure liberarMemoria ( var L : TLista ) ;
    procedure liberarMemoria ( var L : TLista ) ;
    var
        aux : TLista ;

    begin
        while ( L <> Nil ) do
        begin
            aux := L      ;
            L   := L^.sig ;

            Dispose ( aux ) ;
        end ;
    end ;
//

var
    i       : Integer  ;
    L       : TLista   ;
    Listas  : TListas  ;
    nombres : TNombres ;

begin
    generarLista2   ( L                    ) ;
    generarNombres2 ( nombres              ) ;
    recorrerLista   ( L , listas , nombres ) ;
    liberarMemoria  ( L                    ) ;

    for i := 1 to 3 do
    begin
        liberarMemoria ( Listas[ i ] ) ;
    end ;
end.