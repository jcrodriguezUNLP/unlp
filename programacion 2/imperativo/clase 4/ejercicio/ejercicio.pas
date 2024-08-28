program ejercicio ;
const
  FIN     = 'ZZZ' ;
  ESPACIO = 50    ;

type
  TCadena50 = String[ 50 ] ;
  
  TAlumno = record
    dni      : longint   ;
    nombre   : TCadena50 ;
    apellido : TCadena50 ;
  end ;

  {Estructura para el árbol}
  TArbol = ^TNodoArbol ;

  TNodoArbol = record
    alumno  : TAlumno ;
    hijoIzq : TArbol  ;
    hijoDer : TArbol  ;
  end ;

// creado por mi
  // procedure separador( n : Integer );
    procedure separador( n : Integer );
    var
      i : Integer ;

    begin
      for i := 1 to n do
      begin
        writeln ;
      end ;
    end ;
  //
//

// procedure LeerAlumno ( var alumno : TAlumno ) ;
  procedure LeerAlumno ( var alumno : TAlumno ) ;
  begin
    with( alumno )do
    begin
      writeln ( 'Ingrese el nombre del Alumno: ' ) ;
      readln  ( nombre                           ) ;

      if( nombre <> FIN )then
      begin
        writeln ( 'Ingrese el apellido del Alumno: ' ) ;
        readln  ( apellido                           ) ;
        writeln ( 'Ingrese el DNI del Alumno: '      ) ;
        readln  ( dni                                ) ;
      end ;
    end ;
  end ;
//

// procedure Agregar ( var arbol : TArbol ; alumno : TAlumno ) ;
  procedure Agregar ( var arbol : TArbol ; alumno : TAlumno ) ;
  begin
    if( arbol = Nil )then
    begin
      {Crear el nodo y enlazarlo}
      new( arbol ) ;

      arbol^.alumno  := alumno ;
      arbol^.hijoIzq := Nil    ;
      arbol^.hijoDer := Nil    ;
    end
    else{no tenemos el árbol vacío}
      if( alumno.dni < arbol^.alumno.dni ) then
      begin
        Agregar( arbol^.hijoIzq, alumno )
      end else
      begin
        Agregar( arbol^.hijoDer, alumno ) ;
      end ;
  end ;
//

// procedure CargarEstructura ( var arbol : TArbol ) ;
  procedure CargarEstructura ( var arbol : TArbol ) ;
  var
    alumno : TAlumno ;

  begin
    LeerAlumno( alumno ) ;

    while ( alumno.nombre <> FIN )do
    begin
      Agregar    ( arbol , alumno ) ;
      LeerAlumno ( alumno         ) ;
    end ;
  end ;
//

// procedure ImprimirAlumno ( alumno : TAlumno ) ;
  procedure ImprimirAlumno ( alumno : TAlumno ) ;
  begin
    writeln( 'TAlumno: ' , alumno.nombre , ' ' , alumno.apellido , ' DNI: ' , alumno.dni ) ;
  end ;
//

// procedure Imprimir ( arbol : TArbol ) ;
  procedure Imprimir ( arbol : TArbol ) ;
  begin
    if( arbol <> Nil )then
    begin
      Imprimir       ( arbol^.hijoIzq ) ; //1
      ImprimirAlumno ( arbol^.alumno  ) ; //2
      Imprimir       ( arbol^.hijoDer ) ; //3
    end ;
  end ;
//

// procedure BusquedaDNI ( arbol : TArbol ; dni: longint ; var alumno : TAlumno ) ;
  procedure BusquedaDNI ( arbol : TArbol ; dni: longint ; var alumno : TAlumno ) ;
  begin
    if( arbol <> Nil )then
    begin
      if( arbol^.alumno.dni = dni ) then
      begin
        alumno := arbol^.alumno ; {Copiar el alumno del árbol al registro de retorno}
      end else
      begin
        if( arbol^.alumno.dni > dni ) then
        begin
          BusquedaDNI( arbol^.hijoIzq, dni, alumno ) ;
        end else
        begin
          BusquedaDNI( arbol^.hijoDer, dni, alumno ) ;
        end ;
      end ;
    end
    else
    begin
      alumno.dni := -1 ;{no lo encontré}
    end ;
  end ;
//

// creado por mi
  // procedure busquedaPorApellido ( arbol : TArbol ; apellido : TCadena50 ) ;
    procedure busquedaPorApellido ( arbol : TArbol ; apellido : TCadena50 ) ;
    begin
      if ( arbol <> Nil ) then
      begin
        if ( arbol^.alumno.apellido = apellido ) then
        begin
          ImprimirAlumno( arbol^.alumno ) ;
        end ;

        busquedaPorApellido( arbol^.hijoIzq , apellido ) ;
        busquedaPorApellido( arbol^.hijoDer , apellido ) ;
      end ;
    end ;
  //

  // procedure imprimirArbol_enOrden ( arbol : TArbol ) ;
    procedure imprimirArbol_enOrden ( arbol : TArbol ) ;
    begin
      if ( arbol <> Nil ) then
      begin
        imprimirArbol_enOrden ( arbol^.hijoIzq             ) ;
        Write                 ( arbol^.alumno.dni , '-' ) ;
        imprimirArbol_enOrden ( arbol^.hijoDer             ) ;
      end ;
    end ;
  //

  // procedure imprimirArbol_preOrden ( arbol : TArbol ) ;
    procedure imprimirArbol_preOrden ( arbol : TArbol ) ;
    begin
      if ( arbol <> Nil ) then
      begin       
        Write                  ( arbol^.alumno.dni , '-' ) ;
        imprimirArbol_preOrden ( arbol^.hijoIzq             ) ;
        imprimirArbol_preOrden ( arbol^.hijoDer             ) ;
      end ;
    end ;
  //

  // procedure imprimirArbol_postOrden ( arbol : TArbol ) ;
    procedure imprimirArbol_postOrden ( arbol : TArbol ) ;
    begin
      if ( arbol <> Nil ) then
      begin
        imprimirArbol_postOrden ( arbol^.hijoIzq             ) ;
        imprimirArbol_postOrden ( arbol^.hijoDer             ) ;
        Write                   ( arbol^.alumno.dni , '-' ) ;
      end ;
    end ;
  //

  // procedure graficarArbol ( arbol : TArbol ; espacio : Integer ; nivel : Integer ; var nivelAnt : Integer ) ;
    procedure graficarArbol ( arbol : TArbol ; espacio : Integer ; nivel : Integer ; var nivelAnt : Integer ) ;
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

        WriteLn ( arbol^.alumno.dni ) ;
        
        for i := 1 to (espacio - 1) do
        begin
          Write ( ' ' ) ;
        end ;

        WriteLn ( '/ \' ) ;

        nivel    := ( nivel    + 1 ) ;
        nivelAnt := ( nivelAnt + 1 ) ;

        graficarArbol( arbol^.hijoIzq, (ESPACIO - 2) , nivel , nivelAnt ) ;
        graficarArbol( arbol^.hijoDer, (ESPACIO + 2) , nivel , nivelAnt ) ;
      end ;
    end ;
  //

    // procedure inicializarEstructura ( var arbol : TArbol ) ;
      procedure inicializarEstructura ( var arbol : TArbol ) ;
      begin
          arbol := Nil ;
      end ;
    //

  // procedure menu ( var opcion: Integer ; var arbol: TArbol ) ;
    procedure menu ( var opcion: Integer ; var arbol: TArbol ) ;
    var
      dni             : longint   ;
      alumno          : TAlumno   ;
      repetir         : Boolean   ;
      nivelAnt        : Integer   ;
      apellidoABuscar : TCadena50 ;


    begin
        repeat
            separador ( 2                                                    ) ;
            WriteLn   ( 'Que desea hacer: '                                  ) ;
            WriteLn   ( '    1. Reiniciar estructuras'                       ) ;
            WriteLn   ( '    2. Ingresar alumnos'                            ) ;
            WriteLn   ( '    3. Imprimir estructura'                         ) ;
            WriteLn   ( '    4. Informar alumno con dni'                     ) ;
            WriteLn   ( '    5. Informar alumnos con apellido'               ) ;
            separador ( 1                                                    ) ;
            WriteLn   ( '    0. Finalizar programa'                          ) ;
            separador ( 1                                                    ) ;
            Write     ( 'Opcion: '                                           ) ;
            ReadLn    ( opcion                                               ) ;

            repetir := ( (opcion < 0) or (opcion > 5) ) ;

            if ( repetir ) then
            begin
                separador ( 1                 ) ;
                WriteLn   ( 'Numero invalido' ) ;
            end ;
        until( not repetir ) ;

        if ( opcion <> 0 ) then
        begin
            case opcion of
            1:
                begin
                    inicializarEstructura ( arbol                       ) ;
                    separador             ( 1                           ) ;
                    WriteLn               ( 'Estructuras inicializadas' ) ;
                end ;
            2:
                begin
                    CargarEstructura( arbol ) ;
                end ;
            3:
                begin
                    separador               ( 2                    ) ;
                    WriteLn                 ( 'Arbol:'             ) ;
                    separador               ( 1                    ) ;
                    Write                   ( 'Arbol en orden: '   ) ;
                    imprimirArbol_enOrden   ( arbol                ) ;
                    separador               ( 1                    ) ;
                    Write                   ( 'Arbol pre orden: '  ) ;
                    imprimirArbol_preOrden  ( arbol                ) ;
                    separador               ( 1                    ) ;
                    Write                   ( 'Arbol post orden: ' ) ;
                    imprimirArbol_postOrden ( arbol                ) ;
                    
                    nivelAnt := -1 ;

                    separador     ( 2                              ) ;
                    graficarArbol ( arbol , ESPACIO , 0 , nivelAnt ) ;
                end ;
            4:
                begin
                  separador   ( 1                    ) ;
                  writeln     ( 'Ingrese un DNI'     ) ;
                  readln      ( dni                  ) ;
                  BusquedaDNI ( arbol , dni , alumno ) ;

                  if( alumno.dni <> -1 )then
                  begin
                    writeln        ( 'El Alumno buscado es: ' ) ;
                    ImprimirAlumno ( alumno                   ) ;
                  end else
                  begin
                    writeln( 'El Alumno buscado no existe en este curso' ) ;
                  end ;
                end ;
            5:
                begin
                  separador           ( 1                                  ) ;
                  Write               ( 'Ingrese el apellido a imprimir: ' ) ;
                  ReadLn              ( apellidoABuscar                    ) ;
                  busquedaPorApellido ( arbol , apellidoABuscar            ) ;
                end ;
            end ;
        end ;
    end ;
  //
//

var
  arbol  : TArbol  ;

  // creado por mi
    opcion : Integer ;
  //

begin
  inicializarEstructura ( arbol ) ;
  
  // creado por mi
    repeat
      menu( opcion , arbol ) ;
    until( opcion = 0 ) ;
  //
end.