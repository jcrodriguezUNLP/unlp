public class Carreras {
    private Carrera[] carreras ;

    private int cantCarreras = 0 ;
    
    private int MAX_CARRERAS = 2 ;

    // constructores
        public Carreras() {
            this.carreras = new Carrera[ MAX_CARRERAS ] ;
        }

        public Carreras( Carrera[] carreras  ) {
            this.carreras = carreras ;
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

            Clasificados clasificado ;
            NoClasificados noClasificado ;

            for ( i = 0 ; i < cantCarreras ; i++ ) {
                carrera = carreras[ i ] ;
                
                puntosTotales += obtenerPuntosPorLugar( carrera ) ;
                
                pilotos = carrera.getPilotos() ;
                
                for ( j = 0 ; j < carrera.getCantPilotos() ; j++ ){                    
                    piloto = pilotos[ j ] ;
                    
                    puntosPiloto = 0 ;
                    
                    if ( piloto.getClasificacion() <= 5 ) {
                        clasificado = (Clasificados) piloto ;
                        
                        puntosPiloto += clasificado.calcularPuntos() ;
                    } else {
                        noClasificado = (NoClasificados) piloto ;
                        
                        puntosPiloto += noClasificado.calcularPuntos() ;
                    }
                    
                    puntosPiloto += obtenerPuntosPorLugar( carrera ) ;
                    
                    puntosTotales += puntosPiloto ;
                }
            }
            
            return( puntosTotales ) ;
        }
        
        public void imprimirCarreras() {
            Carrera carrera ;
            int i ;
            int j ;
            
            for ( i = 0 ; i < cantCarreras ; i++ ) {
                carrera = carreras[ i ] ;
                
                System.out.println( "\ncarrera N°" + (i + 1) ) ;
                
                System.out.println( "    Lugar de la carrera: " + carrera.getLugar() ) ;
                
                for ( j = 0 ; j < carrera.getCantPilotos() ; j++ ){                    
                    Piloto piloto = carrera.getPilotos()[ j ] ;
                    
                    int puntosPiloto = 0 ;
                    
                    System.out.println( "    piloto N°" + (j + 1) ) ;
                
                    System.out.println( "        nombre: " + piloto.getNombre() ) ;
                    System.out.println( "        apellido: " + piloto.getApellido() ) ;
                    System.out.println( "        rankingMundial: " + piloto.getRankingMundial() ) ;
                    System.out.println( "        clasificacion: " + piloto.getClasificacion() ) ;
                    
                    if ( piloto.getClasificacion() <= 5 ) {
                        Clasificados clasificado = (Clasificados) piloto ;
                        
                        puntosPiloto += clasificado.calcularPuntos() ;
                    } else {
                        NoClasificados noClasificado = (NoClasificados) piloto ;
                        
                        puntosPiloto += noClasificado.calcularPuntos() ;
                    }
                    
                    puntosPiloto += obtenerPuntosPorLugar( carrera ) ;
                    
                    System.out.println( "        puntos: " + puntosPiloto ) ;
                }
            }
        }
    //

    @Override
    public String toString() {
        return( "Carreras: " + carreras + " | cantCarreras: " + cantCarreras ) ;
    }
}