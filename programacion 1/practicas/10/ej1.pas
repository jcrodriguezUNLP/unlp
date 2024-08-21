{
    1. Un banco dispone de una lista en donde almacena la información de aquellos clientes que vienen a pagar impuestos.
        De cada cliente conoce: DNI, Nombre, Apellido, código de impuesto a pagar (1 a 9) y el monto a pagar.
        Se pide: 
            a. Realizar la atención de los clientes hasta que se recaude al menos 100.000 pesos o hasta que se terminen los clientes. 
            b. Al finalizar la atención informar el código de impuesto que más veces se pagó por los clientes que fueron atendidos. 
            c. Al finalizar la atención informar, en caso de que hayan quedado, la cantidad de clientes sin atender. 
    Nota: Asumir que cada cliente paga un solo impuesto.
}

program ej1 ;
type
    TCadena50 = string [ 50 ] ;
    TCodigo = 1..9 ;

    TCliente = record
        DNI           : Integer    ;
        nombre        : TCladena50 ;
        apellido      : TCadena50  ;
        codDeImpuesto : TCodigo    ;
        monto         : Real       ;
    end ;

    TLista = ^nodo ;

    nodo = record
        cliente : TCliente ;
        sig : TLista ;
    end ;

//  procedure procesarDatos ( L : TLista ) ;
        procedure procesarDatos ( L : TLista ) ;
        begin
            while ( L <> Nil ) do
            begin
                L := L^.sig ;
            end ;
        end ;


var
begin

end.