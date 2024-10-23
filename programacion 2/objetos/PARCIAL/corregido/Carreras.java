public class Carreras {
    private Carrera[] carreras ;

    private int cantCarreras ;
    
    private int MAX_CARRERAS ;

    // constructores
        public Carreras() {
            // DimL
            cantCarreras = 0 ;

            // son maximo 5 pero pongo 2 para ejecutar mas rapido
            MAX_CARRERAS = 5 ;

            this.carreras = new Carrera[ MAX_CARRERAS ] ;
        }
    //

    // Getters
        public Carrera[] getCarreras() { return carreras ; }

        public int getCantCarreras() { return cantCarreras ; }

        public int getMAX_CARRERAS() { return MAX_CARRERAS ; }
    //

    // Setters
        public void setCarreras( Carrera[] carreras ) { this.carreras = carreras ; }
    //
    
    // metodos
        public void agregarCarrera( Carrera carrera ) {
            if( cantCarreras < MAX_CARRERAS ) {
                carreras[ cantCarreras ] = carrera ;
                
                cantCarreras++ ;
            } else {
                System.out.println( "No se pueden agregar más carreras" ) ;
            }
        }

        public int obtenerPuntosPorLugar( Carrera carrera ) {
            int puntosTotales = 0 ;
            
            String lugar = carrera.getLugar() ;
            
            if ( lugar.equals( "Japón" ) || lugar.equals( "China" ) ) {
                puntosTotales += 3 ;
            } else {
                if ( lugar.equals( "Bélgica" ) || lugar.equals( "Hungría" ) ) {
                    puntosTotales += 1 ;
                }
            }
            
            return puntosTotales ;
        }

        public int obtenerPuntosTotales() {
            int puntosTotales = 0 ;
            
            int i ;
            int j ;
            
            Carrera carrera ;

            Piloto[] pilotos ;

            Piloto piloto ;
            int puntosPiloto ;

            for ( i = 0 ; i < cantCarreras ; i++ ) {
                carrera = carreras[ i ] ;
                
                puntosTotales += obtenerPuntosPorLugar( carrera ) ;
                
                pilotos = carrera.getPilotos() ;
                
                for ( j = 0 ; j < carrera.getMAX_PILOTOS() ; j++ ){                    
                    piloto = pilotos[ j ] ;
                    
                    puntosPiloto = 0 ;
                    
                    if ( i <= 5 ) {
                        puntosPiloto += piloto.calcularPuntos( i ) ;
                    } else {
                        puntosPiloto += piloto.calcularPuntos( i ) ;
                    }
                    
                    puntosPiloto += obtenerPuntosPorLugar( carrera ) ;
                    
                    puntosTotales += puntosPiloto ;
                }
            }
            
            return( puntosTotales ) ;
        }
    //

    @Override
    public String toString() {
        String texto ;

        texto = ( "CARRERAS:" ) ;

        for ( int i = 0 ; i < cantCarreras ; i++ ) {
            texto += "\n    " + carreras[ i ].toString() ;
        }
        
        return texto ;
    }
}