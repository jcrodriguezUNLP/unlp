program CalculoDePotencia ;
// function potencia ( base : Integer ; exponente : Integer ) : Real ;
   function potencia ( base : Integer ; exponente : Integer ) : Real ;
   begin
      if ( exponente = 0 ) then
      begin
         potencia := 1 ;
      end else
      begin
         potencia := ( base * potencia( base , (exponente - 1) ) ) ;
      end ;
   end ;
//

var
   base      : Integer ;
   exponente : Integer ;

begin
     write   ( 'Ingrese la base: '              ) ;
     Readln  ( base                             ) ;
     write   ( 'Ingrese el exponenteonente: '   ) ;
     Readln  ( exponente                        ) ;
     WriteLn ( potencia( base , exponente ):2:2 ) ;
end.
