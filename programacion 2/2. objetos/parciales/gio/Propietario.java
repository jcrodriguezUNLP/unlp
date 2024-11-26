public class Propietario {
    private int CUIT ;
    private String nombre ;
    private String apellido ;

    // Constructores
        public Propietario() {}

        public Propietario( int CUIT , String nombre , String apellido ) {
            this.CUIT = CUIT ;
            this.nombre = nombre ;
            this.apellido = apellido ;
        }
    //

    // Getters
        public int getCUIT() { return CUIT ; }

        public String getNombre() { return nombre ; }
    //
        public String getApellido() { return apellido ; }
    //

    // Setters
        public void setCUIT( int CUIT ) { this.CUIT = CUIT ; }

        public void setNombre( String nombre ) { this.nombre = nombre ; }

        public void setApellido( String apellido ) { this.apellido = apellido ; }
    //

    // Métodos
        @Override
        public String toString() {
            String texto = "" ;

            texto += ( "Sangria.sangria( 1 ) CUIT: " + CUIT ) ;
            texto += ( "Sangria.sangria( 1 ) nombre: " + nombre ) ;
            texto += ( "Sangria.sangria( 1 ) apellido: " + apellido ) ;

            return( texto ) ;
        }
    //
}