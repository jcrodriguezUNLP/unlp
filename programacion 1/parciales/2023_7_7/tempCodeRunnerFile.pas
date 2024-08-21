if ( registroIncorrecto(registro) ) then
            begin
                eliminarNodo ( ant , act ) ;
            end else
            begin
                actualizarProvincias ( provs  , registro ) ;
                agregarAListas       ( Listas , act      ) ;
                
                ant := act      ;
                act := act^.sig ;
            end;