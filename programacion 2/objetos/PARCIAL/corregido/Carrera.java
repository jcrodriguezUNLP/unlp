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
        public String getLugar() { return lugar ; }

        public Piloto[] getPilotos() { return pilotos ; }

        public int getMAX_PILOTOS() { return MAX_PILOTOS ; }
    //
    
    // Metodos
        public void agregarPiloto( Piloto piloto , int clasificacion ) {
            // siempre se ingrasan los 10 pilotos ordenados por clasificacion
            pilotos[ (clasificacion - 1) ] = piloto ;
        }
    //

    @Override
    public String toString() {
        String texto ;

        texto = ( "CARRERA:" + "\n        lugar: " + lugar + "\n        pilotos:" ) ;

        for ( int i = 0 ; i < MAX_PILOTOS ; i++ ) {
            texto += "\n    " + pilotos[ i ].toString() ;
            texto += "\n            puntos: " + pilotos[ i ].calcularPuntos( i + 1 ) ;
        }

        return texto ;
    }
}