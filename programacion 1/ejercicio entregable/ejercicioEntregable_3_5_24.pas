program ejercicioEntregable_3_5_24 ;
const
    MAX_INGREDIENTES = 56 ;
    
    // creado por mi 
        CANTIDADMAXIMADEINGREDIENTESXPLATO = 12 ;
    //
 
type
    TIngrediente = record
        codigo : string [ 5  ] ;
        nombre : string [ 50 ] ;
        costo  : real          ;
    end ;
    
    TIngredientes = array [ 1..MAX_INGREDIENTES ] of TIngrediente ;
    
    // creado por mi
        TNombre = string [ 50 ] ;
        TCodigo = string [ 5  ] ;
        
        TIngredientesXPlato = array [ 1..CANTIDADMAXIMADEINGREDIENTESXPLATO] of TIngrediente ;
        
        TPlato = record
            nombre                 : TNombre                               ;
            cantidadDeIngredientes : 1..CANTIDADMAXIMADEINGREDIENTESXPLATO ;
            ingredientes           : TIngredientesXPlato                   ;
        end ;
        
        TLista = ^nodo ;
        
        nodo = record
            plato : TPlato ;
            sig   : TLista ; 
        end ;
        
        TPlatoAct = record
            nombre         : TNombre      ;
            total          : real         ;
            ingredienteMax : TIngrediente ;
        end ;
    //

const
    INGREDIENTES: TIngredientes = (
        ( codigo : 'B0001' ; nombre : 'Café'              ; costo : 7.20  ) ,
        ( codigo : 'B0002' ; nombre : 'Té'                ; costo : 4.50  ) ,
        ( codigo : 'B0003' ; nombre : 'Chocolate'         ; costo : 18.40 ) ,
        ( codigo : 'B0004' ; nombre : 'Vino'              ; costo : 12.80 ) ,
        ( codigo : 'B0005' ; nombre : 'Cerveza'           ; costo : 9.70  ) ,
        ( codigo : 'B0006' ; nombre : 'Jugo de naranja'   ; costo : 5.60  ) ,
        ( codigo : 'B0007' ; nombre : 'Leche de almendra' ; costo : 8.90  ) ,
        ( codigo : 'B0010' ; nombre : 'Licor'             ; costo : 15.70 ) ,
        ( codigo : 'C0001' ; nombre : 'Pollo'             ; costo : 20.50 ) ,
        ( codigo : 'C0002' ; nombre : 'Ternera'           ; costo : 25.75 ) ,
        ( codigo : 'C0003' ; nombre : 'Pescado'           ; costo : 18.20 ) ,
        ( codigo : 'C0004' ; nombre : 'Cerdo'             ; costo : 22.40 ) ,
        ( codigo : 'C0005' ; nombre : 'Cordero'           ; costo : 28.90 ) ,
        ( codigo : 'C0006' ; nombre : 'Pavo'              ; costo : 19.80 ) ,
        ( codigo : 'C0007' ; nombre : 'Salmón'            ; costo : 24.60 ) ,
        ( codigo : 'C0008' ; nombre : 'Camarones'         ; costo : 30.20 ) ,
        ( codigo : 'F0001' ; nombre : 'Manzana'           ; costo : 3.70  ) ,
        ( codigo : 'F0002' ; nombre : 'Naranja'           ; costo : 4.20  ) ,
        ( codigo : 'F0003' ; nombre : 'Plátano'           ; costo : 2.90  ) ,
        ( codigo : 'F0004' ; nombre : 'Fresa'             ; costo : 6.80  ) ,
        ( codigo : 'F0005' ; nombre : 'Uva'               ; costo : 5.50  ) ,
        ( codigo : 'F0006' ; nombre : 'Limón'             ; costo : 2.40  ) ,
        ( codigo : 'F0007' ; nombre : 'Piña'              ; costo : 7.60  ) ,
        ( codigo : 'F0008' ; nombre : 'Kiwi'              ; costo : 5.20  ) ,
        ( codigo : 'F0009' ; nombre : 'Melón'             ; costo : 4.80  ) ,
        ( codigo : 'F0010' ; nombre : 'Sandía'            ; costo : 6.30  ) ,
        ( codigo : 'G0001' ; nombre : 'Aceite'            ; costo : 4.20  ) ,
        ( codigo : 'G0002' ; nombre : 'Sal'               ; costo : 2.10  ) ,
        ( codigo : 'G0003' ; nombre : 'Pimienta'          ; costo : 3.60  ) ,
        ( codigo : 'G0004' ; nombre : 'Vinagre'           ; costo : 2.80  ) ,
        ( codigo : 'G0005' ; nombre : 'Mostaza'           ; costo : 3.90  ) ,
        ( codigo : 'G0006' ; nombre : 'Curry'             ; costo : 4.70  ) ,
        ( codigo : 'G0007' ; nombre : 'Comino'            ; costo : 3.20  ) ,
        ( codigo : 'G0008' ; nombre : 'Cilantro'          ; costo : 4.10  ) ,
        ( codigo : 'H0001' ; nombre : 'Harina'            ; costo : 5.40  ) ,
        ( codigo : 'H0002' ; nombre : 'Huevos'            ; costo : 10.20 ) ,
        ( codigo : 'H0003' ; nombre : 'Azúcar'            ; costo : 8.50  ) ,
        ( codigo : 'H0004' ; nombre : 'Levadura'          ; costo : 4.60  ) ,
        ( codigo : 'H0005' ; nombre : 'Avena'             ; costo : 6.90  ) ,
        ( codigo : 'L0001' ; nombre : 'Leche'             ; costo : 6.30  ) ,
        ( codigo : 'L0002' ; nombre : 'Queso'             ; costo : 15.40 ) ,
        ( codigo : 'L0003' ; nombre : 'Yogur'             ; costo : 4.80  ) ,
        ( codigo : 'L0004' ; nombre : 'Mantequilla'       ; costo : 12.70 ) ,
        ( codigo : 'L0005' ; nombre : 'Crema'             ; costo : 8.50  ) ,
        ( codigo : 'V0001' ; nombre : 'Tomate'            ; costo : 3.20  ) ,
        ( codigo : 'V0002' ; nombre : 'Lechuga'           ; costo : 4.10  ) ,
        ( codigo : 'V0003' ; nombre : 'Zanahoria'         ; costo : 2.70  ) ,
        ( codigo : 'V0004' ; nombre : 'Cebolla'           ; costo : 4.50  ) ,
        ( codigo : 'V0005' ; nombre : 'Ajo'               ; costo : 5.20  ) ,
        ( codigo : 'V0006' ; nombre : 'Perejil'           ; costo : 3.40  ) ,
        ( codigo : 'V0007' ; nombre : 'Espinaca'          ; costo : 5.90  ) ,
        ( codigo : 'V0008' ; nombre : 'Pimiento'          ; costo : 4.80  ) ,
        ( codigo : 'V0009' ; nombre : 'Calabacín'         ; costo : 3.70  ) ,
        ( codigo : 'V0010' ; nombre : 'Berenjena'         ; costo : 5.10  ) ,
        ( codigo : 'V0011' ; nombre : 'Brócoli'           ; costo : 6.20  ) ,
        ( codigo : 'V0012' ; nombre : 'Coliflor'          ; costo : 5.80  )
    ) ;

// procedure buscarIngrediente ( var ingrediente : TIngrediente ) ;
    procedure buscarIngrediente ( var ingrediente : TIngrediente ) ;
    var
        inicio   : integer ;
        medio    : integer ;
        final    : integer ;
        encontre : boolean ;

    begin
        inicio   := 1                ; 
        final    := MAX_INGREDIENTES ;
        encontre := false            ;
        
        while ( (inicio <= final) and (not encontre) ) do
        begin
            medio := ( (inicio + final) div 2  ) ;

            encontre := ( ingrediente.codigo = INGREDIENTES[ medio ].codigo ) ;
            
            if ( not encontre ) then
            begin
                if ( ingrediente.codigo < INGREDIENTES[ medio ].codigo ) then
                begin
                    final := ( medio - 1 ) ;
                end else
                begin
                    inicio := ( medio + 1 )
                end ;
            end ;
        end ;
        
        if ( encontre ) then
        begin
            ingrediente.nombre := INGREDIENTES[ medio ].nombre ;
            ingrediente.costo  := INGREDIENTES[ medio ].costo  ;
        end else
        begin
            ingrediente.nombre := 'inexistente' ;
        end ;
    end ;
//

// function existe ( codigo : TCodigo ) : boolean ;
    function existe ( codigo : TCodigo ) : boolean ;
    var
        ingrediente : TIngrediente ;
    
    begin
        ingrediente.codigo := codigo ;
        
        buscarIngrediente ( ingrediente ) ;
        
        existe := ( ingrediente.nombre <> 'inexistente' ) ;
    end ;
//

// procedure insertarOrdenado ( var L : TLista ; nuevoNodo : TLista ) ;
    procedure insertarOrdenado ( var L : TLista ; nuevoNodo : TLista ) ;
    var
        ant : TLista ;
        act : TLista ;

    begin
        ant := L ;
        act := L ;
        
        while ( (act <> Nil) and (act^.plato.nombre < nuevoNodo^.plato.nombre) ) do
        begin
            ant := act      ;
            act := act^.sig ;
        end ;
        
        if ( ant = act ) then
        begin
            nuevoNodo^.sig := act       ;
            L              := nuevoNodo ;
        end else
        begin
            nuevoNodo^.sig := act       ;
            ant^.sig       := nuevoNodo ;
        end ;
    end ;
//

// procedure generarListaOrdenada ( var L : TLista ) ;
    procedure generarListaOrdenada ( var L : TLista ) ;
    var
        fin              : boolean      ;
        nuevoNodo        : TLista       ;
        nuevoPlato       : TPlato       ;
        numDeIngrediente : integer      ;
        ingredienteAct   : TIngrediente ;

    begin
        repeat
            writeln (); //borrar
            
            write  ( 'Ingrese el nombre del plato: ') ; //borrar
            readln ( nuevoPlato.nombre              ) ;
            
            fin := ( nuevoPlato.nombre = 'zzz' ) ;
            
            if ( not fin ) then
            begin
                write  ( '    Ingrese la cantidad de ingredientes : ') ; //borrar
                readln ( nuevoPlato.cantidadDeIngredientes           ) ;
                
                for numDeIngrediente := 1 to nuevoPlato.cantidadDeIngredientes do
                begin
                    repeat
                        write  ( '        Ingrese el codigo del ingrediente N°' , numDeIngrediente , ': ') ; //borrar
                        readln ( ingredienteAct.codigo                                                   ) ;
                        
                    until ( existe(ingredienteAct.codigo) ) ;
                    
                    buscarIngrediente ( ingredienteAct ) ;
                    
                    nuevoPlato.ingredientes[ numDeIngrediente ] := ingredienteAct ;
                end ;
                
                new ( nuevoNodo ) ;
                
                nuevoNodo^.plato := nuevoPlato ;
                nuevoNodo^.sig   := Nil        ;
                
                insertarOrdenado ( L , nuevoNodo ) ;
            end ;
        until ( fin ) ;
    end ;
//

// procedure reiniciarPLatoAct ( var platoAct : TPlatoAct ; plato : TPlato ) ;
    procedure reiniciarPLatoAct ( var platoAct : TPlatoAct ; plato : TPlato ) ;
    begin
        platoAct.nombre               := plato.nombre ;
        platoAct.total                := 0            ;
        platoAct.ingredienteMax.costo := 0            ;
    end ;
//

// procedure actualizarPLatoAct ( var platoAct : TPlatoAct ; plato : TPlato ) ;
    procedure actualizarPLatoAct ( var platoAct : TPlatoAct ; plato : TPlato ) ;
    var
        sumaIngredientes : real         ;
        ingredienteAct   : TIngrediente ;
        numDeIngrediente : integer      ;
    
    begin
        sumaIngredientes := 0 ;
        
        for numDeIngrediente := 1 to plato.cantidadDeIngredientes do
        begin
            ingredienteAct   := plato.ingredientes[ numDeIngrediente ]  ;
            sumaIngredientes := sumaIngredientes + ingredienteAct.costo ;
            
            if ( platoAct.ingredienteMax.costo < ingredienteAct.costo ) then
            begin
                platoAct.ingredienteMax := ingredienteAct ;
            end ;
        end ;
        
        platoAct.total := sumaIngredientes ;
    end ;
//

// procedure informarPlato ( platoAct : TPlatoAct ) ;
    procedure informarPlato ( platoAct : TPlatoAct ) ;
    begin
        writeln ( ) ;
        
        writeln ( 'Plato: ' , platoAct.nombre                               ) ;
        writeln ( '    Precio: ' , platoAct.total : 2 : 2                   ) ;
        writeln ( '    Ingrediente mas caro: '                              ) ;
        writeln ( '        ' , platoAct.ingredienteMax.nombre               ) ;
        writeln ( '        Codigo: ' , platoAct.ingredienteMax.codigo       ) ;
        writeln ( '        Costo: ' , platoAct.ingredienteMax.costo : 2 : 2 ) ;
    end ;
//

// procedure recorrerLista ( L : TLista ) ;
    procedure recorrerLista ( L : TLista ) ;
    var
        platoAct : TPlatoAct ;
        ant      : TLista    ;
        act      : TLista    ;
        
    begin
        ant := L ;
        act := L ;
        
        reiniciarPLatoAct ( platoAct , L^.plato ) ;

        while ( act <> Nil ) do
        begin
            if ( ant^.plato.nombre <> act^.plato.nombre ) then
            begin
                InformarPlato     ( platoAct              ) ;
                reiniciarPLatoAct ( platoAct , act^.plato ) ;
            end ;
            
            actualizarPlatoAct ( platoAct , act^.plato ) ;
            
            ant := act      ;
            act := act^.sig ;
        end ;
        
        InformarPlato ( platoAct ) ;
    end ;
//+

// procedure liberarMemoria ( var L : TLista ) ;
    procedure liberarMemoria ( var L : TLista ) ;
    var
        aux : TLista ;
    
    begin
        while ( L <> Nil ) do
        begin
            aux := L      ;
            L   := L^.sig ;
            
            dispose ( aux )
        end ;
    end ;
//

var 
    L : TLista ;

begin
    generarListaOrdenada ( L , INGREDIENTES ) ;
    recorrerLista        ( L                ) ;
    liberarMemoria       ( L                ) ;
end.