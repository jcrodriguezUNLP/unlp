{
    9.
        Una empresa turística ofrece servicios de venta de paquetes a diferentes lugares del país.
        La misma cuenta con dos estructuras de datos:
            listaClientes (desordenada)
                clientes
                    número de cliente
                    apellido
                    nombre
                    DNI
                    domicilio
                sig

            vector 1..300
                paquetes
                    nombre del destino
                    cantidad de plazas disponibles.
                    
        Realice: 
            a.
                genere
                    listaVentas:
                        ventas
                            DNI (verificar dni)
                            código de paquete
                            cantidad de plazas (verificar cant de plazas restantes)

            La venta de paquetes finaliza cuando se lee un DNI igual a 0.

            b.
                Una vez finalizada la venta de paquetes se pide: 
                i. 
                    informar
                        maximos[1..2]
                            codigo de paquete
                            cant de plazas disponibles (criterio)
                
                ii.
                    informar:
                        cantidad de dni no encontrado
                        cantidad de plazas insuficiente

}

program ej9 ;
const
    CANTDEPAQUETES = 300 ;

type
    TRangoPaquetes = 1..CANTDEPAQUETES ;

    TCadena50 = String [ 50 ] ;

    TCliente = record
        numDeCliente : Integer   ; 
        apellido     : TCadena50 ;
        nombre       : TCadena50 ;
        DNI          : Integer   ;
        domicilio    : TCadena50 ;
    end ;

    TListaClientes = ^TNodo ;

    TNodoCliente = record
        cliente : TCliente       ;
        sig     : TListaClientes ;
    end ;

    TPaquete = record
        nombreDelDestino : TCadena50 ;
        cantDePlazasDisp : Integer   ;
    end ;

    TPaquetes = array [ TRangoPaquetes ] of TPaquete ;

    TVenta = record
        DNI          : Integer        ;
        codDePaquete : TRangoPaquetes ;
        cantDePlazas : Integer        ;
    end ;

    TListaVentas = ^TNodoVentas ;

    TNodoVentas = record
        venta : TVenta       ;
        sig   : TListaVentas ;
    end ;

    TMaximo = record
        codDePaquete     : TRangoPaquetes ;
        cantDePlazasDisp : Integer        ;
    end ;

    TMaximos = array [ 1..2 ] of TMaximo ;

    TVentasInvalidas = record
        DNI          : Integer ;
        cantDePlazas : Integer ;
    end ;

// procedure inicializarVentasInvalidas ( var ventasInvalidas : TVentasInvalidas ) ;
    procedure inicializarVentasInvalidas ( var ventasInvalidas : TVentasInvalidas ) ;
    begin
        ventasInvalidas.DNI          := 0 ;
        ventasInvalidas.cantDePlazas := 0 ;
    end ;
//

// function DNIExistente ( LC : TListaClientes ; DNI : Integer ) : Boolean ;
    function DNIExistente ( LC : TListaClientes ; DNI : Integer ) : Boolean ;
    begin
        while ( (LC <> Nil) and (LC^.cliente.DNI <> DNI) ) do
        begin
            LC := LC^.sig ;
        end ;

        DNIExistente := ( LC^.cliente.DNI = DNI ) ;
    end ;
//

// procedure informarMaximos ( var maximos : TMaximos ; paquetes : TPaquetes ) ;
    procedure informarMaximos ( var maximos : TMaximos ; paquetes : TPaquetes ) ;
    var
        i : Integer ;

    begin
        for i := 1 to 2 do
        begin
            maximos[ i ].cantDePlazasDisp := 0 ;
        end ;

        for i := 1 to CANTDEPAQUETES do
        begin
            if ( maximos[ 1 ] < paquetes[ i ].cantDePlazasDisp ) then
            begin
                maximos[ 2 ] := maximos[ 1 ] ;

                maximos[ 1 ].codDePaquete     := i                              ;
                maximos[ 1 ].cantDePlazasDisp := paquetes[ i ].cantDePlazasDisp ;

            end else if ( maximos[ 2 ] < paquetes[ i ].cantDePlazasDisp ) then
            begin
                maximos[ 2 ].codDePaquete     := i                              ;
                maximos[ 2 ].cantDePlazasDisp := paquetes[ i ].cantDePlazasDisp ;
            end ;
        end ;

        for i := 1 to  2 do
        begin
            WriteLn ( maximos[ i ].codDePaquete     ) ;
            WriteLn ( maximos[ i ].cantDePlazasDisp ) ;
        end ;
    end ;
//

// procedure informarVentasInvalidas ( ventasInvalidas : TVentasInvalidas ) ;
    procedure informarVentasInvalidas ( ventasInvalidas : TVentasInvalidas ) ;
    begin
        WriteLn ( ventasInvalidas.DNI          ) ;
        WriteLn ( ventasInvalidas.cantDePlazas ) ;
    end ;

//

// procedure generarListaVentas ( var LV : TListaVentas ; var paquetes : TPaquetes ; LC : TListaClientes ) ;
    procedure generarListaVentas ( var LV : TListaVentas ; var paquetes : TPaquetes ; LC : TListaClientes ) ;
    var
        fin             : Boolean          ;
        ult             : TListaVentas     ;
        venta           : TVenta           ;
        nuevo           : TListaVentas     ;
        ventasInvalidas : TVentasInvalidas ;

    begin
        LV := Nil ;

        inicializarVentasInvalidas ( ventasInvalidas ) ;

        repeat
            ReadLn ( venta.DNI ) ;

            fin := ( venta.DNI = 0 ) ;

            if ( not fin ) then
            begin
                fin := DNIExistente ( LC , venta.DNI ) ;

                if (not fin ) then
                begin
                    ReadLn ( venta.codDePaquete) ;
                    ReadLn ( venta.cantDePlazas) ;

                    fin := ( venta.cantDePlazas < paquetes[ venta.codDePaquete ].cantDePlazasDisp ) ;

                    if ( not fin ) then
                    begin
                        paquetes[ venta.codDePaquete ].cantDePlazasDisp := ( paquetes[ venta.codDePaquete ].cantDePlazasDisp - venta.cantDePlazas ) ;

                        New ( nuevo ) ;

                        nuevo^.venta := venta ;
                        nuevo^.sig   := Nil   ;

                        if ( LV = Nil ) then
                        begin
                            LV := nuevo ;
                        end else
                        begin
                            ult^.sig := nuevo ;
                        end ;

                        ult := nuevo ;
                    end else
                    begin
                        ventasInvalidas.cantDePlazas := ( ventasInvalidas.cantDePlazas + 1 ) ;
                    end ;
                end else
                begin
                    ventasInvalidas.DNI := ( ventasInvalidas.DNI + 1 ) ;
                end ;
            end ;
        until ( fin ) ;

        informarMaximos         ( maximos , paquetes ) ;
        informarVentasInvalidas ( ventasInvalidas    ) ;
    end ;
//

// procedure liberarMemoriaLV ( var LV : TListaVentas ) ;
    procedure liberarMemoriaLV ( var LV : TListaVentas ) ;
    var
        aux : TListaVentas ;

    begin
        while ( LV <> Nil ) do
        begin
            aux := LV      ;
            LV  := LV^.sig ;

            Dispose ( aux ) ;
        end ;
    end ;
//

// procedure liberarMemoriaLC ( var LC : TListaClientes ) ;
    procedure liberarMemoriaLC ( var LC : TListaClientes ) ;
    var
        aux : TListaClientes ;

    begin
        while ( LC <> Nil ) do
        begin
            aux := LC      ;
            LC  := LC^.sig ;

            Dispose ( aux ) ;
        end ;
    end ;
//

var
    LC       : TListaClientes ;
    LV       : TListaVentas   ;
    paquetes : TPaquetes      ;

begin
    generarListaClientes ( LC       ) ; // SE DISPONE
    generarPaquetes      ( paquetes ) ; // SE DISPONE

    generarListaVentas   ( LV , paquetes , LC ) ;
    liberarMemoriaLC     ( LC                 ) ;
    liberarMemoriaLV     ( LV                 ) ;
end.