public class Carreras {
    private Carrera[] carreras ;
    private int cantCarreras ;

    // constructores
        public Carreras() {}

        public Carreras( Carrera[] carreras , int cantCarreras ) {
            this.carreras = carreras ;
            this.cantCarreras = cantCarreras ;
        }
    //

    // Getters
        public Carrera[] getCarreras() { return carreras ; }

        public int getCantCarreras() { return cantCarreras ; }
    //

    // Setters
        public void setCarreras( Carrera[] carreras ) { this.carreras = carreras ; }

        public void setCantCarreras( int cantCarreras ) { this.cantCarreras = cantCarreras ; }
    //
    
    // metodos
        public int obtenerPuntosPorLugar( Carrera carrera ) {
            int puntosTotales = 0 ;
            
            String lugar = carrera.getLugar() ;
            
            if ( (lugar == "Japón") && (lugar == "China") ) {
                puntosTotales += 3 ;
            } else {
                if ( (lugar == "Bélgica") && (lugar == "Hungría") ) {
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
            
            for ( i = 0 ; i < cantCarreras ; i++ ) {
                carrera = carreras[ i ] ;
                
                puntosTotales += obtenerPuntosPorLugar( carrera ) ;
                
                pilotos = carrera.getPilotos() ;
                
                for ( j = 0 ; j < 10 ; j++ ){                    
                    Piloto piloto = pilotos[ j ] ;
                    
                    int clasificacion = piloto.getClasificacion() ;
                    
                    puntosTotales = TablaPuntajesF1.obtenerPuntaje( clasificacion ) ;
                                        
                    if ( piloto.getClasificacion() <= 5 ) {
                        Clasificados clasificado = (Clasificados) piloto ;
                        
                        puntosTotales += clasificado.calcularPuntos() ;
                    } else {
                        NoClasificados noClasificado = (NoClasificados) piloto ;
                        
                        puntosTotales += noClasificado.obtenerPuntos() ;
                    }
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
                
                System.out.println( "\ncarrera N°" + i ) ;
                
                System.out.println( "    Lugar de la carrera: " + carrera.getLugar() ) ;
                
                for ( j = 0 ; j < 10 ; j++ ){                    
                    Piloto piloto = pilotos[ j ] ;
                    
                    int puntosPiloto = 0 ;
                    
                    System.out.println( "piloto N°" + j ) ;
                
                    System.out.println( "    nombre: " + piloto.getNombre() ) ;
                    System.out.println( "    apellido: " + piloto.getApellido() ) ;
                    System.out.println( "    rankingMundial: " + piloto.getRankingMundial() ) ;
                    System.out.println( "    clasificacion: " + piloto.getclasificacion() ) ;
                    
                    if ( piloto.getClasificacion() <= 5 ) {
                        Clasificados clasificado = (Clasificados) piloto ;
                        
                        puntosPiloto += clasificado.calcularPuntos() ;
                    } else {
                        NoClasificados noClasificado = (NoClasificados) piloto ;
                        
                        puntosPiloto += noClasificado.obtenerPuntos() ;
                    }
                    
                    puntosPiloto += obtenerPuntosPorLugar( carrera ) ;
                    
                    System.out.println( "    puntos: " + puntosPiloto ) ;
                }
            }
        }
    //

    @Override
    public String toString() {
        return( "Carreras: " + carreras + " | cantCarreras: " + cantCarreras ) ;
    }
}