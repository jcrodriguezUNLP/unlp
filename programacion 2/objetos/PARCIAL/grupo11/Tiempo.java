public class Tiempo {
    private int horas ;
    private int minutos ;

    // constructores
        public Tiempo() {}

        public Tiempo( int horas , int minutos ) {
            this.horas = horas ;
            this.minutos = minutos ;
        }
    //

    // Getters
        public int getHoras() { return horas ; }

        public int getMinutos() { return minutos ; }
    //

    // Setters
        public void setHoras( int horas ) { this.horas = horas ; }

        public void setMinutos( int minutos ) { this.minutos = minutos ; }
    //

    @Override
    public String toString() {
        return( "horas: " + horas + " | minutos: " + minutos ) ;
    }
}