program VectorOrdenado;

const
    DIM_F = 8 ;

type

    TVector = array [ 1..DIM_F ] of integer ;

    TRangoDimL = 0..DIM_F ;

// Procedure cargarVectorOrdenado ( var vector : TVector ; var DimL : TRangoDimL ) ;
    Procedure cargarVectorOrdenado ( var vector : TVector ; var DimL : TRangoDimL ) ;
    var
        numero : integer ;
        pos    : integer ;
        j      : integer ;

    begin
        DimL   := 0             ;
        numero := random( 100 ) ;

        while ( (numero <> 99)  and ( DimL < DIM_F ) ) do
        begin
            pos := 1;
        
            while ( (pos <= dimL) and (vector[ pos ] < numero) ) do
            begin
                pos := ( pos + 1 ) ;
            end ;

            for j := DimL downto pos do
            begin
                vector[ j + 1 ] := vector[ j ] ;
            end ;

            vector[ pos ] := numero        ;
            DimL       := ( DimL + 1 )  ;
            numero     := random( 100 ) ;
        end ;
    end ;
//

// Procedure imprimirVector ( var vector : TVector ; var DimL : TRangoDimL ) ;
    Procedure imprimirVector ( var vector : TVector ; var DimL : TRangoDimL ) ;
    var
        i : TRangoDimL ;

    begin
        for i := 1 to DimL do
        begin
            write ( '-----' ) ;
        end ;

        writeln (     ) ;
        write   ( ' ' ) ;

        for i := 1 to DimL do
        begin
            if ( vector[ i ] < 9 )then
            begin
                write ( '0' ) ;
            end ;

            write ( vector[ i ] , ' | ' ) ;
        end ;

        writeln ;

        for i := 1 to DimL do
        begin
            write ( '-----' ) ;
        end ;

        writeln;
        writeln;
    End ;
//

// function busquedaDicotomica ( vector : TVector ; DimL : TRangoDimL ; numero : Integer ) : TRangoDimL ;
    function busquedaDicotomica ( vector : TVector ; DimL : TRangoDimL ; numero : Integer ) : TRangoDimL ;
    var
        inicio   : TRangoDimL     ;
        medio    : TRangoDimL     ; 
        fin      : TRangoDimL     ;
        encontre : Boolean        ; 

    begin
        inicio := 1    ;
        fin    := dimL ;

        encontre := False ;

        while ( (inicio <= fin) and (not encontre) ) do
        begin
            medio := ( (inicio + fin) div 2 ) ;

            encontre := ( vector[ medio ] = numero ) ;

            if ( not encontre ) then
            begin
                if ( vector[ medio ] < numero ) then
                begin
                    inicio := ( medio + 1 ) ;
                end else
                begin
                    fin := ( medio - 1 ) ;
                end ;
            end ;
        end ;

        if ( encontre ) then
        begin
            busquedaDicotomica := medio ;
        end else
        begin
            busquedaDicotomica := 0 ;
        end ;
    end ;
//

// function busquedaDicotomicaRecursiva ( vector : TVector ; inicio : integer ; fin : integer ; dimL : TRangoDimL ; numero : Integer ) : TRangoDimL ;
    function busquedaDicotomicaRecursiva ( vector : TVector ; inicio : integer ; fin : integer ; dimL : TRangoDimL ; numero : Integer ) : TRangoDimL ;
    var
        medio : TRangoDimL ; 

    begin
        if ( inicio <= fin ) then
        begin
            medio := ( (inicio + fin) div 2 ) ;

            if ( vector[ medio ] = numero ) then
            begin
                busquedaDicotomicaRecursiva := medio ;
            end else
            begin
                if ( vector[ medio ] < numero ) then
                begin
                    inicio := ( medio + 1 ) ;
                end else
                begin
                    fin := ( medio - 1 ) ;
                end ;

                busquedaDicotomicaRecursiva := busquedaDicotomicaRecursiva( vector , inicio, fin , dimL , numero) ;
            end ;
        end else
        begin
            busquedaDicotomicaRecursiva := 0 ;
        end ;
    end ;
//

var
   vector : TVector    ;
   DimL   : TRangoDimL ;
   numero : Integer    ;
   inicio : TRangoDimL ;
   fin    : TRangoDimL ;

begin
    Randomize ;

    cargarVectorOrdenado ( vector , DimL        ) ;
    writeln              ( 'Nros almacenados: ' ) ;
    imprimirVector       ( vector , DimL        ) ;

    WriteLn ( 'ingrese el numero a buscar: ' ) ;
    ReadLn  ( numero                         ) ;

    inicio := 1    ;
    fin    := DimL ;

    WriteLn ( 'pos: ' , busquedaDicotomicaRecursiva( vector , inicio , fin , dimL , numero ) ) ;
end.