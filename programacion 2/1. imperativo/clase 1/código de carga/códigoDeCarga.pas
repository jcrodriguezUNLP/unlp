Program productos ;
Uses
     sysutils ;

Type
     TProducto = record
          codigo : integer    ;
          nombre : string     ;
          marca  : string     ;
          anio   : 2000..2022 ;
          precio : real       ;
     end ;

     TListaProductos = ^TNodoListaProductos ;

     TNodoListaProductos = record
          producto : TProducto       ;
          sig      : TListaProductos ;
     end ;

     // creado por mi
          TListaMarcas = ^TNodoListaMarcas ;

          TNodoListaMarcas = record
               marca     : string          ;
               productos : TListaProductos ;
               sig       : TListaMarcas    ;
          end ;
     //

// Procedure agregarAdelante ( var LP : TListaProductos ; p : TProducto ) ;
     Procedure agregarAdelante ( var LP : TListaProductos ; p : TProducto ) ;
     var
          aux : TListaProductos ;

     begin
          new ( aux ) ;

          aux^.producto := p  ;
          aux^.sig      := LP ;

          LP := aux ;
     end ;
//

// procedure crearLista ( var LP : TListaProductos ) ;
     procedure crearLista ( var LP : TListaProductos ) ;
     var
          i : integer   ;
          j : integer   ;
          p : TProducto ;
     
          v : array [1..10] of string ;

     begin
          v[ 1  ] := 'Abercom'      ;
          v[ 2  ] := 'Aluminium'    ;
          v[ 3  ] := 'ClearWindows' ;
          v[ 4  ] := 'IndArg'       ;
          v[ 5  ] := 'La Foret'     ;
          v[ 6  ] := 'Open'         ;
          v[ 7  ] := 'Portal'       ;
          v[ 8  ] := 'Puertamania'  ;
          v[ 9  ] := 'PVCPremium'   ;
          v[ 10 ] := 'Ventalum'     ;

          for i := random( 10 ) downto 1 do {for de marca}
          begin
               p.marca := v[ i ] ;

               for j := random( 5 ) downto 1 do {for de anio}
               begin
                    p.anio   := ( 2016 + j ) ;
                    p.codigo := random( 10 ) ;

                    while ( p.codigo <> 0 ) do
                    Begin
                         p.nombre := Concat( 'Producto-' , IntToStr( random(200) ) ) ;
                         p.precio := random( 1000000                               ) ;
                         
                         agregarAdelante( LP , p ) ;
                         
                         p.codigo := random( 10 ) ;
                    end ;
               end ;
          end ;
     end ;
//

// procedure imprimir ( p : TProducto ) ;
     procedure imprimir ( p : TProducto ) ;
     begin
          with ( p ) do
          begin
               writeln( 'Producto', nombre, ' con codigo ',codigo, ': ', marca, ' Anio:', anio, ' Precio: ', precio:2:2 ) ;
          end ;
     end ;
//

// procedure imprimirLista ( LP : TListaProductos ) ;
     procedure imprimirLista ( LP : TListaProductos ) ;
     begin
          while ( LP <> NIL ) do
          begin
               imprimir( LP^.producto ) ;

               LP := LP^.sig ;
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

     // procedure generarListaMarcas ( var LM : TListaMarcas ; LP : TListaProductos ) ;
          procedure generarListaMarcas ( var LM : TListaMarcas ; LP : TListaProductos ) ;
          var
               MAct : TListaMarcas    ;
               PAct : TListaProductos ;
               NM   : TListaMarcas    ;
               NP   : TListaProductos ;
          
          begin
               while ( LP <> Nil ) do
               begin
                    if ( (LM = Nil) or (LP^.producto.marca <> MAct^.marca) ) then
                    begin
                         New ( NM ) ;

                         NM^.marca     := LP^.producto.marca ;
                         NM^.productos := Nil                ;
                         NM^.sig       := Nil                ;
                    
                         if ( LM = Nil ) then
                         begin
                              LM := NM ;
                         end else
                         begin
                              MAct^.sig := NM ;
                         end ;
                         
                         MAct := NM  ;
                         PAct := Nil ;
                    end ;

                    New ( NP ) ;

                    NP^.producto := LP^.producto ;
                    NP^.sig      := Nil          ;

                    if ( PAct = Nil ) then
                    begin
                         MAct^.productos := NP ;
                    end else
                    begin
                         PAct^.sig := NP ;
                    end ;

                    PAct := NP ;

                    LP := LP^.sig ;
               end ;
          end ;
     //

     // procedure informarAbercom ( LM : TListaMarcas ) ;
          procedure informarAbercom ( LM : TListaMarcas ) ;
          var
               cant      : Integer         ;
               productos : TListaProductos ;

          begin
               cant := 0 ;

               while ( (LM <> Nil) and (LM^.marca <> 'Abercom') ) do
               begin
                    LM := LM^.sig ;
               end ;
               
               if ( (LM <> Nil) and (LM^.productos <> Nil) ) then
               begin
                    productos := LM^.productos ;

                    while ( productos <> Nil) do
                    begin
                         if (2020 <= productos^.producto.anio) and (100000 < productos^.producto.precio) then
                         begin
                              cant := cant + 1;
                         end ;
                         productos := productos^.sig;
                    end ;
               end ;

               separador ( 2                                                           ) ;
               writeln   ( 'la cantidad de produtos de abercom q cumplen son: ' , cant ) ;
          end ;
     //

     // procedure informarMarcas ( LM : TListaMarcas ) ;
          procedure informarMarcas ( LM : TListaMarcas ) ;
          var
               TPM : integer    ;
               TPA : integer    ;
               MA  : string     ;
               AA  : 2000..2022 ;

          begin
               separador ( 2 ) ;

               while ( LM <> Nil ) do
               begin
                    TPM := 0         ;
                    MA  := LM^.marca ;

                    separador ( 1              ) ;
                    writeln   ( 'Marca: ' , MA ) ;
                    
                    while ( LM^.productos <> Nil ) do
                    begin
                         TPA := 0                            ;
                         AA  := LM^.productos^.producto.anio ;
                         
                         writeln   ( '    Anio: ' , AA ) ;

                         repeat
                              TPA := ( TPA + 1 ) ;

                              writeln ( '    ' , LM^.productos^.producto.codigo , ' ' , LM^.productos^.producto.nombre , ' ' , LM^.productos^.producto.precio:2:2 ) ;

                              LM^.productos := LM^.productos^.sig ;

                         until ( (LM^.productos = Nil) or (LM^.productos^.producto.anio <> AA) ) ;

                         TPM := ( TPM + TPA ) ;

                         writeln   ( '    .......'                                 ) ;
                         writeln   ( '    total productos anio ' , AA , ': ' , TPA ) ;
                         separador ( 1                                             ) ;
                    end ;
                    
                    writeln ( 'total productos marca ' , MA , ': ' , TPM ) ;

                    LM := LM^.sig ;
               end ;
          end ; 
     //

//

var
     LP : TListaProductos ;

     // creado por mi
          LM : TListaMarcas ;
     //

begin
     Randomize ;

     LP := NIL ;

     crearLista    ( LP                 ) ;
     writeln       ( 'Lista generada: ' ) ;
     imprimirLista ( LP                 ) ;

     // creado por mi
          LM := Nil ;

          generarListaMarcas ( LM , LP ) ;
          informarAbercom    ( LM      ) ;
          informarMarcas     ( LM      ) ;

          separador ( 1 ) ;
     //
end.