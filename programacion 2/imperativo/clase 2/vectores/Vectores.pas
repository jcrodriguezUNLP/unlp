program vectores;
const
    DIM_F = 8 ;

type

    Tvector = array [ 1..DIM_F ] of LongInt ;

    TRangoDimL = 0..DIM_F ;

// Procedure cargarVector ( var vector : Tvector ; var DimL : TRangoDimL ) ;
    Procedure cargarVector ( var vector : Tvector ; var DimL : TRangoDimL ) ;
    var
        numero : integer ;

    begin
        DimL   := 0             ;
        numero := random( 100 ) ;

        while ( numero <> 99 )  and ( DimL < DIM_F ) do
        begin
            DimL           := ( DimL + 1 )  ;
            vector[ DimL ] := numero        ;
            numero         := random( 100 ) ;
        end ;
    end ;
//

// Procedure imprimirVector ( var vector : Tvector ; var DimL : TRangoDimL ) ;
    Procedure imprimirVector ( var vector : Tvector ; var DimL : TRangoDimL ) ;
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
            if ( vector[ i ] < 9 ) then
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

        writeln ;
        writeln ;
    End ;
//

// creado por mi
    // function maximoRecursivo ( vector : TVector ; posAct : TRangoDimL ; DimL : TRangoDimL ; maxAct : Integer ) : integer ;
        function maximoRecursivo ( vector : TVector ; posAct : TRangoDimL ; DimL : TRangoDimL ; maxAct : Integer ) : integer ;
        begin
            if ( posAct <= DimL ) then
            begin
                if ( maxAct < vector[ posAct ]) then
                begin
                    maxAct := vector[ posAct ] ;
                end ;

                posAct := ( posAct + 1 ) ;

                maximoRecursivo := maximoRecursivo( vector , posAct , DimL , maxAct ) ;
            end else
            begin
                maximoRecursivo := maxAct ;
            end ;
        end ;
    //

    // function sumaRecursiva ( vector : TVector ; posAct : TRangoDimL ; DimL : TRangoDimL ; sumaAct : real ) : real ;
        function sumaRecursiva ( vector : TVector ; posAct : TRangoDimL ; DimL : TRangoDimL ; sumaAct : real ) : real ;
        begin
            if ( posAct <= DimL ) then
            begin
                sumaAct := ( sumaAct + vector[ posAct ] ) ;
                posAct  := ( posAct  + 1                ) ;

                sumaRecursiva := sumaRecursiva( vector , posAct , DimL , sumaAct ) ;
            end else
            begin
                sumaRecursiva := sumaAct ;
            end ;
        end ;
    //
//

var
   vector  : Tvector    ;
   DimL    : TRangoDimL ;
   posAct  : TRangoDimL ;
   maxAct  : Integer    ; 
   sumaAct : Real       ;

begin
    Randomize ;

    cargarVector   ( vector , DimL        ) ;
    writeln        ( 'Nros almacenados: ' ) ;
    imprimirVector ( vector , DimL        ) ;

    // creado por mi
        posAct := 1  ;
        maxAct := -1 ;

        WriteLn ( 'El numero maximo del vector es: ' , maximoRecursivo( vector , posAct , DimL , maxAct ) ) ;
        
        posAct  := 1 ;
        sumaAct := 0 ;

        WriteLn ( 'La suma de los numeros del vector es: ' , sumaRecursiva( vector , posAct , DimL , sumaAct ):2:2 ) ;
    //
end.