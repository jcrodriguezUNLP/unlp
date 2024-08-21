PROGRAM ej4Franco ;
TYPE
  cadena = string[50] ;

  calles      = 1..122 ;
  meses       = 1..12  ;
  calles11a20 = 11..20 ;

  registro = RECORD
      calle     : calles  ;
      numero    : integer ;
      piso      : cadena  ;
      depto     : cadena  ;
      mes       : meses   ;
      dia       : integer ;
      anio      : integer ;
      entregado : boolean ;
   END ;

   lista = ^nodo;

   nodo = RECORD
      dato : registro ;
      sig  : lista    ;
   END ;

// procedure inicializarVcalle ( var v : array of integer ) ;
   procedure inicializarVcalle ( var v : array of integer ) ;
   var 
      i : integer ;

   BEGIN
      for i := 1 to 122 DO
      begin
         v[ i ] := 0 ;
      end ;
   END ;
//

// procedure inicializarVmes ( var v : array of integer ) ;
   procedure inicializarVmes ( var v : array of integer ) ;
   var
      i : integer ;

   BEGIN
      for i := 1 to 12 DO
      begin
         v[ i ] := 0 ;
      end ;
   END ;
//

// PROCEDURE InformarCalles( v : array of integer ) ;
   PROCEDURE InformarCalles( v : array of integer ) ;
   var
      i : integer ;

   BEGIN
      for i := 1 to 122 DO
      BEGIN
         writeln ( 'La calle ' , i , ' tuvo ' , v[ i ] , ' envios' ) ;
      end ;
   END ;
//

// PROCEDURE InformarCalles( v : array of integer ) ;
   PROCEDURE InformarCalles( v : array of integer ) ;
   var
      i         : integer                                                                                                                               ;
      iMax      : meses                                                                                                                                 ;
      enviosMax : integer                                                                                                                               ;
      nomMeses  : array [ 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre' ] ;
   
   BEGIN
      enviosMax := -1 ;
      iMax      := 0  ;

      for i := 1 to 12 DO
      BEGIN
         if ( v[ i ] > enviosMax ) then
         begin
            enviosMax := v[ i ] ;
            iMax      := i      ;
         end ;
      END ;

      writeln ( 'El mes con más envios fue ' , nomMeses[ i ] , ' con ' , v[ i ] ) ;
   END;
//

// procedure eliminarNodo ( var L : TLista ; var ant : TLista ; var act : TLista ) ;
   procedure eliminarNodo ( var L : TLista ; var ant : TLista ; var act : TLista ) ;
   var
      aux : TLista ;

   begin
      if ( ant = act ) then
      begin
         aux := L ;

         L := L^.sig ;

         ant := L ;
         act := L ;
      end else
      begin
         aux := act ;

         act      := act^.sig ;
         ant^.sig := act      ;
      end ;

      Dispose ( aux ) ;
   end ;
//

// PROCEDURE incializarLisCalles11a20 ( l : array of lista ) ;
   PROCEDURE incializarLisCalles11a20 ( l : array of lista ) ;
   var
      i : integer ;

   BEGIN
      for i := 11 to 20 DO
      begin
         l[ i ] := nil ;
      end ;
   END ;
//

// procedure liberarmemoria( var l : lista ) ;
   procedure liberarmemoria( var l : lista ) ;
   var
      aux : lista ;

   begin
      while( l <> nil ) do begin
         aux := l ;

         l := l^.sig ;

         dispose(aux);
      end ;
   end ;
//

// procedure liberarVectorC( var VC : enviosPorCalle ) ;
   procedure liberarVectorC( var VC : enviosPorCalle ) ;
   var
      i : integer ;
   
   begin
      for i:= 1 to 122 do
      begin
         liberarmemoria ( VC[ i ] ) ;
      end ;
   end;
//

// procedure liberarVectorM( var VM : enviosPorMes ) ;
   procedure liberarVectorM( var VM : enviosPorMes ) ;
   var
      i : integer ;
   
   begin
      for i:= 1 to 12 do
      begin
         liberarmemoria ( VM [ i] ) ;
      end ;
   end ;
//

// Procedure  agregarListaCalle ( var pri : lista ; dato : registro ) ;
   Procedure  agregarListaCalle ( var pri : lista ; dato : registro ) ;
   var 
      ant : lista ;
      nue : lista ;
      act : lista ;

   begin
      new (nue);

      nue^.dato := dato ;

      act := pri ;
      ant := pri ;

      while ( (act<>NIL) and (act^.dato.numero < dato.numero) ) do
      begin
         ant := act      ;
         act := act^.sig ;
      end ;
      
      if (ant = act) then
      begin
         pri := nue ;
      end else
      begin
         ant^.sig := nue;
      end ;

      nue^.sig := act ;
   end ;
//

PROCEDURE RecorrerLista ( pri : lista ; var enviosPorCalle : array of integer ; var enviosPorMes : array of integer ) ;
VAR
   l              : lista                            ;
   enviosPorCalle : array [ calles      ] of integer ;
   enviosPorMes   : array [ meses       ] of integer ;
   lisCalle       : array [ calles11a20 ] of lista   ;

BEGIN
   incializarLisCalles11a20 ( lisCalle ) ;

   l := pri ;

   while ( l <> NIL ) do
   begin
      enviosPorCalle[ l^.dato.calle ] := ( enviosPorCalle[ l^.dato.calle ] + 1 ) ;
      enviosPorMes  [ l^.dato.mes   ] := ( enviosPorMes  [ l^.dato.mes   ] + 1 ) ;

      if ( l^.dato.entregado = FALSE) eliminarNodo( l , pri );
      if ( l^.dato.calle = 11..20)
         agregarListaCalle(lisCalle[l^.dato.calle], l^.dato)           //leer en la teoria
      l := l^.sig ;
   end;
   END;

new(nue);
 nue^.dato:=reg;
 nue^.sig:=l;
 l:=nue;


BEGIN
   inicializarVcalle (vCalle);
   inicializarVmes (vMes);
   l := nil;
   cargarLista(l);
   RecorrerLista(l, vCalle, vMes);
   InformarCalles(vCalle);
   InformarMayorMes(vMes);
   liberarVectorM(VM);
   liberarVectorC(VC);
   liberarMemoria(l);
END;

