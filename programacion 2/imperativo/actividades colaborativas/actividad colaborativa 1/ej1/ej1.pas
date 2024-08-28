program ej1 ;
const
    FIN_VENTA = 'ZZZ' ;

type
    TVenta = record
        nombre    : string  ;
        distancia : real    ;
        cant      : integer ;
    end ;

    TArbol = ^nodoar ;

    nodoar = record
      venta : Tventa ;
      HijoD : TArbol ;
      HijoI : TArbol ;
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
        separador ( 1                                                          ) ;
        Write     ( '    Destino ( ingrese "ZZZ" para terminar ): ' ) ;
        ReadLn    ( venta.nombre                                      ) ;

        if ( venta.nombre <> FIN_VENTA ) then
        begin
            Write  ( '    Distancia: ' ) ;
            ReadLn ( venta.distancia     ) ;
            
            Write  ( '    Cantidad: '   ) ;
            ReadLn ( venta.cant     ) ;
        end ;
    end ;
//

// procedure GenerarArbolR(var ar : TArbol; V : TVenta ) ;
    procedure GenerarArbolR(var ar : TArbol; V : TVenta ) ;
    var 
        nue : TArbol;
    begin
        If ( (ar = nil) and (v.nombre <> FIN_VENTA) ) then
        begin
            new(nue ) ;

            nue^.venta:= V;
            nue^.HijoD:= nil;
            nue^.HijoI:= nil;

            ar := nue ;

            leerVenta( v ) ;
        end ;

        if ( v.nombre <> FIN_VENTA ) then
        begin
            if (ar^.venta.nombre > V.nombre) then
            begin
                GenerarArbolR(ar^.HijoI , v  ) ;
            end else
            begin
                GenerarArbolR(ar^.HijoD , v  ) ;
            end ;
        end ;
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

      WriteLn ( arbol^.venta.nombre ) ;
      
      for i := 1 to (espacio - 1) do
      begin
        Write ( ' ' ) ;
      end ;

      WriteLn ( '/    \' ) ;

      nivel    := ( nivel    + 1 ) ;
      nivelAnt := ( nivelAnt + 1 ) ;

      graficarArbol( arbol^.hijoI, (ESPACIO - (nivel * 4)) , nivel , nivelAnt ) ;
      graficarArbol( arbol^.hijoD, (ESPACIO + (nivel * 4)) , nivel , nivelAnt ) ;
    end ;
  end ;
//

// procedure inicializarEstructura (var ar: TArbol ) ;
    procedure inicializarEstructura (var ar: TArbol ) ;
    begin 
        ar:= nil;
    end ;
//

// function minDistNodo (ar:TArbol ; var minAct : TVenta ): TArbol;
    function minDistNodo (ar:TArbol ; var minAct : Tventa ): TArbol;
    begin
        if (ar <> nil) then 
        begin
            if ( ar^.venta.distancia < minAct.distancia ) then
            begin
              minAct := ar^.venta;
            end else
            begin
                minDistNodo(ar^.HijoI,minAct ) ;
                minDistNodo(ar^.HijoD,minAct ) ;
            end ;
        end else
        begin
            minDistNodo:= minAct;
        end ;
    end ;
//

// function BuscarDestino (ar:TArbol ; destino:string): Tventa;
    function Buscardestino (ar:TArbol ; destino:string): Tventa;
    begin
        if (ar <> nil) then 
        begin
            if (ar^.destino = destino) then
            BuscarDestino:= ar^.destino
            else begin
                if (ar^.destino > destino) 
                then buscardestino(ar^.HijoI,destino)
                else buscardestino(ar^.HijoD, destino ) ;
            end ;
        end ;
    end ;
//

//
    function nodoMinDist ( arbol : TArbol ; minDistact : Integer ) : TArbol ;
    begin
        if ( arbol <> Nil ) then
        begin
            
        end ;
    end ;
//

// procedure menu ( var arbol : TArbol ) ;
    procedure menu ( var arbol : TArbol ) ;
    var
        venta    : Tventa  ;
        nivel    : Integer ;
        nivelAnt : Integer ;
        espacio  : Integer ;
        opcion   : Integer ;
        destino  : string  ;

    begin
        repeat
            separador(2 ) ;
            WriteLn('Que desea hacer: ' ) ;
            WriteLn('    1. Inicizalizar estructuras' ) ;
            WriteLn('    2. Cargar destinos' ) ;
            WriteLn('    3. Imprimir estructura' ) ;
            WriteLn('    4. Buscar destino(mostar datos)' ) ;
            WriteLn('    5. destino mas cercano' ) ;
            WriteLn('    6. sumar pasajes'     ) ;
            separador(1 ) ;
            WriteLn('    0. Finalizar programa' ) ;
            separador(1 ) ;
            Write('Opcion: ' ) ;
            ReadLn(opcion ) ;

            if ( opcion <> 0) then
            begin          
                case opcion of 
                1: inicializarEstructura(arbol ) ;
                2: begin
                    leerVenta(venta ) ;
                    GenerarArbolR(arbol,venta ) ;
                 end ;
                3: begin
                    nivel := 0 ;
                    nivelAnt := -1 ;
                    espacio := 50 ;
                    graficarArbol(arbol, espacio, nivel, nivelAnt)
                   end ; 
                4: begin
                  Writeln('ingresar destino a buscar' ) ;
                  ReadLn(destino ) ;
                  Venta := BuscarDestino(arbol,destino ) ;
                  WriteLn('el destino ', venta.nombre, 'tiene', venta.cant , 'pasajes, y esta a', venta.distancia, 'km' ) ;
                end ;
               5: begin
                 
               end ;
                end ;
            end ;
        until ( opcion <> 0)
    end ;
//

var
    arbol : TArbol ;

begin
    arbol := Nil ;
    
    menu( arbol ) ;
end.