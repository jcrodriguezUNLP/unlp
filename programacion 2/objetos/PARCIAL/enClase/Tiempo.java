package PARCIAL.enClase;

public class Tiempo {
    private int hora ; 
    private int minuto ;

    // Constructores
        public Tiempo() {}

        public Tiempo( int hora , int minuto ) {
            this.hora = hora ;
            this.minuto = minuto ;
        }
    //

    // Getters
        public int getHora() { return( hora ) ; }

        public int getMinuto() { return( minuto ) ; }
    //

    // Setters
        public void setHora( int hora ) { this.hora = hora ; }

        public void setMinuto( int minuto ) { this.minuto = minuto ; }
    //

    @Override
    public String toString() {
        String texto = "" ;
        texto += ( "\n    hora: " + hora ) ;
        texto += ( "\n    minuto: " + minuto ) ;
        return( texto ) ;
    }
}