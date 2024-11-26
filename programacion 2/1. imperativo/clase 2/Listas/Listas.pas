Program Listas ;
Type
  TLista = ^TNodo ;

  TNodo = Record
    numero : integer ;
    Sig    : TLista  ;
  End ;

// Procedure AgregarAdelante ( var L : TLista ; numero : integer ) ;
  Procedure AgregarAdelante ( var L : TLista ; numero : integer ) ;
  Var
    nue : TLista ;

  Begin
    New ( nue ) ;

    nue^.numero := numero ;
    nue^.sig    := L      ;
    L           := nue    ;
  End ;
//

// Procedure Imprimir ( pri : TLista ) ;
  Procedure Imprimir ( pri : TLista ) ;
  Begin
    while ( pri <> Nil ) do
    begin
      write ( pri^.numero, ' ' ) ;

      pri := pri^.sig ;
    end ;

    writeln ;
  end ;
//

// creado por mi
  // function minimo ( L : TLista ; minAct : integer ) : real ;
    function minimo ( L : TLista ; minAct : integer ) : real ;
    begin
      if ( L <> Nil ) then
      begin
        if ( L^.numero < minAct ) then
        begin
          minAct := L^.numero ;
        end ;

        minimo := minimo( L^.Sig , minAct ) ;
      end else
      begin
        minimo := minAct ;
      end ;
    end ;
  //

  // procedure imprimirRecursivo ( L : TLista ) ;
    procedure imprimirRecursivo ( L : TLista ) ;
    begin
      if ( L <> Nil ) then
      begin
        Write             ( L^.numero , ' ' ) ;
        imprimirRecursivo ( L^.sig          ) ;
      end ;
    end ;
  //
//
Var
  L      : TLista  ;
  numero : integer ;
  minAct : Integer ;

begin
  randomize ;

  L      := Nil          ;
  numero := random( 10 ) ;

  While ( numero <> 0 ) do
  Begin
    AgregarAdelante( L , numero ) ;
    
    numero := random( 10 ) ;
  end ;

  writeln  ( 'TLista generada: ' ) ;
  imprimir ( L                   ) ;

  // creado por mi
    minAct := 101 ;
    
    WriteLn           ( 'minimo: ' , minimo( L , minAct ):2:2 ) ;
    imprimirRecursivo ( L                                     ) ;
  //
end.
