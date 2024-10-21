public class NoClasificados extends Piloto {
    private int mejorPuesto ;

    // constructores
        public NoClasificados() {}
        
        public NoClasificados( String nombre , String apellido , int clasificacion , int rankingMundial ) {
            super( nombre , apellido , clasificacion , rankingMundial ) ;
            
            if ( clasificacion < this.mejorPuesto ) {
                this.mejorPuesto = clasificacion ;
            }
        }
    //

    // Getters
        public int getMejorPuesto() { return mejorPuesto ; }
    //

    // Setters
        public void setMejorPuesto( int mejorPuesto ) { this.mejorPuesto = mejorPuesto ; }
    //
    
    //
        public int obtenerPuntos() {
            int puntosTotales = 0 ;
            
            if ( mejorPuesto <= 5 ) {
                puntosTotales += 1 ;
            }
            
            return puntosTotales ;
        }
    //

    @Override
    public String toString() {
        return( "mejorPuesto: " + mejorPuesto ) ;
    }
}