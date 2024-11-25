package package PARCIAL.enClase ;

public class Carrera {
    private String lugar ; 
    private Piloto[] pilotos ;

    // Constructores
        public Carrera() {}

        public Carrera( String lugar , Piloto[] pilotos ) {
            this.lugar = lugar ;
            this.pilotos = pilotos ;
        }
    //

    // Getters
        public String getLugar() { return( lugar ) ; }

        public Piloto[] getPilotos() { return( pilotos ) ; }
    //

    // Setters
        public void setLugar( String lugar ) { this.lugar = lugar ; }

        public void setPilotos( Piloto[] pilotos ) { this.pilotos = pilotos ; }
    //

    @Override
    public String toString() {
        String texto = "" ;
        texto += ( "\n    lugar: " + lugar ) ;
        texto += ( "\n    pilotos: " + pilotos ) ;
        return( texto ) ;
    }
}