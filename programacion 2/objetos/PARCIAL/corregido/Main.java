import java.util.Scanner ;

public class Main {
    public static void main( String[] args ) {
        Scanner in = new Scanner( System.in ) ;
        
        int opcion ;
                
        Carreras carreras = new Carreras() ;

        String lugar ;
        int numPiloto ;
        String nombre ;
        String apellido ;
        int rankingMundial ;
        int clasificacion ;
        int horas ;
        int minutos ;
        int mejorPuesto  ;
        
        do {// Mostrar el menú
            System.out.println( "\nMENU PRINCIPAL:" ) ; 
            System.out.println( "1. Cargar carrera" ) ;
            System.out.println( "2. imprimir carreras" ) ;
            System.out.println( "3. carreras automatico" ) ;
            System.out.println( "4. salir" ) ;
            System.out.print( "Seleccione una opción: " ) ;
            opcion = in.nextInt() ;
            in.nextLine() ; // Consumir el salto de línea

            switch (opcion) {
                case 1: // Cargar Carreras
                    if ( carreras.getMAX_CARRERAS() <= carreras.getCantCarreras() ) {
                        System.out.println( "No se pueden agregar más carreras" ) ;
                        break ;
                    }

                    System.out.println( "\nCARRERA" ) ;
        
                    System.out.print( "    Ingrese lugar( String ): " ) ;
                    lugar = in.nextLine() ;
                    
                    Carrera carrera = new Carrera( lugar ) ;

                    // PILOTOS
                        System.out.println( "    PILOTOS" ) ;

                        numPiloto = 1 ;
                        
                        do {
                            System.out.println( "        piloto N°" + numPiloto + ":" ) ;
                            
                            System.out.print( "            Ingrese nombre( String ): " ) ;
                            nombre = in.nextLine() ;

                            System.out.print( "            Ingrese apellido( String ): " ) ;
                            apellido = in.nextLine() ;
                            // in.nextLine() ; // Consumir el salto de línea
                            
                            System.out.print( "            Ingrese rankingMundial( int ): " ) ;
                            rankingMundial = in.nextInt() ;

                            System.out.print( "            Ingrese clasificacion( 1..10 ): " ) ;
                            clasificacion = in.nextInt() ;

                            Piloto piloto ;
                            
                            if ( clasificacion <= 5 ){
                                System.out.print( "            Ingrese horas( 0..23 ): " ) ;
                                horas = in.nextInt() ;
                                
                                System.out.print( "            Ingrese minutos( 0..59 ): " ) ;
                                minutos = in.nextInt() ;

                                in.nextLine() ; // Consumir el salto de línea
                                
                                Tiempo tiempo = new Tiempo( horas , minutos ) ;
                                
                                piloto = new Clasificados( nombre , apellido , rankingMundial , tiempo ) ;
                            } else {
                                System.out.print( "            Ingrese mejorPuesto( 1..10 ): " ) ;
                                mejorPuesto = in.nextInt() ;

                                piloto = new NoClasificados( nombre , apellido , rankingMundial , mejorPuesto) ;
                            }

                            carrera.agregarPiloto( piloto , clasificacion ) ;

                            numPiloto++ ;
                        } while ( numPiloto <= carrera.getMAX_PILOTOS() ) ;
                    //

                    carreras.agregarCarrera( carrera ) ;
                break ;
                
                case 2: // imprimir carreras
                    if ( carreras.getCantCarreras() == 0 ) {
                        System.out.println( "No hay carreras para mostrar" ) ;
                        break ;
                    }

                    System.out.println( carreras.toString() ) ;
                break ;

                case 3: // automatico
                    System.out.println( "\nCARRERA AUTOMÁTICA" ) ;

                    int numCarrera ;
        
                    for ( numCarrera = 1 ; numCarrera <= carreras.getMAX_CARRERAS() ; numCarrera++ ) {
                        Carrera carreraAuto = new Carrera( "China" ) ;
            
                        for ( clasificacion = 1 ; clasificacion <= carreraAuto.getMAX_PILOTOS() ; clasificacion++ ) {
                            nombre = "NombrePiloto" + clasificacion ;
                            apellido = "ApellidoPiloto" + clasificacion ;
                            rankingMundial = clasificacion ;

                            Piloto piloto ;
                            
                            if ( clasificacion <= 5 ) {
                                Tiempo tiempo = new Tiempo( 1 , clasificacion ) ;
                                piloto = new Clasificados( nombre , apellido , rankingMundial , tiempo ) ;
                            } else {
                                piloto = new NoClasificados( nombre , apellido , rankingMundial , clasificacion ) ;
                            }

                            carreraAuto.agregarPiloto( piloto , clasificacion ) ;
                        }

                        carreras.agregarCarrera( carreraAuto ) ;
                        System.out.println( "Carrera automática cargada." ) ;
                    }
                break ;


                case 4: // Salir
                    System.out.println("Saliendo...") ;
                break ;

                default:
                    System.out.println("Opción no válida. Intente nuevamente.") ;
                break ;
            }

        } while( opcion != 4 ) ;

        in.close() ; // Cerrar el Scanner
    }
}