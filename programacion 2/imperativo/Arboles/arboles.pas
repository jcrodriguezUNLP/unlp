Program arboles ;
const
  ESPACIO = 50 ;
  
Type
  TArbol = ^TNodo ;

  TNodo = Record
    numero  : Integer ;
    hijoIzq : TArbol  ;
    hijoDer : TArbol  ;
  End ;


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
    end;
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
    end;
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
    end;
  end ;
//

// procedure generarArbol ( var arbol : TArbol ) ;
  procedure generarArbol ( var arbol : TArbol ) ;
  var
    numero : Integer ;

  begin
    repeat
      numero := random( 10 ) ;

      if ( numero <> 0 ) then
      begin
        insertar( arbol , numero ) ;
      end ;
    until( numero = 0 ) ;
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
      else if ( inf < arbol^.numero ) then
      begin
        imprimirAcotado ( arbol^.hijoIzq , inf , sup ) ;
      end else
      begin
        imprimirAcotado ( arbol^.hijoDer , inf , sup ) ;
      end;
    end ;
  end ;
//

// function nodoMin ( arbol : TArbol ) : TArbol ;
  function nodoMin ( arbol : TArbol ) : TArbol ;
  begin
    if ( arbol^.hijoDer = Nil ) then
    begin
      nodoMin := arbol ;
    end
    else
    begin
      nodoMin := nodoMin( arbol^.hijoDer ) ;
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

Var
  arbol    : TArbol  ;

  // graficar
    nivelAnt : Integer ;
  //

  // buscar
    aBuscar  : Integer ;
    nodo     : TArbol  ;
  //

  // min max
    minAct   : Integer ;
    maxAct   : Integer ;
  //

  // imprimir acotado
    inf : Integer ;
    sup : Integer ;
  //

  // borrar
    aBorrar : Integer ;
  //

begin
  randomize ;

  generarArbol( arbol ) ;

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
    nivelAnt := -1 ;

    separador     ( 1                                    ) ;
    WriteLn       ( 'Representacion grafica del arbol: ' ) ;
    separador     ( 1                                    ) ;
    graficarArbol ( arbol , ESPACIO , 0 , nivelAnt       ) ;
  //

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
    separador ( 1                                                        ) ;
    WriteLn   ( 'El numero minimo del arbol es: ' , valorMinimo( arbol ) ) ;
    separador ( 1                                                        ) ;
    WriteLn   ( 'El numero maximo del arbol es: ' , valorMaximo( arbol ) ) ;
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
end.