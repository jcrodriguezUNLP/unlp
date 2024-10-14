public abstract class Localidad {
    private String identificador ;
    private int numButaca ;
    private int numFila ;
    private String platea ;
    private String metodoPago ;
    private Persona comprador ;

    // constructores
        public Localidad() {}

        public Localidad( String identificador , int numButaca, int numFila , String platea , String metodoPago , Persona comprador ) {
            this.identificador = identificador ;
            this.numButaca = numButaca ;
            this.numFila = numFila ;
            this.platea = platea ;
            this.metodoPago = metodoPago ;
            this.comprador = comprador ;
        }
    //
    
    // getters
        public String getIdentificador() { return identificador ; }
    
        public int getNumButaca() { return numButaca ; }
        
        public int getNumFila() { return numFila ; }
        
        public String getPlatea() { return platea ; }
        
        public String getMetodoPago() { return metodoPago ; }
        
        public Persona getComprador() { return comprador ; }
    //
    
    // setters
        public void setIdentificador( String identificador ) { this.identificador = identificador ; }
    
        public void setNumButaca( int numButaca ) { this.numButaca = numButaca ; }
        
        public void setNumFila( int numFila ) { this.numFila = numFila ; }
        
        public void setPlatea( String platea ) { this.platea = platea ; }
        
        public void setMetodoPago( String metodoPago ) { this.metodoPago = metodoPago ; }
        
        public void setComprador( Persona comprador ) { this.comprador = comprador ; }
    //
    
    // metodos
    //
       
    @Override
    public String toString () {
        return ( "LOCALIDAD: " + "Identificador: " + identificador + " | NumButaca: " + numButaca + " | NumFila: " + numFila + " | Platea: " + platea + " | MetodoPago: " + metodoPago + " || PERSONA: " + comprador.toString() ) ;
    }
}