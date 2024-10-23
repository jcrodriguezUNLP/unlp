public class Carrera {
    private String lugar ;
    private Piloto[] pilotos ;
    
    // numero maximo de pilotos por carrera
    private int MAX_PILOTOS ;

    // constructores
        public Carrera( String lugar ) {
            // son 10 pero pongo 2 para ejecutar mas rapido
            MAX_PILOTOS = 10 ;

            this.lugar = lugar ;
            
            pilotos = new Piloto[ MAX_PILOTOS ] ;
        }
    //

    // Getters
        public int getMAX_PILOTOS() { return MAX_PILOTOS ; }
    //
    
    // Metodos
        public void agregarPiloto( Piloto piloto , int clasificacion ) {
            // siempre se ingrasan los 10 pilotos ordenados por clasificacion
            pilotos[ (clasificacion - 1) ] = piloto ;
        }

         public int obtenerPuntosPorLugar() {
            int puntos = 0 ;
            
            if ( lugar.equals( "Japón" ) || lugar.equals( "China" ) ) {
                puntos += 3 ;
            } else {
                if ( lugar.equals( "Bélgica" ) || lugar.equals( "Hungría" ) ) {
                    puntos += 1 ;
                }
            }
            
            return puntos ;
        }
    //

    @Override
    public String toString() {
        String texto ;
        int puntos ;

        int clasificacion ;

        int puntosLugar = obtenerPuntosPorLugar() ;

        texto = ( "CARRERA:" + "\n        lugar: " + lugar + "\n        pilotos:" ) ;

        for ( clasificacion = 1 ; clasificacion <= MAX_PILOTOS ; clasificacion++ ) {
            puntos = pilotos[ (clasificacion - 1) ].calcularPuntos( clasificacion ) ;

            puntos += puntosLugar ;

            texto += "\n    " + pilotos[ (clasificacion - 1) ].toString() ;
            texto += "\n            puntos: " + puntos ;
        }

        return texto ;
    }
}