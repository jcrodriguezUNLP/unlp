public class Carrera {
    private String lugar ;
    private Piloto[] pilotos ;
    
    private int cantPilotos = 0 ;
    
    private int MAX_PILOTOS = 2 ;

    // constructores
        public Carrera() {
            pilotos = new Piloto[ MAX_PILOTOS ] ;
        }

        public Carrera( String lugar ) {
            this.lugar = lugar ;
            
            pilotos = new Piloto[ MAX_PILOTOS ] ;
        }
    //

    // Getters
        public String getLugar() { return lugar ; }

        public Piloto[] getPilotos() { return pilotos ; }

        public int getCantPilotos() { return cantPilotos ; }

        public int getMAX_PILOTOS() { return MAX_PILOTOS ; }
    //

    // Setters
        public void setLugar( String lugar ) { this.lugar = lugar ; }

        public void setPilotos( Piloto[] pilotos ) { this.pilotos = pilotos ; }
    //
    
    //
        public void agregarPiloto( Piloto piloto ) {
            if( cantPilotos < MAX_PILOTOS ) {
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