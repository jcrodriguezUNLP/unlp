import java.util.Scanner ;

public class Main {
    public static void main( String[] args ) {
        Scanner in = new Scanner( System.in ) ;
        
        int opcion ;
        
        int cantCarreras = 5 ;
        
        Carrera[] carreras = new Carrera[ cantCarreras ] ;
        
        do {
            // Mostrar el menú
            System.out.println( "\nMENU PRINCIPAL:" ) ;
            System.out.println( "1. Cargar Show" ) ;
            System.out.println( "2. Calcular Costo" ) ;
            System.out.println( "3. imprimir Show" ) ;
            System.out.println( "4. crear show test" ) ;
            System.out.println( "5. Salir" ) ;
            System.out.print( "Seleccione una opción: " ) ;
            opcion = in.nextInt() ;
            in.nextLine() ; // Consumir el salto de línea

            switch (opcion) {
                case 1: // Cargar Carreras
                    System.out.println( "\ncarrera" ) ;

                    System.out.print( "    Ingrese numCarrera( int ): " ) ;
                    int numCarrera = in.nextInt() ;

                    
                    System.out.print( "    Ingrese lugar( String ): " ) ;
                    String lugar = in.nextLine() ;
                    
                    Carrera carrera = new Carrera( lugar ) ;

                    // PILOTOS
                        System.out.println( "    PILOTOS" ) ;

                        int numPiloto = 1 ;
                        
                        Piloto piloto ;

                        do {
                            System.out.println( "        piloto N°" + numPiloto + ":" ) ;
                            
                            System.out.print( "            Ingrese nombre( String ): " ) ;
                            String nombre = in.nextLine() ;

                            System.out.print( "            Ingrese apellido( String ): " ) ;
                            String apellido = in.nextLine() ;
                            in.nextLine() ; // Consumir el salto de línea
                            
                            System.out.print( "            Ingrese rankingMundial( int ): " ) ;
                            int rankingMundial = in.nextInt() ;

                            System.out.print( "            Ingrese clasificacion( 1..10 ): " ) ;
                            int clasificacion = in.nextInt() ;
                            
                            if ( clasificacion <= 5 ){
                                System.out.print( "            Ingrese horas( 0..23 ): " ) ;
                                int horas = in.nextInt() ;
                                
                                System.out.print( "            Ingrese minutos( 0..59 ): " ) ;
                                int minutos = in.nextInt() ;
                                
                                Tiempo tiempo = new Tiempo( horas , minutos ) ;
                                
                                piloto = new Clasificados( nombre , apellido , clasificacion , rankingMundial , tiempo ) ;
                            } else {
                                piloto = new NoClasificados( nombre , apellido , clasificacion , rankingMundial ) ;
                            }

                            carrera.agregarPiloto( piloto ) ;
                        } while ( numPiloto <= 10 ) ;
                    //

                break ;
                
                case 2: // imprimir carreras
                    carreras.imprimirCarreras() ;
                break ;

                case 3: // Salir
                
                    System.out.println("Saliendo...") ;
                break ;

                default:
                    System.out.println("Opción no válida. Intente nuevamente.") ;
                break ;
            }

        } while( opcion != 3 ) ;

        in.close() ; // Cerrar el Scanner
    }
}