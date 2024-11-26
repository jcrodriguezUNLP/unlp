// package creadorDeClases ;

import java.util.ArrayList ;
import java.util.List ;
import java.util.Scanner ;

public class GeneradorDeClases {
    private static List<Clase> clasesGeneradas = new ArrayList<>() ;
    private static Scanner in = new Scanner( System.in ) ;

    public static void main( String[] args ) {
        int opcion = 0 ;
        do {
            System.out.println( "\n1. Crear clase" ) ;
            System.out.println( "2. Mostrar clases" ) ;
            System.out.println("3. Mostrar todas las clases") ; // Nueva opción
            System.out.println("4. Salir") ;
            System.out.print("Opción: ") ;
            opcion = in.nextInt() ;
            in.nextLine() ;
            switch( opcion ) {
                case 1:
                    CrearClase.crearClase( clasesGeneradas ) ;
                    break ;
                case 2:
                    MostrarClase.mostrarClase( clasesGeneradas ) ;
                    break ;
                case 3:
                    MostrarClases.mostrarClases( clasesGeneradas ) ; // Llama al método para listar todas las clases
                    break ;
                case 4:
                    System.out.println("Saliendo...") ;
                    break ;
                default:
                    System.out.println("Opción no válida") ;
            }
        } while( opcion != 4 ) ;
    }
}