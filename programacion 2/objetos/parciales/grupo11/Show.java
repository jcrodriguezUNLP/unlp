public class Show {
    private int numShow ;
    private Fecha fecha ;
    private boolean soldOut ;
    private Localidad[] localidades ;

    private int cantLocalidades = 10 ;
    private int cantOCupadas = 0 ;

    // constructores
        public Show() {
            localidades = new Localidad[ cantLocalidades ] ; // array se inicializa solo en null
        }
        
        public Show( int numShow, Fecha fecha , boolean soldOut ) {
            this.numShow = numShow ;
            this.fecha = fecha ;
            this.soldOut = soldOut ;

            localidades = new Localidad[ cantLocalidades ] ; // array se inicializa solo en null
        }
    //
    
    // getters
        public int getNumShow() { return numShow ; }
        
        public Fecha getFecha() { return fecha ; }
        
        public boolean getSoldOut() { return soldOut ; }
        
        public Localidad[] getLocalidades() { return localidades ; }

        public int getCantLocalidades() { return cantLocalidades ; }

        public int getCantOCupadas() { return cantOCupadas ; }
    //
    
    // setters
        public void setNumShow( int numShow ) { this.numShow = numShow ; }
        
        public void setFecha( Fecha fecha ) { this.fecha = fecha ; }
        
        public void setSoldOut( boolean soldOut ) { this.soldOut = soldOut ; }
        
        public void setLocalidad( int numLocalidad , Localidad localidad ) { localidades[ (numLocalidad - 1) ] = localidad ; }
    //
    
    // metodos
        public void agregarLocalidad( Localidad localidad ) {
            if( cantOCupadas < cantLocalidades ) {
                localidades[ cantOCupadas ] = localidad ;
                
                cantOCupadas++ ;
            } else {
                System.out.println( "No se pueden agregar más localidades" ) ;
            }
        }

        public double calcularMontoTotal() {
            double montoTotal = 0 ;
            Localidad localidad ;
            int numLocalidad = 0 ;

            Vip vip ;
            Comun comun ;

            while ( numLocalidad < cantOCupadas ) {
                localidad = localidades[ numLocalidad ] ;

                double precioBase = PrecioPorFilayPorPlatea.obtenerPrecioBaseEntrada( localidad.getNumFila() , localidad.getPlatea() ) ;
                double montoFinal = precioBase ;

                if ( localidad.getIdentificador().equals( "vip" ) ) {
                    vip = (Vip) localidad ;

                    if ( vip.getExperienciaEspecial()) { montoFinal += vip.getCosto() ; }
                    
                    if ( vip.getNumButaca() <= 5 ) { montoFinal += precioBase * 0.15 ; }
                    
                    if ( vip.getMetodoPago().equals("tarjeta de crédito") ) {
                        montoFinal += montoFinal * 0.10 ;
                    } else {
                        montoFinal -= montoFinal * 0.05 ;
                    }

                } else {
                    comun = (Comun) localidad ;

                    if ( comun.getTipoEntrada().equals("física") ) {
                        montoFinal += comun.getCostoImpresion() ;
                    } else {
                        montoFinal += 2400 ;
                    }

                    if ( comun.getMetodoPago().equals("tarjeta de crédito") ) {
                        montoFinal += montoFinal * 0.08 ;
                    } else {
                        montoFinal -= montoFinal * 0.025 ;
                    }
                }

                if ( ((fecha.getDia() == 3) || (fecha.getDia() == 4)) && (fecha.getMes() == 8) && (fecha.getAño() == 2023) ) {
                    montoFinal -= montoFinal * 0.035 ;
                }

                montoTotal += montoFinal ;

                numLocalidad++ ;
            }

            return montoTotal ;
        }

        public void imprimirInformacion() {
            Localidad localidad ;
            int numLocalidad = 0 ;
            
            System.out.println( "\nInformación del Show:" ) ;
            System.out.println( "Número de Show: " + numShow ) ;
            System.out.println( "Fecha: " + fecha ) ;
            System.out.println( "¿Sold Out?: " + (soldOut ? "Sí" : "No") ) ;

            System.out.println( "Localidades Vendidas:" ) ;

            while ( numLocalidad < cantOCupadas ) {
                localidad = localidades[ numLocalidad ] ;

                System.out.println( "    " + localidad.toString() );

                numLocalidad++ ;
            }

            System.out.printf("Monto Total: %.2f\n", calcularMontoTotal() ) ;
        }
    //
       
    public String toString () {
        return ( "NumShow: " + numShow + " Fecha: " + fecha.toString() + " SoldOut: " + soldOut ) ;
    }
}