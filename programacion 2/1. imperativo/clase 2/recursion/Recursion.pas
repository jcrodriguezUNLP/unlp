program Recursion ;
// function maximo ( numero : Integer ; maxAct : Integer ) : Integer ;
  function maximo ( numero : Integer ; maxAct : Integer ) : Integer ;
  var
    digito : Integer ;

  begin
    if ( numero <> 0 ) then
    begin
      digito := ( numero mod 10 ) ;
      numero := ( numero div 10 ) ;

      if ( maxAct < digito ) then
      begin
        maxAct := digito ;
      end ;
      
      maximo := maximo( numero , maxAct ) ;
    end else
    begin
      maximo := maxAct ; 
    end ;
  end ;
//

var 
  numero : Integer ;
  maxAct : integer ;

Begin
  maxAct := -1 ;

  write   ( 'Ingrese un entero no negativo: '                                           ) ;
  readln  ( numero                                                                      ) ;
  writeln ( 'El digito maximo del numero ', numero , ' es: ', maximo( numero , maxAct ) ) ;
End.