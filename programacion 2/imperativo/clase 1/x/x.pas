Program x ;
Uses
     sysutils ;

Type
     TTweet = record
	     codigoUsuario : integer ;
	     nombreUsuario : string  ;
	     mensaje       : string  ;
	     esRetweet     : boolean ;
     end ;

     TListaTweets = ^TNodoListaTweets ;

     TNodoListaTweets = record
          tweet : TTweet       ;
          sig   : TListaTweets ;
     end ;

     // Creado por mi
          TListaUsuarios = ^TNodoListaUsuarios ;

          TNodoListaUsuarios = record
               nombreUsuario : string         ;
               tweets        : TListaTweets   ;
               sig           : TListaUsuarios ;
          end ;
     //

// rocedure agregarAdelante ( var L : TListaTweets ; t : TTweet ) ;
     procedure agregarAdelante ( var L : TListaTweets ; t : TTweet ) ;
     var
          aux : TListaTweets ;

     begin
          New ( aux ) ;

          aux^.tweet := t   ;
          aux^.sig   := L   ;
          L          := aux ;
     end ;
//

// procedure crearLista ( var L : TListaTweets ) ;
     procedure crearLista ( var L : TListaTweets ) ;
     var
          t     : TTweet ;
          texto : string ;
          
          v : array [1..10] of string ;

     begin
          v[ 1  ] := 'juan'      ;
          v[ 2  ] := 'pedro'     ;
          v[ 3  ] := 'carlos'    ;
          v[ 4  ] := 'julia'     ;
          v[ 5  ] := 'mariana'   ;
          v[ 6  ] := 'gonzalo'   ;
          v[ 7  ] := 'alejandro' ;
          v[ 8  ] := 'silvana'   ;
          v[ 9  ] := 'federico'  ;
          v[ 10 ] := 'ruth'      ;

          t.codigoUsuario := random( 11 ) ;

          while ( t.codigoUsuario <> 0 ) do
          Begin
               texto           := Concat( v[ t.codigoUsuario ] , '-mensaje-' , IntToStr( random(200) ) ) ;
               t.nombreUsuario := v[ t.codigoUsuario ]                                                   ;
               t.mensaje       := texto                                                                  ;
               t.esRetweet     := ( random( 2 ) = 0 )                                                    ;
               
               agregarAdelante( l , t ) ;
               
               t.codigoUsuario := random( 11 ) ;
          end ;
     end ;
//

// procedure imprimir ( t : TTweet ) ;
     procedure imprimir ( t : TTweet ) ;
     begin
          with ( t ) do
          begin
               write ( 'Tweet del usuario @' , nombreUsuario , ' con codigo ' ,codigoUsuario , ': ' , mensaje , ' RT:' ) ;
               if(esRetweet)then
               begin
                    writeln( ' Si' ) ;
               end else
               begin
                    writeln( ' No' ) ;
               end ;
          end ;
     end ;
//

// procedure imprimirLista ( L : TListaTweets ) ;
     procedure imprimirLista ( L : TListaTweets ) ;
     begin
          while ( L <> Nil ) do
          begin
               imprimir( L^.tweet ) ;
               
               L := L^.sig ;
          end ;
     end ;
//

// procedure agregarOrdenado ( var pri : TListaTweets ; t : TTweet ) ;
     procedure agregarOrdenado ( var pri : TListaTweets ; t : TTweet ) ;
     var
          nuevo    : TListaTweets ;
          anterior : TListaTweets ;
          actual   : TListaTweets ;

     begin
          New ( nuevo ) ;

          nuevo^.tweet := t   ;
          nuevo^.sig   := Nil ;

          if (pri = Nil ) then
          begin
               pri := nuevo ;
          end else
          begin
               actual   := pri ;
               anterior := pri ;

               while ( (actual <> Nil) and (actual^.tweet.nombreUsuario < nuevo^.tweet .nombreUsuario) ) do
               begin
                    anterior := actual      ;
                    actual   := actual^.sig ;
               end ;

               if ( anterior = actual ) then
               begin
                    pri := nuevo ;
               end else
               begin
                    anterior^.sig := nuevo ;
               end ;

               nuevo^.sig := actual ;
          end ;
     end ;
//

// procedure generarNuevaEstructura (LT: TListaTweets ; var LO : TListaTweets ) ;
     procedure generarNuevaEstructura ( LT : TListaTweets ; var LO : TListaTweets ) ;
     begin
          LO := Nil ;

          while( LT <> Nil ) do
          begin
               agregarOrdenado( LO , LT^.tweet ) ;

               LT := LT^.sig ;
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
                    WriteLn() ;
               end ;
          end ;
     //

     // procedure generarListaUsuarios ( var LU : TListaUsuarios ; LO : TListaTweets ) ;
          procedure generarListaUsuarios ( var LU : TListaUsuarios ; LO : TListaTweets ) ;
          var
               UAct : TListaUsuarios ;
               TAct : TListaTweets   ;
               NU   : TListaUsuarios ;
               NT   : TListaTweets   ;

          begin
               while ( LO <> Nil ) do
               begin
                    if ( (LU = Nil) or (LO^.tweet.nombreUsuario <> UAct^.nombreUsuario) ) then
                    begin
                         New ( NU ) ;

                         NU^.nombreUsuario := LO^.tweet.nombreUsuario ;
                         NU^.tweets        := Nil                     ;
                         NU^.sig           := Nil                     ;

                         if ( LU = Nil ) then
                         begin
                              LU := NU ;
                         end else
                         begin
                              UAct^.sig := NU ;
                         end ;

                         UAct := NU  ;
                         TAct := Nil ;
                    end ;

                    New ( NT ) ;

                    NT^.tweet := LO^.tweet ;
                    NT^.sig   := Nil       ;

                    if ( TAct = Nil ) then
                    begin
                         UAct^.tweets := NT ;
                    end else
                    begin
                         TAct^.sig := NT ;
                    end ;

                    TAct := NT ;

                    LO := LO^.sig ;
               end ;
          end ;
     //

     // procedure imprimirListaUsuarios ( LU : TListausuarios ) ;
          procedure imprimirListaUsuarios ( LU : TListausuarios ) ;
          begin
               while ( LU <> Nil ) do
               begin
                    WriteLn ( 'usuario: '                                       ) ;
                    WriteLn ( '    Nombre: ' , LU^.nombreUsuario                ) ;
                    WriteLn ( '    id:     ' ,  LU^.tweets^.tweet.codigoUsuario ) ;

                    separador ( 1 ) ;

                    while ( LU^.tweets <> Nil ) do
                    begin
                         if ( LU^.tweets^.tweet.esRetweet ) then
                         begin
                              WriteLn ( '    ReTweeteo: ' , LU^.tweets^.tweet.mensaje ) ;
                         end else
                         begin
                              WriteLn ( '    Tweeteo: ' , LU^.tweets^.tweet.mensaje ) ;
                         end ;

                         LU^.tweets := LU^.tweets^.sig ;
                    end ;

                    separador ( 1 ) ;

                    LU := LU^.sig ;
               end ;
          end ;
     //

//

var
     L  : TListaTweets ;
     LO : TListaTweets ;

     // credo por mi
          LU : TListaUsuarios ;
     //

begin
     Randomize ;

     L := Nil ;

     // creado por mi
          separador ( 2 ) ;
     //

     crearLista   ( l                 ) ;
     writeln      ( 'Lista generada: ') ;
     imprimirLista( l                 ) ;

     LO := Nil ;

     // creado por mi
          separador ( 2 ) ;
     //

     generarNuevaEstructura ( l , LO             ) ;
     writeln                ( 'Lista ordenada: ' ) ;
     imprimirLista          ( LO                 ) ;
     
     // creado por mi
          separador ( 1 ) ;
     //

     writeln ( 'Fin del programa' ) ;

     // creado por mi
          LU := Nil ;

          separador( 3 ) ;

          generarListaUsuarios ( LU , LO ) ;

          imprimirListaUsuarios ( LU ) ;
     //
end.