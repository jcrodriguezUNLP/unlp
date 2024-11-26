public abstract class CuentaBancaria {
    private int numCuenta ;
    private int CBU ;
    private String alias ;
    private double dinero ;
    private Propietario propietario ;

    // Constructores
        public CuentaBancaria() {}

        public CuentaBancaria( int numCuenta , int CBU , String alias , double dinero , Propietario propietario ) {
            this.numCuenta = numCuenta ;
            this.CBU = CBU ;
            this.alias = alias ;
            this.dinero = dinero ;
            this.propietario = propietario ;
        }
    //

    // Getters
        public int getNumCuenta() { return numCuenta ; }

        public int getCBU() { return CBU ; }

        public String getAlias() { return alias ; }

        public double getDinero() { return dinero ; }

        public Propietario getPropietario() { return propietario ; }
    //

    // Setters
        public void setNumCuenta( int numCuenta ) { this.numCuenta = numCuenta ; }

        public void setCBU( int CBU ) { this.CBU = CBU ; }

        public void setAlias( String alias ) { this.alias = alias ; }

        public void setDinero( double dinero ) { this.dinero = dinero ; }

        public void setPropietario( Propietario propietario ) { this.propietario = propietario ; }  
    //

    // Métodos
        abstract public double costoMensual() ;

        @Override
        public String toString() {
            String texto = "" ;

            texto += ( "Sangria.sangria( 1 ) numCuenta: " + numCuenta ) ;
            texto += ( "Sangria.sangria( 1 ) CBU: " + CBU ) ;
            texto += ( "Sangria.sangria( 1 ) alias: " + alias ) ;
            texto += ( "Sangria.sangria( 1 ) dinero: " + dinero ) ;
            texto += ( "Sangria.sangria( 1 ) propietario: " + propietario ) ;

            return( texto ) ;
        }
    //
}