import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in) ;
        
        int opcion = 0 ;

        // persona
        String nombre       ;
        int    dni          ;
        int    edad         ;
        double sueldoBasico ;

        //entrenador
        int    cantCampeonatosGanados ;

        //jugador
        int   numPartidosJugados ;
        int   numGolesAnotados   ;

        do {
            // Mostrar el menú
            System.out.println ("\nMENU PRINCIPAL:"       ) ;
            System.out.println ("1. Jugador"            ) ;
            System.out.println ("2. Entrenador"           ) ;
            System.out.println ("3. Micro"                ) ;
            System.out.println ("4. Flota"                ) ;
            System.out.println ("5. Salir"                ) ;
            System.out.print   ("Seleccione una opción: " ) ;
            
            opcion = in.nextInt() ;
            in.nextLine() ; // Consumir el salto de línea

            switch (opcion) {
                case 1: // Jugador
                    System.out.println( "\nJUGADOR" ) ;

                    System.out.print( "Ingrese Nombre: " ) ;
                    nombre = in.nextLine() ;

                    System.out.print( "Ingrese DNI: " ) ;
                    dni = in.nextInt() ;

                    System.out.print( "Ingrese Edad: " ) ;
                    edad = in.nextInt() ;

                    System.out.print( "Ingrese Sueldo Básico: " ) ;
                    sueldoBasico = in.nextDouble() ;

                    System.out.print( "Ingrese Número de Partidos Jugados: " ) ;
                    numPartidosJugados = in.nextInt() ;

                    System.out.print( "Ingrese Número de Goles Anotados: " ) ;
                    numGolesAnotados = in.nextInt() ;
                    
                    in.nextLine() ; // Consumir el salto de línea

                    Jugador jugador = new Jugador( nombre , dni , edad , sueldoBasico , numPartidosJugados , numGolesAnotados ) ;

                    System.out.println( jugador.toString() ) ;
                break ;
                
                case 2: // Entrenador
                    System.out.println("\nENTRENADOR" ) ;

                    System.out.print("Ingrese Nombre: " ) ;
                    nombre = in.nextLine() ;

                    System.out.print("Ingrese DNI: " ) ;
                    dni = in.nextInt() ;

                    System.out.print("Ingrese Edad: " ) ;
                    edad = in.nextInt() ;

                    System.out.print("Ingrese Sueldo Básico: " ) ;
                    sueldoBasico = in.nextDouble() ;

                    System.out.print("Ingrese Cantidad de Campeonatos Ganados: " ) ;
                    cantCampeonatosGanados = in.nextInt() ;
                    
                    in.nextLine() ; // Consumir el salto de línea

                    Persona entrenador = new Entrenador( nombre , dni , edad , sueldoBasico , cantCampeonatosGanados ) ;

                    System.out.println( entrenador.toString() ) ;
                break ;

                case 4:
                    // VisorFiguras visorFiguras = new VisorFiguras() ;
        
                    // Cuadrado cuadrado1 = new Cuadrado( 10 , "Violeta" , "Rosa"    ) ;
                    // Cuadrado cuadrado2 = new Cuadrado( 30 , "Rojo"    , "Naranja" ) ;

                    // Rectangulo rectangulo = new Rectangulo( 20 , 10 , "Azul" , "Celeste" ) ;
                        
                    // System.out.println( visorFiguras.mostrar( cuadrado1 ) ) ;
                    // System.out.println( visorFiguras.mostrar( cuadrado2 ) ) ;

                    // System.out.println( visorFiguras.mostrar( rectangulo ) ) ;
                        
                    // System.out.println(visorFiguras.getMostradas());
                    // break;
                
                // case 1: // Triángulo
                //     System.out.println("\nTRIANGULO" ) ;
                //     Triangulo triangulo = new Triangulo( 3 , 4 , 5 , "Rojo" , "Azul" , new Punto() ) ;
                //     System.out.println("Área del triángulo: " + triangulo.calcularArea());
                //     break ;

                case 5:
                    break ;

                case 6:
                    System.out.println("Saliendo...");
                    break ;

                default:
                    System.out.println("Opción no válida. Intente nuevamente.");
                    break ;
            }

        } while (opcion != 5);

        in.close(); // Cerrar el Scanner
    }
}
