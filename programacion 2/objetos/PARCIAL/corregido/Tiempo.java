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

    @Override
    public String toString() {
        return( "\n                    horas: " + horas + "\n                    minutos: " + minutos ) ;
    }
}