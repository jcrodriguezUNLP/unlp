Program encomiendas ;
Type

  TEncomienda = record
    codigo : integer ;
    peso   : integer ;
  end ;

  // Lista de TEncomienda
  TListaEncomiendas = ^TNodoListaEncomiendas ;

  TNodoListaEncomiendas = record
    encomienda : TEncomienda       ;
    sig        : TListaEncomiendas ;
  end ;

  TListaCodigos = ^TNodoListaCodigos ;

  TNodoListaCodigos = record
    codigo : Integer       ;
    sig    : TListaCodigos ;
  end ;

  TArbol = ^TNodoArbol ;

  TNodoArbol = record
    peso    : Integer       ;
    codigos : TListaCodigos ;
    hijoIzq : TArbol        ;
    hijoDer : TArbol        ;
  end ;

// procedure agregarAdelante ( var LE : TListaEncomiendas ; encomienda : TEncomienda ) ;
  procedure agregarAdelante ( var LE : TListaEncomiendas ; encomienda : TEncomienda ) ;
  var
    aux : TListaEncomiendas ;

  begin
    new( aux ) ;

    aux^.encomienda := encomienda ;
    aux^.sig        := LE         ;

    LE := aux ;
  end ;
//

// procedure crearLista ( var LE : TListaEncomiendas ) ;
  procedure crearLista ( var LE : TListaEncomiendas ) ;
  var
    encomienda : TEncomienda ;
    i          : integer     ;

  begin
    LE := Nil ;

    for i := 1 to 20 do
    begin
      encomienda.codigo := i            ;
      encomienda.peso   := random( 10 ) ;

      while ( encomienda.peso = 0 ) do
      begin
        encomienda.peso := random( 10 ) ;
      end ;

      agregarAdelante( LE , encomienda ) ;
    End ;
  end ;
//

// procedure imprimirLista ( LE : TListaEncomiendas ) ;
  procedure imprimirLista ( LE : TListaEncomiendas ) ;
  begin
    While ( LE <> Nil ) do
    begin
      writeln( 'Codigo: ' , LE^.encomienda.codigo , '  Peso: ' , LE^.encomienda.peso ) ;

      LE := LE^.sig ;
    End ;
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

  // procedure agregarALista( var LC : TListaCodigos ; codigo : Integer ) ;
    procedure agregarALista( var LC : TListaCodigos ; codigo : Integer ) ;
    var
      nue : TListaCodigos ;
    
    begin
      if ( LC = Nil ) then
      begin
        New( nue ) ;

        nue^.codigo := codigo ;
        nue^.sig    := Nil    ;

        LC := nue ;
      end else
      begin
        agregarALista( LC^.sig , codigo ) ;
      end ;
    end ;
  //

  // procedure insertar ( var arbol : TArbol ; encomienda : TEncomienda ) ;
    procedure insertar ( var arbol : TArbol ; encomienda : TEncomienda ) ;
    var
      nue : TArbol ;

    begin
      if ( arbol = Nil ) then
      begin
        New( nue ) ;

        nue^.peso    := encomienda.peso ;
        nue^.codigos := Nil             ;

        agregarALista( nue^.codigos , encomienda.codigo ) ;
        
        nue^.hijoIzq := Nil ;
        nue^.hijoDer := Nil ;

        arbol := nue ;
      end else
      begin
        if ( encomienda.peso = arbol^.peso ) then
        begin
          agregarALista( arbol^.codigos , encomienda.codigo ) ;
        end
        else if ( encomienda.peso < arbol^.peso ) then
        begin
          insertar( arbol^.hijoIzq , encomienda ) ;
        end else
        begin
          insertar( arbol^.hijoDer , encomienda ) ;
        end ;
      end ;
    end ;
  //

  // procedure generarArbol ( var arbol : TArbol ; LE : TListaEncomiendas ) ;
    procedure generarArbol ( var arbol : TArbol ; LE : TListaEncomiendas ) ;
    begin
      if ( LE <> Nil ) then
      begin
        insertar     ( arbol , LE^.encomienda ) ;
        generarArbol ( arbol , LE^.sig        ) ;
      end ;
    end ;
  //

  // procedure imprimirListaCodigos ( LC : TListaCodigos ) ;
    procedure imprimirListaCodigos ( LC : TListaCodigos ) ;
    begin
      if ( LC <> Nil ) then
      begin
        Write                ( LC^.codigo , ' - ' ) ;
        imprimirListaCodigos ( LC^.sig            ) ;
      end ;
    end ;
  //

  // procedure imprimirHoja ( arbol : TArbol ) ;
    procedure imprimirHoja ( arbol : TArbol ) ;
    begin
      separador            ( 1                      ) ;
      WriteLn              ( 'Peso: ' , arbol^.peso ) ;
      Write                ( '    codigos: '        ) ;
      imprimirListaCodigos ( arbol^.codigos         ) ;
      separador            ( 1                      ) ;
    end ;
  //

  // procedure imprimirArbol ( arbol : TArbol ) ;
    procedure imprimirArbol ( arbol : TArbol ) ;
    begin
      if ( arbol <> Nil ) then
      begin
        imprimirArbol ( arbol^.hijoIzq ) ;
        imprimirHoja  ( arbol          ) ;
        imprimirArbol ( arbol^.hijoDer ) ;
      end ;
    end ;
  //
//

Var
  LE : TListaEncomiendas ;

  arbol : TArbol ;

begin
  Randomize ;

  arbol := Nil ;

  crearLista    ( LE                                ) ;
  writeln       ( 'Lista de TEncomienda generada: ' ) ;
  imprimirLista ( LE                                ) ;

  generarArbol  ( arbol , LE ) ;
  imprimirArbol ( arbol      ) ;
end.