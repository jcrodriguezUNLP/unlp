public class Jugador extends Persona {
    private int numPartidosJugados ;
    private int numGolesAnotados   ;
    
    // constructores
        public Jugador() {}
        
        public Jugador( String nombre , int dni , int edad , double sueldoBasico , int numPartidosJugados , int numGolesAnotados ) {
            super( nombre , dni , edad , sueldoBasico ) ;
            
            this.numPartidosJugados = numPartidosJugados ;
            this.numGolesAnotados   = numGolesAnotados   ;
        }
    //
    
    // getters
        public double getNumPartidosJugados () { return numPartidosJugados ; }
        public int    getNumGolesAnotados   () { return numGolesAnotados   ; }
    //
    
    // setters
        public void setnumPartidosJugados ( int numPartidosJugados ) { this.numPartidosJugados = numPartidosJugados ; }
        public void setnumGolesAnotados   ( int numGolesAnotados   ) { this.numGolesAnotados   = numGolesAnotados   ; }
    //
    
    // metodos
        public double calcularSueldoACobrar() {
            double promedioGoles ;
            double sueldo        ;

            sueldo = super.getSueldoBasico() ;

            promedioGoles = (double)( numGolesAnotados / numPartidosJugados ) ;

            if ( 0.5 < promedioGoles ) {
                sueldo *= 2 ;
            }
    
            return( sueldo ) ;
        }
    //
       
    public String toString () {
        return( "Jugador Nombre: " + super.getNombre() + " Sueldo " + calcularSueldoACobrar() ) ;
    }
}