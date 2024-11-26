program ej1 ;
const
    FIN_VENTA = 'ZZZ' ;
    ESPACIO   = 50    ;

type
    TVenta = record
        nombre    : string  ;
        distancia : real    ;
        cantidad  : integer ;
    end ;

    TArbol = ^TNodoArbol ;

    TNodoArbol = record
      venta   : Tventa ;
      HijoIzq : TArbol ;
      HijoDer : TArbol ;
    end ;

// procedure separador ( n : Integer ) ;
    procedure separador ( n : Integer ) ;
    var
        i : Integer ;

    begin
        for i := 1 to n do
        begin
            WriteLn ;
        end ;
    end ;
//

// procedure leerVenta ( var venta : TVenta ) ;
    procedure leerVenta ( var venta : TVenta ) ;
    begin
        separador ( 1 ) ;
        
        with venta do
        begin
            Write  ( '    Destino ( ingrese "ZZZ" para terminar ) : ' ) ;
            ReadLn ( nombre                                          ) ;

            if ( nombre <> FIN_VENTA ) then
            begin
                Write  ( '    Distancia: ' ) ;
                ReadLn ( distancia         ) ;
                
                Write  ( '    Cantidad: '   ) ;
                ReadLn ( cantidad           ) ;
            end ;
        end ;
    end ;
//

// procedure GenerarArbol ( var arbol : TArbol ; venta : TVenta ) ;
    procedure GenerarArbol ( var arbol : TArbol ; venta : TVenta ) ;
    var 
        nue : TArbol ;

    begin
        if ( (arbol = Nil) and (venta.nombre <> FIN_VENTA) ) then
        begin
            New( nue ) ;

            nue^.venta   := venta ;
            nue^.HijoDer := Nil   ;
            nue^.HijoIzq := Nil   ;

            arbol := nue ;

            leerVenta( venta ) ;
        end ;

        if ( venta.nombre <> FIN_VENTA ) then
        begin
            if ( arbol^.venta.nombre > Venta.nombre ) then
            begin
                GenerarArbol( arbol^.HijoIzq , venta ) ;
            end else
            begin
                GenerarArbol( arbol^.HijoDer , venta ) ;
            end ;
        end ;
    end ;
//

// procedure graficarArbol ( arbol : TArbol ; espacio : Integer ; nivel : Integer ; var nivelAnt : Integer ) ;
  procedure graficarArbol ( arbol : TArbol ; espacio : Integer ;  nivel : Integer ; var nivelAnt : Integer ) ;
  var
    i : Integer ;

  begin
    if ( arbol <> Nil ) then
    begin
      if ( nivel <= nivelAnt ) then
      begin
        separador( 2 ) ;

        for i := 1 to (espacio - 1) do
        begin
          Write ( '-' ) ;
        end ;
        
        Write( ' ^' ) ;

        separador( 1 ) ;
        for i := 1 to espacio do
        begin
          Write ( ' ' ) ;
        end ;

        Write ( '|' ) ;

        separador( 2 ) ;

        nivelAnt := ( nivel - 1 ) ;
      end ;

      Write ( 'Nivel: ' , nivel ) ;

      for i := 1 to (espacio - 8) do
      begin
        Write ( ' ' ) ;
      end ;

      WriteLn ( arbol^.venta.nombre ) ;
      
      for i := 1 to (espacio - 1) do
      begin
        Write ( ' ' ) ;
      end ;

      WriteLn ( '/    \' ) ;

      nivel    := ( nivel    + 1 ) ;
      nivelAnt := ( nivelAnt + 1 ) ;

      graficarArbol( arbol^.hijoIzq , (ESPACIO - (nivel * 4)) , nivel , nivelAnt ) ;
      graficarArbol( arbol^.hijoDer , (ESPACIO + (nivel * 4)) , nivel , nivelAnt ) ;
    end ;
  end ;
//

// procedure inicializarEstructura ( var arbol : TArbol ) ;
    procedure inicializarEstructura ( var arbol : TArbol ) ;
    begin 
        arbol := Nil ;
    end ;
//

// function BuscarDestino ( arbol : TArbol ; destino : string ) : TArbol ;
    function Buscardestino ( arbol : TArbol ; destino : string ) : TArbol ;
    begin
        if ( arbol <> Nil ) then 
        begin
            if ( arbol^.venta.nombre = destino ) then
            begin
                BuscarDestino := arbol ;
            end
            else if ( destino < arbol^.venta.nombre ) then
            Begin
                Buscardestino := buscardestino( arbol^.HijoIzq , destino ) ;
            end else
            begin
                Buscardestino := buscardestino( arbol^.HijoDer , destino ) ;
            end ;
        end else
        begin
            Buscardestino := Nil ;
        end ;
    end ;
//

// function minDistNodo ( arbol : TArbol ; minDistAct : TArbol ) : TArbol ;
    function minDistNodo ( arbol : TArbol ; minDistAct : TArbol ) : TArbol ;
    begin
        if ( arbol <> Nil ) then
        begin
            if ( (minDistAct = Nil) or (arbol^.venta.distancia < minDistAct^.venta.distancia) ) then
            begin
                minDistAct := arbol ;
            end ;
            
            minDistAct := minDistNodo( arbol^.HijoIzq , minDistAct ) ; 
            minDistAct := minDistNodo( arbol^.HijoDer , minDistAct ) ;
        end ;

        minDistNodo := minDistAct ;
    end ;
//

// procedure menu ( var opcion : Integer ; var arbol : TArbol ) ;
    procedure menu ( var opcion : Integer ; var arbol : TArbol ) ;
    var
        venta           : TVenta  ;
        destino         : TArbol  ;
        minDist         : TArbol  ;
        nivelAnt        : Integer ;
        destinoABuscar  : string  ;

    begin
        separador ( 2                                     ) ;
        WriteLn   ( 'Que desea hacer: '                   ) ;
        WriteLn   ( '    1. Inicizalizar estructuras'     ) ;
        WriteLn   ( '    2. Cargar destinos'              ) ;
        WriteLn   ( '    3. Imprimir estructura'          ) ;
        WriteLn   ( '    4. Buscar destino(mostar datos)' ) ;
        WriteLn   ( '    5. destino mas cercano'          ) ;
        separador ( 1                                     ) ;
        WriteLn   ( '    0. Finalizar programa'           ) ;
        separador ( 1                                     ) ;
        Write     ( 'Opcion: '                            ) ;
        ReadLn    ( opcion                                ) ;

        if ( opcion <> 0) then
        begin          
            case opcion of
                1:
                    begin
                        inicializarEstructura( arbol ) ;
                    end ;
                2:
                    begin
                        leerVenta    ( venta       ) ;
                        GenerarArbol ( arbol,venta ) ;
                    end ;
                3:
                    begin
                        nivelAnt := -1 ;
                        
                        graficarArbol( arbol , ESPACIO , 0 , nivelAnt ) ;
                    end ; 
                4:
                    begin
                        separador ( 1                             ) ;
                        Write     ( 'ingresar destino a buscar: ' ) ;
                        ReadLn    ( destinoABuscar                ) ;

                        destino := BuscarDestino( arbol , destinoABuscar ) ;
                        
                        separador ( 1 ) ;

                        if ( destino = Nil ) then
                        begin
                            WriteLn ( 'Destino no encontrado' ) ;
                        end else
                        begin
                            WriteLn ( 'Datos del destino: ' ) ;

                            with (destino^.venta) do
                            begin
                                WriteLn( '    nombre: '    , nombre        ) ;
                                WriteLn( '    distancia: ' , distancia:2:2 ) ;
                                WriteLn( '    cantidad: '  , cantidad      ) ;
                            end ;
                        end ;
                    end ;
                5:
                begin
                    separador( 1 ) ;
                    
                    minDist := minDistNodo( arbol , Nil ) ;

                    if ( minDist = Nil ) then
                    begin
                        WriteLn ( 'lista vacia' ) ;
                    end else
                    begin
                        WriteLn ( 'El destino con menor distancia es: ' ) ;

                        with (minDist^.venta) do
                        begin
                            WriteLn( '    nombre: '    , nombre        ) ;
                            WriteLn( '    distancia: ' , distancia:2:2 ) ;
                            WriteLn( '    cantidad: '  , cantidad      ) ;
                        end ;
                    end ;
                end ;
            end ;
        end ;
    end ;
//

var
    arbol  : TArbol  ;
    opcion : Integer ;

begin
    arbol := Nil ;
    
    repeat
        menu( opcion , arbol ) ;
    until( opcion = 0 ) ;
end.