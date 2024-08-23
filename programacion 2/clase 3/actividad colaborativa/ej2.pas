program ej2 ;
const
    FIN_VENTA     = 0000 ;
    ESPACIO       = 30   ;
    CANT_OPCIONES = 5    ;

type
    TRangoDias     = 1..31            ;
    TRangoMes      = 1..12            ;
    TRangoAnios    = 0..2024          ;
    TRangoOpciones = 0..5 ;

    TFecha = record
        dia  : TRangoDias  ;
        mes  : TRangoMes   ;
        anio : TRangoAnios ;
    end ;

    TVenta = record
        codigoDePasta   : Integer ;
        cantidad        : Integer ;
        fecha           : TFecha  ;
        numeroDeCliente : Integer ;
    end ;

    TLista = ^TNodoLista ;

    TNodoLista = record
        venta : TVenta ;
        sig   : TLista ;
    end ;

    TArbol = ^TNodoArbol ;

    TNodoArbol = record
        codigoDePasta : Integer ;
        cantidad      : Integer ;
        hijoIzq       : TArbol  ;
        hijoDer       : TArbol  ;
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

// procedure incrementar ( var x : Integer ) ;
    procedure incrementar ( var x : Integer ) ;
    begin
        x := ( x + 1 ) ;
    end ;
//

// procedure sumar ( var a : Integer ; b : Integer ) ;
    procedure sumar ( var a : Integer ; b : Integer ) ;
    begin
        a := ( a + b ) ;
    end ;
//

// procedure leerFecha ( var fecha : TFecha ) ;
    procedure leerFecha ( var fecha : TFecha ) ;
    begin
        Write  ( '    Dia: ' ) ;
        ReadLn ( fecha.dia   ) ;

        Write  ( '    Mes: ' ) ;
        ReadLn ( fecha.mes   ) ;

        Write  ( '    Anio: ' ) ;
        ReadLn ( fecha.anio   ) ;
    end ;
//

// procedure leerVenta ( var venta : TVenta ) ;
    procedure leerVenta ( var venta : TVenta ) ;
    begin
        separador ( 1                                                          ) ;
        Write     ( '    Numero de cliente ( ingrese "0000" para terminar ): ' ) ;
        ReadLn    ( venta.numeroDeCliente                                      ) ;

        if ( venta.numeroDeCliente <> FIN_VENTA ) then
        begin
            Write  ( '    Codigo de pasta: ' ) ;
            ReadLn ( venta.codigoDePasta     ) ;
            
            Write  ( '    Cantidad: '   ) ;
            ReadLn ( venta.cantidad     ) ;
            
            leerFecha( venta.fecha ) ;
        end ;
    end ;
//

// procedure agregarALista ( var L : TLista ; var ult : TLista ; venta : TVenta ) ;
    procedure agregarALista ( var L : TLista ; var ult : TLista ; venta : TVenta ) ;
    var
        nue : TLista ;

    begin
        New( nue ) ;

        nue^.venta := venta ;
        nue^.sig   := Nil   ;

        if ( L = Nil ) then
        begin
            L := nue ;
        end else
        begin
            ult^.sig := nue ;
        end ;
        
        ult := nue ;
    end ;
//

// procedure agregarAArbol ( var arbol : TArbol ; venta : TVenta ) ;
    procedure agregarAArbol ( var arbol : TArbol ; venta : TVenta ) ;
    var
        nue : TArbol ;

    begin
        if ( arbol = Nil ) then
        begin
            New( nue ) ;

            nue^.codigoDePasta := venta.codigoDePasta ;
            nue^.cantidad      := venta.cantidad      ;
            nue^.hijoIzq       := Nil                 ;
            nue^.hijoDer       := Nil                 ;

            arbol := nue ;
        end else
        begin
            if ( venta.codigoDePasta = arbol^.codigoDePasta ) then
            begin
                sumar( arbol^.cantidad , venta.cantidad ) ;
            end
            else if ( venta.codigoDePasta < arbol^.codigoDePasta ) then
            begin
                agregarAArbol( arbol^.hijoIzq , venta ) ;
            end else
            begin
                agregarAArbol( arbol^.hijoDer , venta ) ;
            end ;
        end ;
        
    end ;
//

// procedure generarEstructuras ( var L : TLista ; var arbol : TArbol ) ;
    procedure generarEstructuras ( var L : TLista ; var arbol : TArbol ) ;
    var
        fin           : Boolean ;
        ult           : TLista  ;
        venta         : TVenta  ;
        numeroDeVenta : Integer ;

    begin
        numeroDeVenta := 1 ;

        separador ( 5                       ) ;
        WriteLn   ( 'Generar Lista Ventas:' ) ;

        repeat
            leerVenta( venta ) ;

            fin := ( venta.numeroDeCliente = FIN_VENTA ) ; 

            if ( not fin ) then
            begin
                agregarALista ( L , ult , venta ) ;
                agregarAArbol ( arbol   , venta ) ;
                incrementar   ( numeroDeVenta   ) ;
            end ;
        until ( fin ) ;
    end ;
//

// procedure imprimirFecha ( fecha : TFecha ) ;
    procedure imprimirFecha ( fecha : TFecha ) ;
    begin
        WriteLn( '    Fecha: ' , fecha.dia , '/' , fecha.mes , '/' , fecha.anio ) ;
    end ;
//

// procedure imprimirVenta ( venta : TVenta ) ;
    procedure imprimirVenta ( venta : TVenta ) ;
    begin
        separador     ( 1                                             ) ;
        WriteLn       ( 'Numero de cliente: ' , venta.numeroDeCliente ) ;
        WriteLn       ( '    Codigo de pasta: '   , venta.codigoDePasta   ) ;
        WriteLn       ( '    Cantidad: '          , venta.cantidad        ) ;
        imprimirFecha ( venta.fecha                                   ) ;
    end ;
//

// procedure imprimirLista ( L : TLista ) ;
    procedure imprimirLista ( L : TLista ) ;
    begin
        if ( L <> Nil ) then
        begin
            imprimirVenta ( L^.venta ) ;
            imprimirLista ( L^.sig   ) ;
        end ;
    end ;
//

// procedure imprimirArbol_enOrden ( arbol : TArbol ) ;
  procedure imprimirArbol_enOrden ( arbol : TArbol ) ;
  begin
    if ( arbol <> Nil ) then
    begin
      imprimirArbol_enOrden ( arbol^.hijoIzq             ) ;
      Write                 ( arbol^.codigoDePasta , '-' ) ;
      imprimirArbol_enOrden ( arbol^.hijoDer             ) ;
    end;
  end ;
//

// procedure imprimirArbol_preOrden ( arbol : TArbol ) ;
  procedure imprimirArbol_preOrden ( arbol : TArbol ) ;
  begin
    if ( arbol <> Nil ) then
    begin       
      Write                  ( arbol^.codigoDePasta , '-' ) ;
      imprimirArbol_preOrden ( arbol^.hijoIzq             ) ;
      imprimirArbol_preOrden ( arbol^.hijoDer             ) ;
    end;
  end ;
//

// procedure imprimirArbol_postOrden ( arbol : TArbol ) ;
  procedure imprimirArbol_postOrden ( arbol : TArbol ) ;
  begin
    if ( arbol <> Nil ) then
    begin
      imprimirArbol_postOrden ( arbol^.hijoIzq             ) ;
      imprimirArbol_postOrden ( arbol^.hijoDer             ) ;
      Write                   ( arbol^.codigoDePasta , '-' ) ;
    end;
  end ;
//

// procedure graficarArbol ( arbol : TArbol ; espacio : Integer ; nivel : Integer ; var nivelAnt : Integer ) ;
  procedure graficarArbol ( arbol : TArbol ; espacio : Integer ;  nivel : Integer ; var nivelAnt : Integer ) ;
  var
    i : Integer ;

  begin
    if (arbol <> Nil) then
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

      WriteLn ( arbol^.codigoDePasta , ' (' , arbol^.cantidad , ')' ) ;
      
      for i := 1 to (espacio - 1) do
      begin
        Write ( ' ' ) ;
      end ;

      WriteLn ( '/    \' ) ;

      nivel    := ( nivel    + 1 ) ;
      nivelAnt := ( nivelAnt + 1 ) ;

      graficarArbol( arbol^.hijoIzq, (ESPACIO - (nivel * 4)) , nivel , nivelAnt ) ;
      graficarArbol( arbol^.hijoDer, (ESPACIO + (nivel * 4)) , nivel , nivelAnt ) ;
    end ;
  end ;
//

// procedure menu ( var opcion : Integer ) ;
    procedure menu ( var opcion : Integer ) ;
    var
        repetir : Boolean ;

    begin
        repeat
            separador ( 2                                                     ) ;
            WriteLn   ( 'Que desea hacer: '                                   ) ;
            WriteLn   ( '    1. Reiniciar estructuras'                        ) ;
            WriteLn   ( '    2. Ingresar ventas'                              ) ;
            WriteLn   ( '    3. Imprimir estructura '                         ) ;
            WriteLn   ( '    4. Informar codigo de pasta menos vendida'       ) ;
            WriteLn   ( '    5. Informar codigos de pastas con mas de 10 kg ' ) ;
            separador ( 1                                                     ) ;
            WriteLn   ( '    0. Finalizar programa'                           ) ;
            separador ( 1                                                     ) ;
            Write     ( 'Opcion: '                                            ) ;
            ReadLn    ( opcion                                                ) ;

            repetir := ( (opcion < 0) or (5 < opcion) ) ;

            if ( repetir ) then
            begin
                separador ( 1                 ) ;
                WriteLn   ( 'Numero invalido' ) ;
            end ;

        until ( not repetir ) ;
    end ;
//

// function minimo ( arbol : TArbol ; minAct : Integer ) : Integer ;
    function minimo ( arbol : TArbol ; minAct : Integer ) : Integer ;
    begin
        if ( arbol <> Nil ) then
        begin
            if ( (arbol^.cantidad < minAct) or (minAct = -1) ) then
            begin
                minAct := arbol^.codigoDePasta ;

                minimo := minimo( arbol^.hijoIzq , minAct ) ;
            end ;
        end
        else begin
            minimo := minAct ;
        end ;
    end ; 
//

// procedure inicializarEstructuras ( var L : TLista ; var arbol : TArbol ) ;
    procedure inicializarEstructuras ( var L : TLista ; var arbol : TArbol ) ;
    begin
        L     := Nil ;
        arbol := Nil ;
    end ;
//

// function mas10 ( arbol : TArbol ; cantAct : Integer ) : Integer ;
    function mas10 ( arbol : TArbol ; cantAct : Integer ) : Integer ;
    begin
        if ( arbol <> Nil ) then
        begin
            if ( 10 < arbol^.cantidad ) then
            begin
                incrementar ( cantAct ) ;

                mas10 := mas10( arbol^.hijoIzq , cantAct ) ; 
                mas10 := mas10( arbol^.hijoDer , cantAct ) ; 
            end ;
        end else
        begin
            mas10 := cantAct ;
        end ;
    end ;
//

var
    L        : TLista  ;
    arbol    : TArbol  ;
    opcion   : Integer ;
    nivel    : Integer ;
    nivelAnt : Integer ;

begin
    inicializarEstructuras( L , arbol ) ;

    repeat
        menu ( opcion ) ;

        if ( opcion <> 0 ) then
        begin
            if ( opcion = 1 ) then
            begin
                inicializarEstructuras( L , arbol                   ) ;
                separador             ( 1                           ) ;
                WriteLn               ( 'Estructuras inicializadas' ) ;
            end
            else if ( opcion = 2 ) then
            begin
                generarEstructuras ( L , arbol ) ;
            end
            else if ( opcion = 3 ) then
            begin
                separador     ( 1        ) ;
                WriteLn       ( 'Lista:' ) ;
                imprimirLista ( L        ) ;

                separador             ( 1                  ) ;
                Write                 ( 'Arbol en orden: ' ) ;
                imprimirArbol_enOrden ( arbol              ) ;
                
                separador              ( 1                   ) ;
                Write                  ( 'Arbol pre orden: ' ) ;
                imprimirArbol_preOrden ( arbol               ) ;
                
                separador               ( 1                    ) ;
                Write                   ( 'Arbol post orden: ' ) ;
                imprimirArbol_postOrden ( arbol                ) ;

                nivel    := 0       ;
                nivelAnt := -1      ;

                separador     ( 2                        ) ;
                graficarArbol ( arbol , ESPACIO , nivel , nivelAnt ) ;
            end
            else if ( opcion = 4 ) then
            begin
                separador ( 1                                                              ) ;
                WriteLn   ( 'El codigo de pasta menos vendido es: ' , minimo( arbol , -1 ) ) ;
            end else
            begin
                separador ( 1                                                                   ) ;
                WriteLn   ( 'Los codigos de pastas con mas de 10 kg son: ' , mas10( arbol , 0 ) ) ;
            end ;
        end ;
    until ( opcion = 0 ) ;
end.