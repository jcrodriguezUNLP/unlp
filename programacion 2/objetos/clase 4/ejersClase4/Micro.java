public class Micro {
    private String    patente    ;
    private String    destino    ;
    private String    horaSalida ;
    private boolean[] asientos   ;

    private int cantAsientos = 20 ;
    private int cantOcupados = 0  ;

    // constructores
        public Micro() {
            asientos = new boolean[ cantAsientos ] ; // array de booleanos se inicializa solo en false
        }

        // sin pasajeros
        public Micro( String patente, String destino , String horaSalida ) {
            this.patente    = patente    ;
            this.destino    = destino    ;
            this.horaSalida = horaSalida ;

            asientos = new boolean[ cantAsientos ] ; // array de booleanos se inicializa solo en false
        }
    //
    
    // getters
        public String    getPatente    () { return patente    ; }
        public String    getDestino    () { return destino    ; }
        public String    getHoraSalida () { return horaSalida ; }
        public boolean[] getAsientos   () { return asientos   ; }
    //
    
    // setters
        public void setPatente    ( String patente                     ) { this.patente            = patente    ; }
        public void setDestino    ( String destino                     ) { this.destino            = destino    ; }
        public void setHoraSalida ( String horaSalida                  ) { this.horaSalida         = horaSalida ; }
        public void setAsiento    ( int    asiento    , boolean estado ) { asientos[ asiento - 1 ] = estado     ; }
    //
    
    // metodos
        public int cantAsientosOcupados() { return cantOcupados ; }

        public boolean microLleno() { return( cantAsientos == cantOcupados ) ; }
        public boolean microVacio() { return( 0            == cantOcupados ) ; }

        public boolean existeAsiento ( int asiento ) { return( (0 < asiento ) && (asiento <= cantAsientos) ) ; }
        
        public boolean asientoLibre  ( int asiento ) { return( !asientos[ (asiento - 1) ] ) ; }

        public void ocuparAsiento  ( int asiento ) { setAsiento( asiento , true  ) ; cantOcupados++ ; }
        public void liberarAsiento ( int asiento ) { setAsiento( asiento , false ) ; cantOcupados-- ; }

        public int numeroPrimerAsientoLibre() {
            int asiento = 0 ;

            while ( asientos[ asiento ] == true ) {
                asiento++ ;                
            }

            return( asiento + 1 ) ;
        }
    //
       
    @Override
    public String toString () {
        return ( "Patente: " + patente + " Destino: " + destino + " Hora de Salida: " + horaSalida + " Cantidad de Asientos: " + cantAsientos + " Cantidad de Asientos Ocupados: " + cantOcupados ) ;
    }
}