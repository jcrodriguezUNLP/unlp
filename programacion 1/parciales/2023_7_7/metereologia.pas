program metereologia ;
const
    CANTDEPROVS = 3 ;

type
    TCadena50   = string [ 50 ]  ;
    TRangoProvs = 1..CANTDEPROVS ;

    TRegistro = record
        codDeEstacion : integer     ;
        codDeMedicion : integer     ;
        ciudad        : TCadena50   ;
        codDeProv     : TRangoProvs ;
        temperatura   : real        ;
    end ;

    TLista = ^nodo ;

    nodo = record
        registro : TRegistro ;
        sig      : TLista    ;
    end ;

    TTablaNombres = array [ TRangoProvs ] of TCadena50 ;

    TProvincia = record
        sumaDeTemps     : real    ;
        cantDeRegistros : Integer ;
        tempPromedio    : real    ;
    end ;

    TProvincias = array [ TRangoProvs ] of TProvincia ;

    TMinimo = record
        nombre       : TCadena50 ;
        tempPromedio : real      ;
    end ;

    TMinimos = array [ 1..2 ] of TMinimo ;

    TListas = array [ TRangoProvs ] of TLista ;

// se disponen
    // procedure generarLista ( var L : TLista ) ;
        procedure generarLista ( var L : TLista ) ;
        var
            i     : Integer ;
            ult   : TLista  ;
            nuevo : TLista  ;

        begin
            L   := Nil ;

            for i := 1 to CANTDEPROVS do 
            begin

                New ( nuevo ) ;

                WriteLn () ;

                WriteLn ( 'registro N°' , i , ':' ) ;

                Write  ( '    codDeEstacion: '         ) ;
                ReadLn ( nuevo^.registro.codDeEstacion ) ;

                Write  ( '    codDeMedicion: '         ) ;
                ReadLn ( nuevo^.registro.codDeMedicion ) ;

                Write  ( '    ciudad: '         ) ;
                ReadLn ( nuevo^.registro.ciudad ) ;

                Write  ( '    codDeProv: '         ) ;
                ReadLn ( nuevo^.registro.codDeProv ) ;

                Write  ( '    temperatura: '         ) ;
                ReadLn ( nuevo^.registro.temperatura ) ;

                nuevo^.sig := Nil ;

                if ( L = Nil ) then
                begin
                    L   := nuevo ;
                    ult := L     ;
                end else
                begin
                    ult^.sig := nuevo ;
                    ult      := nuevo ;
                end ;
            end ;
        end ;
    //

    //procedure generarTablaNombres ( var tablaNombres : TTablaNombres ) ;
        procedure generarTablaNombres ( var tablaNombres : TTablaNombres ) ;
        var
            i     : Integer ;

        begin
            WriteLn () ;

            for i := 1 to CANTDEPROVS do
            begin
                Write  ( 'Nombre de la provicia N°' , i , ': ' ) ;
                ReadLn ( tablaNombres[ i ]                     ) ;
            end ;
        end ;
    //
//

// innecesario
    //procedure imprimirLista ( L : TLista ) ;
        procedure imprimirLista ( L : TLista ) ;
        var
            i : Integer ;

        begin
            i := 1 ;

            WriteLn () ;

            WriteLn ( 'arranca el imprimir' ) ;
            while ( L <> Nil ) do
            begin
                WriteLn () ;

                WriteLn ( 'registro: ' , i ) ;

                WriteLn ( '    codDeEstacion: ' , L^.registro.codDeEstacion ) ;
                WriteLn ( '    codDeMedicion: ' , L^.registro.codDeMedicion ) ;
                WriteLn ( '    ciudad: '        , L^.registro.ciudad        ) ;
                WriteLn ( '    codDeProv: '     , L^.registro.codDeProv     ) ;
                WriteLn ( '    temperatura: '   , L^.registro.temperatura   ) ;

                i := ( i + 1 ) ;

                L := L^.sig ;
            end ;

            WriteLn () ;

            WriteLn ('termine de imprimir') ;
        end ;
    //
//

// procedure inicializarProvincias ( var provs : TProvincias ) ;
    procedure inicializarProvincias ( var provs : TProvincias ) ;
    var
        i : integer ;
    
    begin
        for i := 1 to CANTDEPROVS do
        begin
            provs[ i ].sumaDeTemps     := 0 ;
            provs[ i ].cantDeRegistros := 0 ;
        end ;
    end ;
//

// procedure actualizarProvincias ( var provs : TProvincias ; registro : TRegistro ) ;
    procedure actualizarProvincias ( var provs : TProvincias ; registro : TRegistro ) ;
    var
        prov : TProvincia ;
    
    begin
        prov := provs[ registro.codDeProv ] ;

        prov.sumaDeTemps     := ( prov.sumaDeTemps     + registro.temperatura ) ;
        prov.cantDeRegistros := ( prov.cantDeRegistros + 1                    ) ;
        prov.tempPromedio    := ( prov.sumaDeTemps     / prov.cantDeRegistros ) ;
        
        provs[ registro.codDeProv ] := prov ;
    end;
//

// procedure informarProvincias ( provs : TProvincias ; tablaNombres : TTablaNombres ) ;
    procedure informarProvincias ( provs : TProvincias ; tablaNombres : TTablaNombres ) ;
    var
        i : Integer ;
    
    begin
        WriteLn () ;

        WriteLn ( 'informarProvincias:' ) ;

        for i := 1 to CANTDEPROVS do
        begin
            if ( provs[ i ].cantDeRegistros = 0 ) then
            begin
                WriteLn () ;

                WriteLn ( '    provincia: '    , tablaNombres[ i ] ) ;
                WriteLn ( '        sin registros'                  ) ;

            end else
            begin
                WriteLn () ;

                WriteLn ( '    provincia: '    , tablaNombres[ i ]                          ) ;
                WriteLn ( '        tempPromedio: ' , provs       [ i ].tempPromedio : 2 : 2 ) ;
            end ;
        end;
    end ;
//

// procedure inicializarMinimos ( var minimos : TMinimos ) ;
    procedure inicializarMinimos ( var minimos : TMinimos ) ;
    var
        i : integer ;
    
    begin
        for i := 1 to 2 do
        begin
            minimos[ i ].tempPromedio := 0 ;
        end ;
    end ;
//

// procedure actualizarMinimos ( var minimos : TMinimos ; provs : TProvincias ; tablaNombres : TTablaNombres ) ;
    procedure actualizarMinimos ( var minimos : TMinimos ; provs : TProvincias ; tablaNombres : TTablaNombres ) ;
    var
        i : integer ;
    
    begin
        for i := 1 to CANTDEPROVS do 
        begin
            if ( provs[ i ].cantDeRegistros <> 0 ) then
            begin
                if ( minimos[ 1 ].tempPromedio < provs[ i ].tempPromedio ) then
                begin
                    minimos[ 2 ] := minimos[ 1 ] ;

                    minimos[ 1 ].nombre       := tablaNombres[ i ]              ;
                    minimos[ 1 ].tempPromedio := provs       [ i ].tempPromedio ;

                end else if ( minimos[ 2 ].tempPromedio < provs[ i ].tempPromedio ) then
                begin
                    minimos[ 2 ].nombre       := tablaNombres[ i ]              ;
                    minimos[ 2 ].tempPromedio := provs       [ i ].tempPromedio ;
                end ;
            end ;
        end ;
    end ;
//

// procedure informarMinimos ( minimos : TMinimos ) ;
    procedure informarMinimos ( minimos : TMinimos ) ;
    var
        i : Integer ;
    
    begin
        WriteLn () ;

        WriteLn ( 'informarMinimos:' ) ;

        for i := 1 to 2 do
        begin
            WriteLn () ;

            WriteLn ( '    minimo ' , i , ': ') ;

            WriteLn ( '        nombre: '       , minimos[ i ].nombre               ) ;
            WriteLn ( '        tempPromedio: ' , minimos[ i ].tempPromedio : 2 : 2 ) ;
        end;
    end ;
//

// procedure inicializarListas ( var Listas : TListas ) ;
    procedure inicializarListas ( var Listas : TListas ) ;
    var
        i : integer ;
    
    begin
        for i := 1 to CANTDEPROVS do
        begin
            Listas[ i ] := Nil ;
        end ;
    end ;
//

// procedure agregarAListas ( Listas : TListas ; aInsertar : TLista ) ;
    procedure agregarAListas ( var Listas : TListas ; aInsertar : TLista ) ;
    var
        L     : TLista ;
        ant   : TLista ;
        act   : TLista ;
        nuevo : TLista ;

    begin
        New ( nuevo ) ;

        nuevo^.registro := aInsertar^.registro ;

        L := Listas[ aInsertar^.registro.codDeEstacion ] ;

        ant := L ;
        act := L ;

        while ( (act <> Nil) and (act^.registro.codDeEstacion < nuevo^.registro.codDeEstacion) ) do
        begin
            ant := act      ;
            act := act^.sig ;
        end ;

        if ( ant = act ) then
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

// function registroIncorrecto ( registro : TRegistro ) : Boolean ;
    function registroIncorrecto ( registro : TRegistro ) : Boolean ;
    var
        pares       : Integer ;
        impares     : Integer ;
        resto       : Integer ;

    begin
        pares   := 0 ;
        impares := 0 ;

        while ( registro.codDeEstacion <> 0 ) do
        begin
            resto := ( (registro.codDeEstacion div 10) mod 2 ) ;

            if ( resto = 0 ) then
            begin
                pares := ( pares + 1 ) ;
            end else
            begin
                impares := ( impares + 1 ) ;
            end ;

            registro.codDeEstacion := ( registro.codDeEstacion div 10 ) ;
        end ;

        if ( pares = impares ) then
        begin
            pares   := 0 ;
            impares := 0 ;

            while ( registro.codDeMedicion <> 0 ) do
            begin
                resto := ( (registro.codDeMedicion div 10) mod 2 ) ;

                if ( resto = 0 ) then
                begin
                    pares := ( pares + 1 ) ;
                end else
                begin
                    impares := ( impares + 1 ) ;
                end ;

                registro.codDeMedicion := ( registro.codDeMedicion div 10 ) ;
            end ;

            registroIncorrecto := ( pares <> impares ) ;
        end else
        begin
            registroIncorrecto := false ;
        end ;

        //codDeEstacion pares = impares
        //codDeMedicion pares <> impares
        //registroincorrecto = true
    end ;
//

// procedure eliminarNodo ( var ant : TLista ; var act : TLista ) ;
    procedure eliminarNodo ( var ant : TLista ; var act : TLista ) ;
    var
        aux : TLista ;
    
    begin
        aux      := act      ;
        act      := act^.sig ;
        ant^.sig := act      ;

        Dispose ( aux ) ;
    end ;
//

// procedure recorrerLista ( var L : TLista ; tablaNombres : TTablaNombres ) ;
    procedure recorrerLista ( var L : TLista ; tablaNombres : TTablaNombres ) ;
    var
        ant      : TLista      ;
        act      : TLista      ;
        provs    : TProvincias ;
        minimos  : TMinimos    ;
        Listas   : TListas     ;
        registro : TRegistro   ;
    
    begin
        ant := L ;
        act := L ;

        inicializarProvincias ( provs   ) ;
        inicializarMinimos    ( minimos ) ;
        inicializarListas     ( Listas  ) ;

        while ( act <> Nil ) do
        begin
            registro := act^.registro ;

            if ( registroIncorrecto(registro) ) then
            begin
                eliminarNodo ( ant , act ) ;
            end else
            begin
                actualizarProvincias ( provs  , registro ) ;
                agregarAListas       ( Listas , act      ) ;
                
                ant := act      ;
                act := act^.sig ;
            end;
        end ;

        informarProvincias ( provs , tablaNombres ) ;

        actualizarMinimos  ( minimos , provs , tablaNombres ) ;
        informarMinimos    ( minimos                        ) ;
    end ;
//

var
    L            : TLista        ;
    tablaNombres : TTablaNombres ;

    r : TRegistro ;

begin
    generarTablaNombres ( tablaNombres     ) ;
    generarLista        ( L                ) ;

    // imprimirLista       ( L                ) ;

    recorrerLista       ( L , tablaNombres ) ;
end.