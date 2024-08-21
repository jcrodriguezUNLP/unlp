{
    Una academia de baile requiere el procesamiento de información relacionada con sus clientes.
    De cada cliente se conoce su
        nombre
        DNI (numérico)
        código de cliente (numérico)
        fecha de ingreso
        edad
        código de actividad en la que está inscripto, dentro de las 20 que ofrece la academia.

    Se dispone de
        lista con la información de los clientes
        estructura de datos que permite acceder al nombre de la actividad de la academia a través de su código.
    
    Se pide recorrer la lista una única vez para:
        a) Reparar el error que produce el módulo generador de la lista. Este módulo invierte el código de cliente y el DNI. Para corregirlo,
            si el valor original es 54321 debe corregirse para que quede como 12345.
        b) Contabilizar por cada actividad la cantidad de clientes inscriptos. Luego informar los nombres de las 2 actividades más populares.
        c) Generar 20 nuevas listas, una por cada código de actividad, a partir de la lista de clientes. Cada lista debe quedar ordenada por edad.
}
program academia ;
const
    CANTDEACTIVIDADES = 20 ;
type
    TCadena50 = string [ 50 ] ;

    TRangoDia       = 1..31                ;
    TRangoMes       = 1..12                ;
    TRangoAno       = 1..2024              ;
    TRangoActividad = 1..CANTDEACTIVIDADES ;

    TFecha = record
        dia : TRangoDias  ;
        mes : TRangoMeses ;
        ano : TRangoAnos  ;
    end ;

    TCliente = record
        nombre         : TCadena50               ;
        DNI            : Integer                 ;
        codDeCliente   : Integer                 ;
        fechaDeIngreso : TFecha                  ;
        edad           : Integer                 ;
        codDeActividad : TRangoActividad ;
    end ;

    TLista = ^nodo ;

    nodo = record
        cliente : TCliente ;
        sig     : TLista   ;
    end ;

    TNombresActividades = array [ TRangoActividad ] of TCadena50 ;

    TActividades = array [ TRangoActividad ] of Integer ;


    procedure recorrerLista ( L : TLista ; nombresActividades : TNombresActividades ) ;
    begin
        while ( L <> Nil ) do
        begin

            L := L^.sig ;
        end ;
    end ;

var
begin
end.