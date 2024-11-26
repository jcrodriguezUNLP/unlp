import java.util.Scanner ;

public class Jugador extends Persona {
    private int numPartidosJugados ;
    private int numGolesAnotados   ;
    
    private Scanner in = new Scanner( System.in ) ;
    
    // constructores
        public Jugador() {}
        
        public Jugador( String nombre , int dni , int edad , int numPartidosJugados , int numGolesAnotados ) {
            super( nombre , dni , edad ) ;
            
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
        public double sueldoACobrar() {
            int adicional = 0 ;
            
            if ( 10 < numGolesAnotados ) {
                adicional = 50000 ;
            }else
            if ( (5 <= numGolesAnotados) && (numGolesAnotados <= 10) ) {
                adicional = 30000 ;
            }else
            if ( 1 <= numGolesAnotados ) {
                adicional = 5000 ;
            }
        
            return ( numPartidosJugados + adicional ) ;
        }
    //
       
    @Override
    public String toString () {
        return ( "Nombre: " + getNombre() + ", numPartidosJugados " + numPartidosJugados + " numGolesAnotados " + numGolesAnotados + " Sueldo " + sueldoACobrar() ) ;
    }
}