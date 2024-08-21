program LetterDice ;
const
    NumDJugadores     = 2  ;
    LargoMaxPalabra   = 15 ;

type
    TCodDJugador = 1..NumDJugadores ;
    
    TContenido = array [ 1..LargoMaxPalabra ] of char ;
    
    TPalabra = record
        contenido : TContenido         ;
        longitud  : 1..LargoMaxPalabra ;
    end ;
    
    TJugada = record
        numDJugada   : integer      ;
        codDJugador  : TCodDJugador ;
        palabra      : TPalabra     ;
    end ;

    TTablaPuntajes = array [ 'A'..'Z' ] of integer ;
    
    TLista = ^nodo ;
    
    nodo = record
        jugada : TJugada ;
        sig    : TLista  ;
    end ;
    
    TPuntajes = array [ 1..NumDJugadores ] of integer ;
    
    TMax = record
        codDJugador : TCodDJugador ;
        puntaje     : integer      ;
    end ;
    
// procedure generarTablaPuntajes ( var tablaPuntajes : TTablaPuntajes ) ;
    procedure generarTablaPuntajes ( var tablaPuntajes : TTablaPuntajes ) ;
    var
        i : char    ;
        j : integer ;
    
    begin
        j := 1 ;
        
        for i := 'A' to 'Z' do
        begin
            tablaPuntajes [ i ] := j         ;
            j                   := ( j + 1 ) ;
        end;
    end ;
//

// procedure leerPalabra ( var palabra : TPalabra ) ;
    procedure leerPalabra ( var palabra : TPalabra ) ;
    var
        i : integer ;

    begin
        write  ( '        Ingrese la longitud de la palabra: ') ;
        readln ( palabra.longitud ) ;

        for i := 1 to palabra.longitud do
        begin
            write ( '            Letra MAYUSCULA N°' , i , ' de ' , palabra.longitud , ': ') ;
            readln ( palabra.contenido [ i ] ) ;
        end;
        writeln () ;
    end;
//

// procedure agregarAListaJugadas ( var L : TLista ; nuevaJugada : TJugada ) ;
    procedure agregarAListaJugadas ( var L : TLista ; nuevaJugada : TJugada ) ;
    var
        ant       : TLista ;
        act       : TLista ;
        nuevoNodo : TLista ;
    
    begin
        new ( nuevoNodo ) ;
        
        nuevoNodo^.jugada := nuevaJugada ;
        nuevoNodo^.sig    := Nil         ;
        
        if ( L <> Nil ) then
        begin
            ant := L      ;
            act := L^.sig ;
            
            while ( act <> Nil ) do
            begin
                ant := act      ;
                act := act^.sig ;
            end ;
            
            ant^.sig := nuevoNodo ;
        end else
        begin
            L := nuevoNodo ;
        end;
    end ;
//

// procedure generarListaJugadas ( var L : TLista ) ;
    procedure generarListaJugadas ( var L : TLista ) ;
    var
        nuevaJugada : TJugada ;
        fin         : boolean ;
        i           : integer ;
    
    begin
        L   := Nil   ;
        
        repeat
            write  ( 'Ingrese el numero de la jugada: ') ;
            readln ( nuevaJugada.numDJugada ) ;
            
            fin := ( nuevaJugada.numDJugada = 0 ) ;
            
            if ( not fin ) then
            begin
                for i := 1 to NumDJugadores do
                begin
                    nuevaJugada.codDJugador := i ;
                    
                    writeln     ( '    Ingrese la palabra del jugador ' , i , ':') ;
                    leerPalabra ( nuevaJugada.palabra                            ) ;
                    
                    agregarAListaJugadas ( L , nuevaJugada ) ;
                end;
            end ;
        until ( fin ) ;
    end ;
//

// procedure inicializarPuntajes ( var puntajes : TPuntajes ) ;
    procedure inicializarPuntajes ( var puntajes : TPuntajes ) ;
    var
        i : integer ;
    
    begin
        for i := 1 to NumDJugadores do
        begin
            puntajes [ i ] := 0 ;
        end ;
    end ;
//

// procedure eliminarNodo ( var ant : TLista ; var act : TLista ) ;
    procedure eliminarNodo ( var ant : TLista ; var act : TLista ) ;
    var
        nodoAEliminar : TLista ;

    begin
        nodoAEliminar := act      ;
        act           := act^.sig ;
        ant^.sig      := act      ;

        Dispose ( nodoAEliminar ) ;
    end ;
//

// procedure sumarPuntaje ( jugada : TJugada ; var puntajes : TPuntajes ; tablaPuntajes : TTablaPuntajes ) ;
    procedure sumarPuntaje ( jugada : TJugada ; var puntajes : TPuntajes ; tablaPuntajes : TTablaPuntajes ) ;
    var
        i : integer ;
    
    begin
        for i := 1 to jugada.palabra.longitud do
        begin
            puntajes [ jugada.codDJugador ] := ( puntajes [ jugada.codDJugador ] + tablaPuntajes [ jugada.palabra.contenido [ i ] ] ) ; 
        end ;
    end ;
//

// function cumplePalabra ( jugada : TJugada ) : Boolean ;
    function cumplePalabra ( jugada : TJugada ) : Boolean ;
    var
        cumple : Boolean ;

    begin
        repeat
            cumple := ( (jugada.numDJugada mod 10) = jugada.codDJugador ) ;

            if ( not cumple ) then
            begin
                jugada.numDJugada := ( jugada.numDJugada div 10 ) ;
            end ;
        until ( (jugada.numDJugada = 0) or cumple ) ;

        cumplePalabra := cumple ;
    end ;
//

// procedure imprimirPalabra ( palabra : TPalabra ) ;
    procedure imprimirPalabra ( palabra : TPalabra ) ;
    var
        i : integer ;
    
    begin
        for i := 1 to palabra.longitud do
        begin
            write ( palabra.contenido [ i ] ) ;
        end ;
    end ;
//

// procedure recorrerListaJugadas ( L : TLista ; var puntajes : TPuntajes ; tablaPuntajes : TTablaPuntajes ) ;
    procedure recorrerListaJugadas ( L : TLista ; var puntajes : TPuntajes ; tablaPuntajes : TTablaPuntajes ) ;
    var
        ant : TLista ;
        act : TLista ;

    begin
        if ( L <> Nil ) then
        begin
            ant := L ; 
            act := L ;

            inicializarPuntajes ( puntajes ) ;

            while ( act <> Nil ) do
            begin
                while ( act^.jugada.codDJugador = 3 ) do
                begin
                    eliminarNodo ( ant , act ) ;
                end ;

                sumarPuntaje ( act^.jugada , puntajes , tablaPuntajes ) ;

                if ( cumplePalabra ( act^.jugada ) ) then
                begin
                    writeln () ;
                    
                    write ( 'La palabra: "' ) ;
                    imprimirPalabra ( act^.jugada.palabra ) ;
                    writeln ( '" de la jugada N°' , act^.jugada.numDJugada , ' del jugador N°' , act^.jugada.codDJugador , ' cumple la condicion')
                end ;
                
                ant := act      ;
                act := act^.sig ;
            end ;
        end ;
    end ;
//

// procedure maximos( puntajes : TPuntajes ) ;
    procedure maximos( puntajes : TPuntajes ) ;
    var
        i    : integer ;
        max1 : TMax    ;
        max2 : TMax    ;
    
    begin
        max1.puntaje     := 0    ;
        
        for i := 1 to NumDJugadores do
        begin
            if ( max1.puntaje < puntajes [ i ] ) then
            begin
                max2 := max1 ;
                
                max1.codDJugador := i              ;
                max1.puntaje     := puntajes [ i ] ;
            end else
            begin
                if ( max2.puntaje < puntajes [ i ] ) then
                begin
                    max2.codDJugador := i              ;
                    max2.puntaje     := puntajes [ i ] ;
                end;
            end ;
        end ;
        
        writeln () ;
        
        writeln ( 'Posicion N°1:' ) ;
        writeln ( '    Jugador N°' , max1.codDJugador , ' con puntaje: ' , max1.puntaje ) ;
        
        writeln () ;
        
        writeln ( 'Posicion N°2:' ) ;
        writeln ( '    Jugador N°' , max2.codDJugador , ' con puntaje: ' , max2.puntaje ) ;
    end ; 
//

var
    tablaPuntajes : TTablaPuntajes ;
    puntajes      : TPuntajes      ;
    L             : TLista         ;

begin
    writeln () ;
    
    generarTablaPuntajes ( tablaPuntajes                ) ;
    generarListaJugadas  ( L                            ) ;
    recorrerListaJugadas ( L , puntajes , tablaPuntajes ) ;
    
    if ( L <> Nil ) then
    begin
        maximos ( puntajes ) ;
    end ;
end.