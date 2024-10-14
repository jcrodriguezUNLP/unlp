public class Comun extends Localidad {
    private String tipoEntrada ;
    private double costoImpresion ;

    // constructores
        public Comun() {}

        public Comun( int numButaca , int numFila , String platea , String metodoPago , Persona comprador , String tipoEntrada , double costoImpresion ) {
            super( "comun" , numButaca , numFila , platea , metodoPago , comprador ) ;
            
            this.tipoEntrada = tipoEntrada ;
            this.costoImpresion = costoImpresion ;
        }
    //
    
    // getters
        public String getTipoEntrada() { return tipoEntrada ; }
        
        public double getCostoImpresion() { return costoImpresion ; }
    //
    
    // setters
        public void setTipoEntrada( String tipoEntrada ) { this.tipoEntrada = tipoEntrada ; }
        
        public void setCostoImpresion( double costoImpresion ) { this.costoImpresion = costoImpresion ; }
    //
    
    // metodos
    //

    @Override
    public String toString () {
        return ( super.toString() + " || COMUN: " + "TipoEntrada: " + tipoEntrada + " | CostoImpresion: " + costoImpresion ) ;
    }
}