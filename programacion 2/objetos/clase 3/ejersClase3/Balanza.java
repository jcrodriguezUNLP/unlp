public class Balanza {
    private double monto    ;
    private int    cantidad ;

    // constructores
        public Balanza() {}
        
        public Balanza( double monto , int cantodad ) {
            this.monto    = monto    ;
            this.cantidad = cantidad ;
        }
    //

    //getters
        public double getMonto () { return monto    ; }
        public int    cantidad () { return cantidad ; }
    //
    
    //setters
        public void setMonto    ( double monto    ) { this.monto    = monto    ; }
        public void setCantidad ( int    cantidad ) { this.cantidad = cantidad ; }
    //
    
    //metodos
        public void iniciarCompra() {
            monto    = 0 ;
            cantidad = 0 ;
        }
        
        public void registrarProducto( double pesoEnKG , double precioPorKG ) {
            monto = ( monto + (pesoEnKG * precioPorKG) ) ;
            
            cantidad++ ;
        }
        
        public double devolverMontoAPagar() { return monto ; }
        
        public String devolverResumenDeCompra() {
            return ( "Cantidad de productos: " + cantidad + ", monto: $" + monto ) ;
        }
    //
}