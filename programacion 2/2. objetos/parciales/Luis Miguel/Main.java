import java.util.Scanner ;

public class Main {
    public static void main( String[] args ) {
        Scanner in = new Scanner( System.in ) ;
        
        int opcion = 0 ;

        // show
            Show show = null ;
            
            int numShow ;
            Fecha fecha ;
            // fecha
                int dia ;
                int mes = 8 ;
                int año ;
            //
            boolean soldOut ;
            Localidad localidad = null ;
            // localidad
                int numLocalidad ;
                
                String identificador ;
                // vip
                    boolean experienciaEspecial ;
                    double costo ;
                //
                // comun
                    String tipoEntrada ;
                    double costoImpresion ;
                //
                int numButaca ;
                int numFila ;
                String platea ;
                String metodoPago ;
                Persona comprador ;
                // comprador
                    int DNI ;
                    String apellido ;
                    String nombre ;
                //
            //

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
                case 1: // Cargar Show
                    System.out.println( "\nSHOW" ) ;

                    System.out.print( "    Ingrese numShow( int ): " ) ;
                    numShow = in.nextInt() ;
                    
                    // fecha
                        System.out.print( "    Ingrese dia( int ): " ) ;
                        dia = in.nextInt() ;
                        
                        System.out.print( "    Ingrese año( int ): " ) ;
                        año = in.nextInt() ;

                        fecha = new Fecha( dia , mes , año ) ;                    
                    //
                    
                    System.out.print( "    Ingrese soldOut( true/false ): " ) ;
                    soldOut = in.nextBoolean() ;

                    // localidades
                        System.out.println( "    LOCALIDADES" ) ;

                        numLocalidad = 1 ;

                        do {
                            System.out.println( "        localidad N°" + numLocalidad + ":" ) ;
                            
                            System.out.print( "            Ingrese numButaca( int ): " ) ;
                            numButaca = in.nextInt() ;

                            System.out.print( "            Ingrese numFila( 1..10 ): " ) ;
                            numFila = in.nextInt() ;
                            in.nextLine() ; // Consumir el salto de línea
                            
                            System.out.print( "            Ingrese platea( 'A'..'K' ): " ) ;
                            platea = in.nextLine() ;

                            System.out.print( "            Ingrese metodoPago( 'tajeta de credito/debito' ): " ) ;
                            metodoPago = in.nextLine() ;

                            // comprador
                                System.out.println( "            COMPRADOR" ) ;
                                
                                System.out.print( "                Ingrese DNI( int ): " ) ;
                                DNI = in.nextInt() ;
                                in.nextLine() ; // Consumir el salto de línea

                                
                                System.out.print( "                Ingrese apellido( String ): " ) ;
                                apellido = in.nextLine() ;
                                
                                System.out.print( "                Ingrese nombre( String ): " ) ;
                                nombre = in.nextLine() ;
                                
                                comprador = new Persona( DNI , apellido , nombre ) ;
                            //

                            show = new Show( numShow , fecha , soldOut ) ;


                            System.out.print( "            Ingrese identificador( vip/comun ): " ) ;
                            identificador = in.nextLine() ;

                            if ( identificador.equals( "comun" ) ) {
                                System.out.println( "            COMUN" ) ;
                                System.out.print( "                Ingrese tipoEntrada( impresa/digital ): " ) ;
                                tipoEntrada = in.nextLine() ;
                                
                                if ( tipoEntrada.equals( "impresa" ) ) {
                                    System.out.println( "                    IMPRESA" ) ;
                                    System.out.print( "                        Ingrese costoImpresion: " ) ;
                                    costoImpresion = in.nextDouble() ;
                                } else {
                                    costoImpresion = 0 ;
                                }

                                localidad = new Comun( numButaca , numFila , platea , metodoPago , comprador , tipoEntrada , costoImpresion ) ;

                            } else {
                                System.out.println( "            VIP" ) ;
                                System.out.print( "                Ingrese experienciaEspecial( true/false ): " ) ;
                                experienciaEspecial = in.nextBoolean() ;

                                if ( experienciaEspecial ) {
                                    System.out.println( "                    EXPERIENCIA ESPECIAL" ) ;

                                    System.out.print( "                        Ingrese costo( int ): " ) ;
                                    costo = in.nextDouble() ;
                                } else {
                                    costo = 0 ;
                                }
        

                                localidad = new Vip( numButaca , numFila , platea , metodoPago , comprador , experienciaEspecial , costo ) ;
                            }

                            show.agregarLocalidad( localidad ) ;
                            
                            numLocalidad++ ;
                        } while ( numLocalidad <= 2 ) ;
                    //

                break ;
                
                case 2: // calcular precio
                    if ( show == null ) {
                        System.out.println( "No hay un show cargado." ) ;
                    } else {
                        System.out.println( "\n" + show.calcularMontoTotal() ) ;
                    }
                break ;
                
                case 3: // imprimir
                    if ( show == null ) {
                        System.out.println( "No hay un show cargado." ) ;
                    } else {
                        show.imprimirInformacion() ;
                    }
                break ;

                case 4: // Crear un Show automáticamente
                    // Generar datos para el show
                    numShow = 1 ; // Cambia el número del show según sea necesario
                    dia = 15 ; // Cambia el día según sea necesario
                    año = 2024 ; // Cambia el año según sea necesario
                    fecha = new Fecha( dia , mes , año ) ;
                    soldOut = false ; // Cambia según la disponibilidad del show

                    // Datos predefinidos para personas
                    String[][] datosPersonas = {
                        { "12345678" , "Gómez ", "Juan" } ,
                        { "23456789" , "Pérez ", "Ana" } ,
                        { "34567890" , "López ", "Carlos" } ,
                        { "45678901" , "Martínez ", "María" } ,
                        { "56789012" , "Hernández ", "José" } ,
                        { "67890123" , "Rodríguez ", "Lucía" } ,
                        { "78901234" , "Sánchez ", "Pedro" } ,
                        { "89012345" , "Torres ", "Laura" } ,
                        { "90123456" , "Ramírez ", "Javier" } ,
                        { "01234567" , "Cruz ", "Sofía" }
                    };

                    // Crear el show
                    show = new Show( numShow , fecha , soldOut ) ;

                    // Generar localidades y agregarlas al show
                    for ( int i = 0 ; i < 10 ; i++ ) { // Cambia el número de localidades según sea necesario
                        // Datos de persona
                        DNI = Integer.parseInt( datosPersonas[ i ][ 0 ] ) ;
                        apellido = datosPersonas[ i ][ 1 ] ;
                        nombre = datosPersonas[ i ][ 2 ] ;
                        comprador = new Persona( DNI , apellido , nombre ) ;

                        // Datos de la localidad
                        numButaca = i + 1 ; // Asignar butacas de 1 a 10
                        numFila = ( i % 10 ) + 1 ; // Asignar filas (puedes cambiar la lógica según sea necesario)
                        platea = "A" ; // Asigna la platea (puedes cambiarla)
                        metodoPago = "tarjeta de crédito" ; // Método de pago

                        // Alternar entre localidad común y VIP
                        identificador = ( i % 2 == 0 ) ? "comun" : "vip" ; // Alterna entre "comun" y "vip"

                        if ( identificador.equals( "comun" ) ) {
                            tipoEntrada = "impresa" ; // Tipo de entrada
                            costoImpresion = 50 ; // Costo de impresión

                            // Crear localidad común
                            localidad = new Comun( numButaca , numFila , platea , metodoPago , comprador , tipoEntrada , costoImpresion ) ;
                        } else {
                            experienciaEspecial = true ; // Supongamos que todos tienen experiencia especial
                            costo = 100 ; // Costo VIP

                            // Crear localidad VIP
                            localidad = new Vip( numButaca , numFila , platea , metodoPago , comprador , experienciaEspecial , costo ) ;
                        }
                        show.agregarLocalidad( localidad ) ; // Agregar localidad VIP
                    }

                    System.out.println( "Show creado automáticamente con 10 localidades." ) ;
                break ;
                    
                case 5: // Salir
                    System.out.println("Saliendo...") ;
                break ;

                default:
                    System.out.println("Opción no válida. Intente nuevamente.") ;
                break ;
            }

        } while( opcion != 5 ) ;

        in.close() ; // Cerrar el Scanner
    }
}
