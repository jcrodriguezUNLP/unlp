public class Clasificados extends Piloto {
    private Tiempo tiempo ;

    // constructores
        public Clasificados( String nombre , String apellido , int rankingMundial , Tiempo tiempo ) {
            super( nombre , apellido , rankingMundial ) ;
            
            this.tiempo = tiempo ;
        }
    //
    
    // Metodos
        @Override
        public int calcularPuntos( int clasificacion ) {
            int puntos = 0 ;

            puntos += TablaPuntajesF1.obtenerPuntaje( clasificacion ) ; 

            int horas = tiempo.getHoras() ;
            int minutos = tiempo.getMinutos() ;
                    
            if ( horas == 1 ) {
                if ( minutos <= 8 ) {
                    if ( (0 <= minutos) && (minutos < 5) ) {
                        puntos += 2 ;
                    } else {
                        puntos += 1 ;
                    }
                }
            }
                     
            return( puntos ) ;        
        }
    //

    @Override
    public String toString() {
        String texto ;

        texto = ( super.toString() + "\n                tiempo: " + tiempo.toString() ) ;
        
        return( texto ) ;
    }
}