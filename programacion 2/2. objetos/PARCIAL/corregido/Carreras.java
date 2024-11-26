public class Carreras {
    private Carrera[] carreras ;

    private int cantCarreras ;
    
    private int MAX_CARRERAS ;

    // constructores
        public Carreras() {
            // DimL
            cantCarreras = 0 ;

            // son maximo 5 pero pongo 2 para ejecutar mas rapido
            MAX_CARRERAS = 5 ;

            this.carreras = new Carrera[ MAX_CARRERAS ] ;
        }
    //

    // Getters
        public int getCantCarreras() { return cantCarreras ; }

        public int getMAX_CARRERAS() { return MAX_CARRERAS ; }
    //
    
    // metodos
        public void agregarCarrera( Carrera carrera ) {
            if( cantCarreras < MAX_CARRERAS ) {
                carreras[ cantCarreras ] = carrera ;
                
                cantCarreras++ ;
            } else {
                System.out.println( "No se pueden agregar más carreras" ) ;
            }
        }
    //

    @Override
    public String toString() {
        String texto ;

        texto = ( "CARRERAS:" ) ;

        for ( int numCarrera = 0 ; numCarrera < cantCarreras ; numCarrera++ ) {
            texto += "\n    " + carreras[ numCarrera ].toString() ;
        }
        
        return texto ;
    }
}