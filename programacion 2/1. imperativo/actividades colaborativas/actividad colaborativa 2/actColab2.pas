program actColab2 ;
const
    ESPACIO = 50 ;
type
    TCadena50 = string[ 50 ] ;

    TLista = ^TNodoLista ;

    TNodoLista = record
        paciente : LongInt ;
        sig      : TLista  ;
    end ;

    TCiudad = record
        nombre    : TCadena50 ;
        codPostal : Integer   ;
    end ;

    TArbol = ^TNodoArbol ;

    TNodoArbol = record
        ciudad         : TCiudad ;
        cantInfectados : Integer ;
        ListaPacientes : TLista  ;
        hijoIzq        : TArbol  ;
        hijoDer        : TArbol  ;
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

// procedure incrementar ( var a : Integer ) ;
    procedure incrementar ( var a : Integer ) ;
    begin
        a := ( a + 1 ) ;
    end ;
//

// procedure sumar ( var a : Integer ; b : Integer ) ;
    procedure sumar ( var a : Integer ; b : Integer ) ;
    begin
        a := ( a + b ) ;
    end ;
//

// procedure liberarMemoriaLista ( var L : TLista ) ;
    procedure liberarMemoriaLista ( var L : TLista ) ;
    begin
        if ( L <> Nil ) then
        begin
            liberarMemoriaLista( L^.sig ) ;

            Dispose( L ) ;

            L := Nil ;
        end ;
    end ;
//

// procedure liberarMemoria ( var arbol : TArbol ) ;
    procedure liberarMemoria ( var arbol : TArbol ) ;
    begin
        if ( arbol <> Nil ) then
        begin
            if ( arbol^.hijoIzq <> Nil ) then
            begin
                liberarMemoria ( arbol^.hijoIzq ) ;
            end
            else if ( arbol^.hijoDer <> Nil ) then
            begin
                liberarMemoria ( arbol^.hijoIzq ) ;
            end ;

            liberarMemoriaLista( arbol^.ListaPacientes ) ;

            dispose( arbol ) ;

            arbol := Nil ;
        end ;
    end ;
//

// procedure inicializarArbol ( var arbol : TArbol ) ;
    procedure inicializarArbol ( var arbol : TArbol ) ;
    begin
        liberarMemoria( arbol ) ;
    end ;
//

// procedure agregarALista ( var L : TLista ; paciente : LongInt ) ;
    procedure agregarALista ( var L : TLista ; paciente : LongInt ) ;
    var
        nue : TLista ;

    begin
        if ( L = Nil ) then
        begin
            New( nue ) ;

            nue^.paciente := paciente ;
            nue^.sig      := Nil      ;

            L := nue ;
        end else
        begin
            agregarALista( L^.sig , paciente ) ;
        end ;
    end ;
//

// procedure insertar ( var arbol : TArbol ; ciudad : TCiudad ; paciente : LongInt ) ;
    procedure insertar ( var arbol : TArbol ; ciudad : TCiudad ; paciente : LongInt ) ;
    var
        nue : TArbol ;

    begin
        if ( arbol <> Nil ) then
        begin
            if ( ciudad.codPostal = arbol^.ciudad.codPostal ) then
            begin
                incrementar   ( arbol^.cantInfectados            ) ;
                agregarALista ( arbol^.ListaPacientes , paciente ) ;
            end
            else if ( ciudad.codPostal < arbol^.ciudad.codPostal ) then
            begin
                insertar( arbol^.hijoIzq , ciudad , paciente ) ;
            end else
            begin
                insertar( arbol^.hijoDer , ciudad , paciente ) ;
            end ;
        end else
        begin
            New( nue ) ;

            nue^.ciudad         := ciudad ;
            nue^.cantInfectados := 1      ;
            nue^.ListaPacientes := Nil    ;
            nue^.hijoIzq        := Nil    ;
            nue^.hijoDer        := Nil    ;
            
            arbol := nue ;

            agregarALista( arbol^.ListaPacientes , paciente ) ;
        end ;
    end ;
//

// procedure generarArbol ( var arbol : TArbol ) ;
    procedure generarArbol ( var arbol : TArbol ) ;
    var
        ciudad   : TCiudad ;
        paciente : LongInt ;

    begin
        repeat
            separador ( 1                               ) ;
            Write     ( 'Ingrese el DNI del paciente: ' ) ;
            ReadLn    ( paciente                        ) ;

            if ( paciente <> 0 ) then
            begin
                Write  ( 'Nombre de la ciudad: ' ) ;
                ReadLn ( ciudad.nombre           ) ;

                Write  ( 'Codigo Postal: ' ) ;
                ReadLn ( ciudad.codPostal  ) ;

                insertar( arbol , ciudad , paciente ) ;
            end ;
        until( paciente = 0 ) ;
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

      WriteLn ( arbol^.ciudad.codPostal , ' (' , arbol^.cantInfectados , ')' ) ;
      
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

// procedure informarAcotado ( arbol : TArbol ; inf : Integer ; sup : Integer ) ;
    procedure informarAcotado ( arbol : TArbol ; inf : Integer ; sup : Integer ) ;
    begin
        if ( arbol <> Nil ) then
        begin
            if ( (inf <= arbol^.ciudad.codPostal) and (arbol^.ciudad.codPostal <= sup) ) then
            begin
                separador ( 1                                                ) ;
                WriteLn   ( 'La ciudad '           , arbol^.ciudad.nombre    ) ;
                WriteLn   ( '    Codigo Postal:  ' , arbol^.ciudad.codPostal ) ;
                WriteLn   ( '    Infectados: '     , arbol^.cantInfectados   ) ;

                informarAcotado( arbol^.hijoIzq , inf , sup ) ;
                informarAcotado( arbol^.hijoDer , inf , sup ) ;
            end
            else if ( arbol^.ciudad.codPostal < inf ) then
            begin
                informarAcotado( arbol^.hijoDer , inf , sup ) ;
            end else
            begin
                informarAcotado( arbol^.hijoIzq , inf , sup ) ;
            end ;
        end ;
    end ;
//

// procedure menu ( var opcion : Integer ; var arbol : TArbol ) ;
    procedure menu ( var opcion : Integer ; var arbol : TArbol ) ;
    var
        nivelAnt : Integer ;
        inf      : Integer ;
        sup      : Integer ;
        repetir  : Boolean ;

    begin
        separador ( 3                              ) ;
        WriteLn   ( 'Menu: '                       ) ;
        WriteLn   ( '    1. Reiniciar estructuras' ) ;
        WriteLn   ( '    2. Ingresar paciente'     ) ;
        WriteLn   ( '    3. Imprimir arbol'        ) ;
        WriteLn   ( '    4. Cantidad Infectados'   ) ;
        separador ( 1                              ) ;
        WriteLn   ( '    0. Finalizar programa'    ) ;


        repeat
            separador ( 1          ) ;
            Write     ( 'Opcion: ' ) ;
            ReadLn    ( opcion     ) ;
            
            repetir := ( (opcion < 0) or (4 < opcion) ) ;

            if ( repetir ) then
            begin
                separador ( 1                 ) ;
                WriteLn   ( 'Numero invalido' ) ;
            end ;
        until( not repetir ) ;

        separador( 3 ) ;

        case opcion of
            0:
                begin
                    WriteLn( 'Programa Finalizado' ) ;
                end ;
            1:
                begin
                    WriteLn          ( 'Arbol inicializado' ) ;
                    inicializarArbol ( arbol                ) ;
                end ;
            2:
                begin
                    generarArbol( arbol ) ;
                end ;
            3:
                begin
                    if ( arbol <> Nil ) then
                    begin
                        nivelAnt := -1 ;

                        graficarArbol( arbol ,ESPACIO , 0 , nivelAnt ) ;
                    end else
                    begin
                        WriteLn( 'Arbol esta vacio' ) ;
                    end ;
                end ;
            4:
                begin
                    if ( arbol <> Nil ) then
                    begin
                        inf := 1800 ;
                        sup := 1900 ;

                        informarAcotado( arbol , inf , sup ) ;
                    end else
                    begin
                        WriteLn( 'Arbol vacio' ) ;
                    end ;
                end ;
        end ;
    end ;
//

var
    arbol  : TArbol  ;
    opcion : Integer ;

begin
    inicializarArbol( arbol ) ;

    repeat
        menu( opcion , arbol ) ;
    until( opcion = 0 ) ;
end.