public class Carrera {
    private String lugar ;
    private Piloto[] pilotos ;
    
    int cantPilotos = 0 ;

    // constructores
        public Carrera() {
            pilotos = new Piloto[ 10 ] ;
        }

        public Carrera( String lugar ) {
            this.lugar = lugar ;
            
            pilotos = new Piloto[ 10 ] ;
        }
    //

    // Getters
        public String getLugar() { return lugar ; }

        public Piloto[] getPilotos() { return pilotos ; }
    //

    // Setters
        public void setLugar( String lugar ) { this.lugar = lugar ; }

        public void setPilotos( Piloto[] pilotos ) { this.pilotos = pilotos ; }
    //
    
    //
        public void agregarPiloto( Piloto piloto ) {
            if( cantPilotos < 10 ) {
                pilotos[ cantPilotos ] = piloto ;
                
                cantPilotos++ ;
            } else {
                System.out.println( "No se pueden agregar más pilotos" ) ;
            }
        }
    //

    @Override
    public String toString() {
        return( "lugar: " + lugar + " | pilotos: " + pilotos ) ;
    }
}