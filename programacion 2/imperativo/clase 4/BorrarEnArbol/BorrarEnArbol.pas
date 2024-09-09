Program BorrarEnArbol ;
Type
  TLista = ^TNodoLista ;

  TNodoLista = record
    numero : integer ;
    sig    : TLista  ;
  end ;

  TArbol = ^TNodoArbol ;

  TNodoArbol = Record
    numero  : integer;
    hijoIzq : TArbol ;
    hijoDer : TArbol ;
  End ;

  TListaNivel = ^TNodoListaNivel ;

  TNodoListaNivel = record
    arbol : TArbol   ;
    sig   : TListaNivel ;
  end ;

// procedure agregarAdelante ( var L : TLista ; numero : integer ) ;
  procedure agregarAdelante ( var L : TLista ; numero : integer ) ;
  var
    aux: TLista ;

  begin
    new( aux ) ;

    aux^.numero := numero ;
    aux ^ .sig  := L      ;
    L           := aux    ;
  end ;
//

// procedure crearLista ( var L : TLista ) ;
  procedure crearLista ( var L : TLista ) ;
  var
    numero : integer ;

  begin
    L      := Nil          ;
    numero := random( 20 ) ;

    While ( numero <> 0 ) do
    Begin
      agregarAdelante( L , numero ) ;
      
      numero := random( 20 ) ;
    End ;
  end ;
//

// procedure imprimirLista ( L : TLista ) ;
  procedure imprimirLista ( L : TLista ) ;
  begin
    While ( L <> Nil ) do
    begin
      write( L^.numero , ' - ' ) ;

      L := L^.sig ;
    End ;
  end ;
//

// function ContarElementos ( LN : TListaNivel ) : integer ;
  function ContarElementos ( LN : TListaNivel ) : integer ;
  var
    cant : integer ;

  begin
    cant := 0 ;
    
    While ( LN <> Nil ) do
    begin
      cant    := ( cant + 1 ) ;
      LN := LN^.sig ;
    End ;

    contarElementos := cant ;
  end ;
//


// Procedure AgregarAtras ( var LN : TListaNivel ; var ult : TListaNivel ; arbol : TArbol ) ;
  Procedure AgregarAtras ( var LN : TListaNivel ; var ult : TListaNivel ; arbol : TArbol ) ;
  var
    nue : TListaNivel ;

  begin
    New( nue ) ;

    nue^.arbol := arbol ;
    nue^.sig   := Nil   ;

    if ( LN = Nil ) then
    begin
      LN := nue ;
    end else
    begin
      ult^.sig := nue ;
    end ;

    ult := nue ;
  end ;
//

// Procedure imprimirpornivel ( arbol : TArbol ) ;
  Procedure imprimirpornivel ( arbol : TArbol ) ;
  var
    LN : TListaNivel ;
    aux     : TListaNivel ;
    ult     : TListaNivel ;
    nivel   : integer  ;
    cant    : integer  ;
    i       : integer  ;

  begin
    LN := Nil ;

    if ( arbol <> Nil ) then
    begin
      nivel := -1 ;

      agregarAtras ( LN , ult , arbol ) ;

      while ( LN <> Nil ) do
      begin
        nivel := ( nivel + 1 )              ;
        cant  := contarElementos( LN ) ;

        write ( 'Nivel ' , nivel , ': ' ) ;

        for i := 1 to cant do
        begin
          write ( LN^.arbol^.numero , ' - ' ) ;

          if ( LN^.arbol^.hijoIzq <> Nil) then
          begin
            agregarAtras( LN , ult , LN^.arbol^.hijoIzq ) ;
          end ;

          if ( LN^.arbol^.hijoDer <> Nil) then
          begin
            agregarAtras ( LN , ult , LN^.arbol^.hijoDer ) ;
          end ;

          aux     := LN      ;
          LN := LN^.sig ;

          Dispose( aux ) ;
        end ;

        WriteLn ;
      end ;
    end ;
  end ;
//

// creado por mi
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

  // procedure insertar ( var arbol : TArbol ; numero : Integer ) ;
    procedure insertar ( var arbol : TArbol ; numero : Integer ) ;
    var
      nue : TArbol ;

    begin
      if ( arbol = Nil ) then
      begin
        New ( nue ) ;

        nue^.numero  := numero ;
        nue^.hijoIzq := Nil    ;
        nue^.hijoDer := Nil    ;

        arbol := nue ;
      end else
      begin
        if ( numero < arbol^.numero ) then
        begin
          insertar( arbol^.hijoIzq , numero ) ;
        end else
        begin
          insertar( arbol^.hijoDer , numero ) ;
        end ;
      end ;
    end ;
  //

  // procedure imprimirArbol_enOrden ( arbol : TArbol ) ;
    procedure imprimirArbol_enOrden ( arbol : TArbol ) ;
    begin
      if ( arbol <> Nil ) then
      begin
        imprimirArbol_enOrden ( arbol^.hijoIzq      ) ;
        Write                 ( arbol^.numero , ' ' ) ;
        imprimirArbol_enOrden ( arbol^.hijoDer      ) ;
      end ;
    end ;
  //

  // procedure imprimirArbol_preOrden ( arbol : TArbol ) ;
    procedure imprimirArbol_preOrden ( arbol : TArbol ) ;
    begin
      if ( arbol <> Nil ) then
      begin
        Write                  ( arbol^.numero , ' ' ) ;
        imprimirArbol_preOrden ( arbol^.hijoIzq      ) ;
        imprimirArbol_preOrden ( arbol^.hijoDer      ) ;
      end ;
    end ;
  //

  // procedure imprimirArbol_postOrden ( arbol : TArbol ) ;
    procedure imprimirArbol_postOrden ( arbol : TArbol ) ;
    begin
      if ( arbol <> Nil ) then
      begin
        imprimirArbol_postOrden ( arbol^.hijoIzq      ) ;
        imprimirArbol_postOrden ( arbol^.hijoDer      ) ;
        Write                   ( arbol^.numero , ' ' ) ;
      end ;
    end ;
  //

  // procedure generarArbol ( var arbol : TArbol ; L : TLista ) ;
    procedure generarArbol ( var arbol : TArbol ; L : TLista ) ;
    begin
      if ( L <> Nil ) then
      begin
        insertar     ( arbol , L^.numero ) ;
        generarArbol ( arbol , L^.sig    ) ;
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

        WriteLn ( arbol^.numero ) ;
        
        for i := 1 to (espacio - 1) do
        begin
          Write ( ' ' ) ;
        end ;

        WriteLn ( '/ \' ) ;

        nivel    := ( nivel    + 1 ) ;
        nivelAnt := ( nivelAnt + 1 ) ;

        graficarArbol( arbol^.hijoIzq, (espacio - 2) , nivel , nivelAnt ) ;
        graficarArbol( arbol^.hijoDer, (espacio + 2) , nivel , nivelAnt ) ;
      end ;
    end ;
  //

  // function buscarNodo ( arbol : TArbol ; numero : Integer ) : TArbol ;
    function buscarNodo ( arbol : TArbol ; numero : Integer )  : TArbol ;
    begin
      if ( arbol <> Nil ) then
      begin
        if ( numero = arbol^.numero ) then
        begin
          buscarNodo := arbol ;
        end
        else if ( numero < arbol^.numero) then
        begin
          buscarNodo := buscarNodo( arbol^.hijoIzq , numero ) ;
        end else
        begin
          buscarNodo := buscarNodo( arbol^.hijoDer , numero ) ;
        end ;
      end else
      begin
        buscarNodo := Nil ;
      end ;
    end ;
  //

  // function valorMinimo ( arbol : TArbol ) : Integer ;
    function valorMinimo ( arbol : TArbol ) : Integer ;
    begin
      if ( arbol <> Nil ) then
      begin
        if ( arbol^.hijoIzq <> Nil ) then
        begin
          valorMinimo := valorMinimo( arbol^.hijoIzq ) ;
        end else
        begin
          valorMinimo := arbol^.numero ;
        end ;
      end ;
    end ; 
  //

  // function valorMaximo ( arbol : TArbol ) : Integer ;
    function valorMaximo ( arbol : TArbol ) : Integer ;
    begin
      if ( arbol <> Nil ) then
      begin
        if ( arbol^.hijoDer <> Nil ) then
        begin
          valorMaximo := valorMaximo( arbol^.hijoDer ) ;
        end else
        begin
          valorMaximo := arbol^.numero ;
        end ;
      end ;
    end ; 
  //

  // procedure imprimirAcotado ( arbol : TArbol ; inf : Integer ; sup : Integer ) ;
    procedure imprimirAcotado ( arbol : TArbol ; inf : Integer ; sup : Integer ) ;
    begin
      if ( arbol <> Nil ) then
      begin
        if ( (inf <= arbol^.numero) and (arbol^.numero <= sup) ) then
        begin
          Write           ( arbol^.numero , ' - '        ) ;
          imprimirAcotado ( arbol^.hijoIzq , inf , sup   ) ;
          imprimirAcotado ( arbol^.hijoDer , inf , sup   ) ;
        end
        else if ( sup < arbol^.numero ) then
        begin
          imprimirAcotado ( arbol^.hijoIzq , inf , sup ) ;
        end else
        begin
          imprimirAcotado ( arbol^.hijoDer , inf , sup ) ;
        end ;
      end ;
    end ;
  //

  // function nodoMax ( arbol : TArbol ) : TArbol ;
    function nodoMax ( arbol : TArbol ) : TArbol ;
    begin
      if ( arbol^.hijoDer = Nil ) then
      begin
        nodoMax := arbol ;
      end
      else
      begin
        nodoMax := nodoMax( arbol^.hijoDer ) ;
      end ;
    end ;
  //

  //  procedure eliminar ( var arbol : TArbol ; numero : Integer ) ;
    procedure eliminar ( var arbol : TArbol ; numero : Integer ) ;
    var
      aux : TArbol ;

    begin
      if ( arbol <> Nil ) then
      begin
        if ( numero = arbol^.numero ) then
        begin
          aux := arbol ;

          if ( arbol^.hijoIzq = Nil ) then
          begin
            arbol := arbol^.hijoDer ;
          end
          else if ( arbol^.hijoDer = Nil ) then
          begin
            arbol := arbol^.hijoIzq ;
          end
          else
          begin
            nodoMax( arbol^.hijoIzq )^.hijoDer := arbol^.hijoDer ;
            arbol                              := arbol^.hijoIzq ;
          end ;

          Dispose( aux ) ;
        end
        else if ( numero < arbol^.numero ) then
        begin
          eliminar( arbol^.hijoIzq , numero ) ;
        end
        else
        begin
          eliminar( arbol^.hijoDer , numero ) ;
        end ;
      end ;
    end ;
  //
//

Var
  L : TLista ;

  // creado por mi
    arbol : TArbol ;

    // graficar (BOLUDES MIA)
      espacio  : Integer ;
      nivel    : Integer ;
      nivelAnt : Integer ;
    //

    // buscar
      aBuscar  : Integer ;
      nodo     : TArbol  ;
    //

    //
      inf : Integer ;
      sup : Integer ;
    //

    //
      aBorrar : Integer ;
    //
  //


begin
  Randomize ;

  crearLista    ( L                   ) ;
  writeln       ( 'TLista generada: ' ) ;
  imprimirLista ( L                   ) ;

  // creado por mi
    separador   ( 2                 ) ;
    WriteLn     ( 'creado por mi: ' ) ;
    generarArbol( arbol , L         ) ;

    // imprimir en los distintos ordenes
      separador               ( 1             ) ;
      WriteLn                 ( 'En orden:'   ) ;
      imprimirArbol_enOrden   ( arbol         ) ;
      separador               ( 1             ) ;
      WriteLn                 ( 'Pre orden:'  ) ;
      imprimirArbol_preOrden  ( arbol         ) ;
      separador               ( 1             ) ;
      WriteLn                 ( 'Post orden:' ) ;
      imprimirArbol_PostOrden ( arbol         ) ;
    //

    // graficar (BOLUDES MIA)
      espacio  := 30 ;
      nivel    := 0  ;
      nivelAnt := -1 ;

      separador     ( 1                                    ) ;
      WriteLn       ( 'Representacion grafica del arbol: ' ) ;
      separador     ( 1                                    ) ;
      graficarArbol ( arbol , espacio , nivel , nivelAnt   ) ;
    //

    // imprimirpornivel ( arbol ) ;


    // buscar
      separador     ( 1                                          ) ;
      Write         ( 'Ingrese el numero a buscar en el arbol: ' ) ;
      ReadLn        ( aBuscar                                    ) ;

      nodo := buscarNodo( arbol , ABuscar ) ;

      separador( 1 ) ;

      if ( nodo = Nil ) then
      begin
        WriteLn ( 'El numero ' , aBuscar , ' no esta en la lista' ) ;
      end else
      begin
        WriteLn ( 'El numero ' , aBuscar , ' si esta en la lista' ) ;
      end ;
    //

    // min max
      separador ( 1                                                       ) ;
      WriteLn   ( 'El valor minimo del arbol es: ' , valorMinimo( arbol ) ) ;
      separador ( 1                                                       ) ;
      WriteLn   ( 'El valor maximo del arbol es: ' , valorMaximo( arbol ) ) ;
    //

    // imprimir acotado
      separador       ( 1                                  ) ;
      WriteLn         ( 'Imprimir acotado:'                ) ;
      Write           ( '    Minimo: '                     ) ;
      ReadLn          ( inf                                ) ;
      Write           ( '    Maximo: '                     ) ;
      ReadLn          ( sup                                ) ;
      separador       ( 1                                  ) ;
      WriteLn         ( 'Entre ' , inf , ' y ' , sup , ':' ) ;
      imprimirAcotado ( arbol , inf , sup                  ) ;
    //

    // borrar
      repeat
        separador     ( 1                                          ) ;
        Write         ( 'Ingrese el numero a borrar en el arbol: ' ) ;
        ReadLn        ( aBorrar                                    ) ;

        eliminar( arbol , aBorrar ) ;

        nivelAnt := -1 ;

        separador     ( 1                                    ) ;
        WriteLn       ( 'Representacion grafica del arbol: ' ) ;
        separador     ( 1                                    ) ;
        graficarArbol ( arbol , ESPACIO , 0 , nivelAnt       ) ;
      until ( aBorrar = 0 ) ;
    //
  //
end.