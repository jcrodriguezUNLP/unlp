public class Transaccion {
    private double monto ;
    private String concepto ;

    // Constructores
        public Transaccion() {}

        public Transaccion( double monto , String concepto ) {
            this.monto = monto ;
            this.concepto = concepto ;
        }
    //

    // Getters
        public double getMonto() { return monto ; }

        public String getConcepto() { return concepto ; }
    //

    // Setters
        public void setMonto( double monto ) { this.monto = monto ; }

        public void setConcepto( String concepto ) { this.concepto = concepto ; }
    //

    // Métodos
        @Override
        public String toString() {
            String texto = "" ;

            texto += ( "Sangria.sangria( 1 ) monto: " + monto ) ;
            texto += ( "Sangria.sangria( 1 ) concepto: " + concepto ) ;

            return( texto ) ;
        }
    //
}