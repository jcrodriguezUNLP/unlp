program insertarOrdenado ;
const
    dimF = 4 ;
type
    TDato = Integer ;

    TVector = array [ 1..dimF ] of TDato ;

    TLista = ^nodo ;

    nodo = record
        dato : TDato  ;
        sig  : TLista ;
    end ;

// procedure insertarOrdenadoLista ( var L : TLista ; dato : TDato ) ;
    procedure insertarOrdenadoLista ( var L : TLista ; dato : TDato ) ;
    var
        ant   : TLista ;
        act   : TLista ;
        nuevo : TLista ;

    begin
        ant := L ;
        act := L ;

        New ( nuevo ) ;

        nuevo^.dato := dato ;

        while ( (act <> Nil) and (act^.dato < dato) ) do
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

// procedure insertarOrdenadoVector ( var V : TVector ; dimF : Integer ; var dimL : Integer ; dato : TDato ) ;
    procedure insertarOrdenadoVector ( var V : TVector ; dimF : Integer ; var dimL : Integer ; dato : TDato ) ;
    var
        i   : Integer ;
        fin : Boolean ;
    
    begin
        if ( dimL < dimF ) then
        begin
            i := ( dimL + 1 ) ;

            repeat
                fin := ( not ((1 < i) and ( dato < V[ (i - 1 ) ])) ) ;
                
                if ( not fin ) then
                begin
                    V[ i ] := V[ (i - 1) ] ;

                    i := ( i - 1 ) ;
                end ;
            until ( fin ) ;

            V[ i ] := dato ;

            dimL := ( dimL + 1 ) ;
        end ;
    end ;
//

// procedure imprimirVector ( V : TVector ; dimL : Integer ) ;
    procedure imprimirVector ( V : TVector ; dimL : Integer ) ;
    var
        i : Integer ;

    begin
        for i := 1 to dimL do
        begin
            Write ( ' ' , V[ i ] ) ;
        end ;
    end ;
//

var
    V    : TVector ;
    dimL : Integer ;
    dato : TDato   ;

begin
    V[ 1 ] := 2 ;
    V[ 2 ] := 3 ;

    dimL := 0 ;

    dato := 1 ;

    insertarOrdenadoVector ( V , dimF , dimL , dato ) ;

    imprimirVector ( V , dimL ) ;
end.