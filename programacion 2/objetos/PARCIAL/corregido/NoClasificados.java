public class NoClasificados extends Piloto {
    private int mejorPuesto ;

    // constructores
        public NoClasificados( String nombre , String apellido , int rankingMundial , int mejorPuesto ) {
            super( nombre , apellido , rankingMundial ) ;

            this.mejorPuesto = mejorPuesto ;
        }
    //

    // Metodos
        @Override
        public int calcularPuntos( int clasificacion ) {
            int puntos = 0 ;

            if ( mejorPuesto <= 5 ) {
                puntos += 1 ;
            }
            
            return puntos ;
        }        
    //

    @Override
    public String toString() {
        String texto ;

        texto = ( super.toString() + "\n                mejorPuesto: " + mejorPuesto ) ;
        
        return texto ;
    }
}