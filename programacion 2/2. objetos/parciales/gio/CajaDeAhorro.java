public class CajaDeAhorro extends CuentaBancaria {
    private boolean plazoFijoConstituido ;
    private int cantTarjetasCredito ;
    private Transaccion[] transacciones ;

    private int MAX_TRANSACCIONES  ;
    private int cantTransacciones ;

    // Constructores
        public CajaDeAhorro() {}

        public CajaDeAhorro( int numCuenta , int CBU , String alias , double dinero , Propietario propietario , boolean plazoFijoConstituido , int cantTarjetasCredito ) {
            super( numCuenta , CBU , alias , dinero , propietario ) ;
            this.plazoFijoConstituido = plazoFijoConstituido ;
            this.cantTarjetasCredito = cantTarjetasCredito ;

            cantTransacciones = 0 ;
            MAX_TRANSACCIONES = 5 ;

            transacciones = new Transaccion[ MAX_TRANSACCIONES ] ;
        }
    //

    // Getters
        public boolean getPlazoFijoConstituido() { return plazoFijoConstituido ; }

        public int getCantTarjetasCredito() { return cantTarjetasCredito ; }

        public Transaccion[] getTransacciones() { return transacciones ; }


        public int getMAX_TRANSACCIONES() { return MAX_TRANSACCIONES ; }
        public int getCantTransacciones() { return cantTransacciones ; }
    //

    // Setters
        public void setPlazoFijoConstituido( boolean plazoFijoConstituido ) { this.plazoFijoConstituido = plazoFijoConstituido ; }

        public void setCantTarjetasCredito( int cantTarjetasCredito ) { this.cantTarjetasCredito = cantTarjetasCredito ; }

        public void setTransacciones( Transaccion[] transacciones ) { this.transacciones = transacciones ; }


        public void setMAX_TRANSACCIONES( int MAX_TRANSACCIONES ) { this.MAX_TRANSACCIONES = MAX_TRANSACCIONES ; }
        public void setCantTransacciones( int cantTransacciones ) { this.cantTransacciones = cantTransacciones ; }
    //

    // Métodos
        public void agregarTransaccion( Transaccion transaccion ) {
            if( cantTransacciones < MAX_TRANSACCIONES ) {
                transacciones[ cantTransacciones ] = transaccion ;

                cantTransacciones++ ;
            }
        }


        @Override
        public double costoMensual() {
            int i ;

            double dinero = super.getDinero() ;
            double costo = 0 ;

            if ( plazoFijoConstituido ) {
                costo += ( dinero * 0.02 ) ;
            }

            if ( cantTarjetasCredito == 1 ) {
                costo += 1000 ;
            } else if ( cantTarjetasCredito == 2 ) {
                costo += 1800 ;
            }

            for ( i = 0 ; i < 5 ; i++ ) {
                if( transacciones[ i ].getConcepto().equals( "DEB.CPRA.VTA" ) ) {
                    double monto = transacciones[ i ].getMonto() ;  

                    costo += ( monto * 0.30 ) ;
                    costo += ( monto * 0.35 ) ;
                }
            }

            return( costo ) ;
        } ;

        @Override
        public String toString() {
            String texto = "" ;

            texto += ( super.toString() ) ;
            texto += ( "Sangria.sangria( 1 ) plazoFijoConstituido: " + plazoFijoConstituido ) ;     
            texto += ( "Sangria.sangria( 1 ) cantTarjetasCredito: " + cantTarjetasCredito ) ;       
            texto += ( "Sangria.sangria( 1 ) transacciones: " + transacciones ) ;

            return( texto ) ;
        }
    //
}