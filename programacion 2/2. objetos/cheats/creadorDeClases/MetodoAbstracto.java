// package creadorDeClases;

public class MetodoAbstracto {
    private String nombre ;
    private String tipo ;

    public MetodoAbstracto( String tipo , String nombre ) {
        this.nombre = nombre ;
        this.tipo = tipo ;
    }

    public String getNombre() {
        return nombre ;
    }

    public String getTipo() {
        return tipo ;
    }

    public String generarCodigo() {
        StringBuilder codigo = new StringBuilder() ;

        // Definir el método
        codigo.append( "public " )
              .append( tipo )
              .append( " " )
              .append( nombre )
              .append( "()" ) ;


        return codigo.toString() ;
    }
}
