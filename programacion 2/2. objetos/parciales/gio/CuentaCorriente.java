public class CuentaCorriente extends CuentaBancaria {
    private double limiteDescubierto ;
    private int cantChequesDepositados ;

    // Constructores
        public CuentaCorriente() {}

        public CuentaCorriente( int numCuenta , int CBU , String alias , double dinero , Propietario propietario , double limiteDescubierto , int cantChequesDepositados ) {
            super( numCuenta , CBU , alias , dinero , propietario ) ;
            this.limiteDescubierto = limiteDescubierto ;
            this.cantChequesDepositados = cantChequesDepositados ;
        }
    //

    // Getters
        public double getLimiteDescubierto() { return limiteDescubierto ; }

        public int getCantChequesDepositados() { return cantChequesDepositados ; }
    //

    // Setters
        public void setLimiteDescubierto( double limiteDescubierto ) { this.limiteDescubierto = limiteDescubierto ; }

        public void setCantChequesDepositados( int cantChequesDepositados ) { this.cantChequesDepositados = cantChequesDepositados ; }
    //

    // Métodos
        public double costoMensual() {
            double dinero = super.getDinero() ;
            double costo = 0 ;

            costo += ( dinero * 0.5 ) ;

            if ( 10 < cantChequesDepositados ) {
                costo += ( (dinero * 0.05) * cantChequesDepositados ) ;
            } else if ( cantChequesDepositados < 10 ) {
                costo += ( (dinero * 0.02) * cantChequesDepositados ) ;
            }

            return( costo ) ;
        } ;

        @Override
        public String toString() {
            String texto = "" ;

            texto += ( super.toString() ) ;
            texto += ( "Sangria.sangria( 1 ) limiteDescubierto: " + limiteDescubierto ) ;
            texto += ( "Sangria.sangria( 1 ) cantChequesDepositados: " + cantChequesDepositados ) ; 

            return( texto ) ;
        }
    //
}