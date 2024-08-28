program CalculoDeFactorial ;
// function factorial ( x : integer ) : Real ;
  function factorial ( x : integer ) : Real ;
  begin
    if ( x = 1 ) then
    begin
      factorial := 1 ;
    end else
    begin
      factorial := ( x * factorial( x - 1 ) ) ;
    end ;
  end ;
//

var 
  x : integer ;

Begin
  write     ( 'Ingrese un numero entero no negativo: ' ) ;
  readln    ( x                                        ) ;
  writeln   ( x , '! = ' , factorial( x ):2:2          ) ;
  factorial ( x                                        ) ;
End.