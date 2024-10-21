public class Clasificados extends Piloto {
    private Tiempo tiempo ;

    // constructores
        public Clasificados() {}

        public Clasificados( String nombre , String apellido , int clasificacion , int rankingMundial , Tiempo tiempo ) {
            super( nombre , apellido , clasificacion , rankingMundial ) ;
            
            this.tiempo = tiempo ;
        }
    //

    // Getters
        public Tiempo getTiempo() { return tiempo ; }
    //

    // Setters
        public void setTiempo( Tiempo tiempo ) { this.tiempo = tiempo ; }
    //
    
    //
        public int calcularPuntos() {
            int puntosTotales = 0 ;
            if ( super.getClasificacion() <= 5 ) {
                int horas = tiempo.getHoras() ;
                int minutos = tiempo.getMinutos() ;
                        
                if ( horas == 1 ) {
                    if ( minutos <= 8 ) {
                        if ( (0 <= minutos) && (minutos < 5) ) {
                            puntosTotales += 2 ;
                        } else {
                            puntosTotales += 1 ;
                        }
                    }
                }
            }
                      
            return puntosTotales ;        
        }
    //

    @Override
    public String toString() {
        return( "tiempo: " + tiempo ) ;
    }
}