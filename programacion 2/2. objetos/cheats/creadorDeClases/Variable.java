// package creadorDeClases ;

public class Variable {
    private String tipo ;
    private String nombre ;

    // constructores
        public Variable() {}

        public Variable( String tipo , String nombre ) {
            this.tipo = tipo ;
            this.nombre = nombre ;
        }
    //

    // getters
        public String getTipo() { return tipo ; }

        public String getNombre() { return nombre ; }
    //

    // setters
        public void setTipo( String tipo ) { this.tipo = tipo ; }

        public void setNombre( String nombre ) { this.nombre = nombre ; }
    //
}
