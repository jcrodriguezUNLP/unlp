program ej2 ;
const
    FIN_VENTA = 0000 ;
    ESPACIO   = 50   ;

type
    TRangoDias  = 1..31   ;
    TRangoMes   = 1..12   ;
    TRangoAnios = 0..2024 ;

    TFecha = record
        dia  : TRangoDias  ;
        mes  : TRangoMes   ;
        anio : TRangoAnios ;
    end ;

    TVenta = record
        numeroDeCliente : Integer ;
        codigoDePasta   : Integer ;
        cantidad        : Integer ;
        fecha           : TFecha  ;
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

// procedure imprimirFecha ( fecha : TFecha ) ;
    procedure imprimirFecha ( fecha : TFecha ) ;
    begin
        WriteLn( '    Fecha: ' , fecha.dia , '/' , fecha.mes , '/' , fecha.anio ) ;
    end ;
//

// procedure imprimirVenta ( venta : TVenta ) ;
    procedure imprimirVenta ( venta : TVenta ) ;
    begin
        separador     ( 1                                               ) ;
        WriteLn       ( 'Numero de cliente: '   , venta.numeroDeCliente ) ;
        WriteLn       ( '    Codigo de pasta: ' , venta.codigoDePasta   ) ;
        WriteLn       ( '    Cantidad: '        , venta.cantidad        ) ;
        imprimirFecha ( venta.fecha                                     ) ;
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
    end ;
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
    end ;
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
    end ;
  end ;
//

// procedure graficarArbol ( arbol : TArbol ; espacio : Integer ; nivel : Integer ; var nivelAnt : Integer ) ;
  procedure graficarArbol ( arbol : TArbol ; espacio : Integer ; nivel : Integer ; var nivelAnt : Integer ) ;
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

      WriteLn ( arbol^.codigoDePasta , ' (' , arbol^.cantidad , ' kg)' ) ;
      
      for i := 1 to (espacio - 1) do
      begin
        Write ( ' ' ) ;
      end ;

      WriteLn ( '/    \' ) ;

      nivel    := ( nivel    + 1 ) ;
      nivelAnt := ( nivelAnt + 1 ) ;

      graficarArbol( arbol^.hijoIzq, (ESPACIO - 5) , nivel , nivelAnt ) ;
      graficarArbol( arbol^.hijoDer, (ESPACIO + 5) , nivel , nivelAnt ) ;
    end ;
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

// procedure agregarALista ( var L : TLista ; venta : TVenta ) ;
    procedure agregarALista ( var L : TLista ; venta : TVenta ) ;
    var
        nue : TLista ;

    begin
        if ( L = Nil ) then
        begin
            New( nue ) ;

            nue^.venta := venta ;
            nue^.sig   := Nil   ;
            L          := nue   ;
        end else
        begin
            agregarALista( L^.sig , venta ) ;
        end ;
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
        fin   : Boolean ;
        venta : TVenta  ;

    begin
        separador ( 5              ) ;
        WriteLn   ( 'Leer Ventas:' ) ;

        repeat
            leerVenta( venta ) ;

            fin := ( venta.numeroDeCliente = FIN_VENTA ) ; 

            if ( not fin ) then
            begin
                agregarALista ( L     , venta ) ;
                agregarAArbol ( arbol , venta ) ;
            end ;
        until( fin ) ;
    end ;
//

// procedure minimo ( arbol : TArbol ; var min : Integer ) ;
    procedure minimo ( arbol : TArbol ; var min : Integer ) ;
    begin
        if ( arbol <> Nil ) then
        begin
            if ( (arbol^.cantidad < min) or (min = -1) ) then
            begin
                min := arbol^.codigoDePasta ;
            end ;

            minimo( arbol^.hijoIzq , min ) ;
            minimo( arbol^.hijoDer , min ) ;
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

// procedure masDe10KG ( arbol : TArbol ; var cant : Integer ) ;
    procedure masDe10KG ( arbol : TArbol ; var cant : Integer ) ;
    begin
        if ( arbol <> Nil ) then
        begin
            if ( 10 < arbol^.cantidad ) then
            begin
                incrementar( cant ) ;
            end ;

            masDe10KG( arbol^.hijoIzq , cant ) ;
            masDe10KG( arbol^.hijoDer , cant ) ; 
        end ;
    end ;
//

// procedure menu ( var opcion: Integer ; car L : TLista ; var arbol: TArbol ) ;
    procedure menu ( var opcion: Integer ; var L : TLista ; var arbol: TArbol ) ;
    var
        repetir  : Boolean ;
        nivelAnt : Integer ;
        min      : Integer ;
        cant     : Integer ;

    begin
        repeat
            separador ( 2                                                    ) ;
            WriteLn   ( 'Que desea hacer: '                                  ) ;
            WriteLn   ( '    1. Reiniciar estructuras'                       ) ;
            WriteLn   ( '    2. Ingresar ventas'                             ) ;
            WriteLn   ( '    3. Imprimir estructura'                         ) ;
            WriteLn   ( '    4. Informar codigo de pasta menos vendida'      ) ;
            WriteLn   ( '    5. Informar codigos de pastas con mas de 10 kg' ) ;
            separador ( 1                                                    ) ;
            WriteLn   ( '    0. Finalizar programa'                          ) ;
            separador ( 1                                                    ) ;
            Write     ( 'Opcion: '                                           ) ;
            ReadLn    ( opcion                                               ) ;

            repetir := ( (opcion < 0) or (opcion > 5) ) ;

            if ( repetir ) then
            begin
                separador ( 1                 ) ;
                WriteLn   ( 'Numero invalido' ) ;
            end ;
        until( not repetir ) ;

        if ( opcion <> 0 ) then
        begin
            case opcion of
            1:
                begin
                    inicializarEstructuras ( L , arbol                   ) ;
                    separador              ( 1                           ) ;
                    WriteLn                ( 'Estructuras inicializadas' ) ;
                end ;
            2:
                begin
                    generarEstructuras( L , arbol ) ;
                end ;
            3:
                begin
                    separador               ( 3                    ) ;
                    WriteLn                 ( 'Lista:'             ) ;
                    imprimirLista           ( L                    ) ;
                    separador               ( 2                    ) ;
                    WriteLn                 ( 'Arbol:'             ) ;
                    separador               ( 1                    ) ;
                    Write                   ( 'Arbol en orden: '   ) ;
                    imprimirArbol_enOrden   ( arbol                ) ;
                    separador               ( 1                    ) ;
                    Write                   ( 'Arbol pre orden: '  ) ;
                    imprimirArbol_preOrden  ( arbol                ) ;
                    separador               ( 1                    ) ;
                    Write                   ( 'Arbol post orden: ' ) ;
                    imprimirArbol_postOrden ( arbol                ) ;
                    
                    nivelAnt := -1 ;

                    separador     ( 2                              ) ;
                    graficarArbol ( arbol , ESPACIO , 0 , nivelAnt ) ;
                end ;
            4:
                begin
                    min := -1 ;

                    minimo    ( arbol , min                                   ) ;
                    separador ( 1                                             ) ;
                    WriteLn   ( 'El codigo de pasta menos vendido es: ' , min ) ;
                end ;
            5:
                begin
                    cant := 0 ;

                    masDe10KG ( arbol , cant                                          ) ;
                    separador ( 1                                                     ) ;
                    WriteLn   ( 'Los codigos de pastas con mas de 10 kg son: ' , cant ) ;
                end ;
            end ;
        end ;
    end ;
//

var
    L      : TLista  ;
    arbol  : TArbol  ;
    opcion : Integer ;

begin
    inicializarEstructuras( L , arbol ) ;

    repeat
        menu( opcion , L , arbol ) ;
    until( opcion = 0 ) ;
end.