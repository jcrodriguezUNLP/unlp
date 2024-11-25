package creadorDeClases ;

import java.util.ArrayList ;
import java.util.List ;
import java.util.Scanner ;

public class GeneradorDeClases {
    private static List<Clase> clasesGeneradas = new ArrayList<>() ;
    private static Scanner in = new Scanner( System.in ) ;

    public static void main( String[] args ) {
        boolean continuar = true ;

        while ( continuar ) {
            System.out.print( "\n" + "Ingrese el nombre de la clase: " ) ;
            String nombreClase = in.nextLine() ;
            nombreClase = Capitalize.capitalize( nombreClase ) ;

            System.out.print( "\n" + "¿Es una clase abstracta? ( s/n ): ") ;
            boolean esAbstracta = in.nextLine().equalsIgnoreCase( "s" ) ;

            System.out.print( "\n" + "¿Hereda de alguna clase existente? ( s/n ): " ) ;
            String heredaRespuesta = in.nextLine() ;
            Clase claseBase = null;
            if ( heredaRespuesta.equalsIgnoreCase( "s" ) ) {
                System.out.println( "Clases disponibles para heredar:" ) ;

                if ( clasesGeneradas.isEmpty() ) {
                    System.out.println( "No hay clases disponibles" ) ;
                    claseBase = null ;
                } else {
                    for ( int i = 0; i < clasesGeneradas.size() ; i++) {
                        System.out.println( (i + 1) + ". " + clasesGeneradas.get( i ).getNombre()) ;
                    }
                    System.out.print( "Ingrese el número correspondiente a la clase de la que desea heredar: " ) ;
                    int seleccion = Integer.parseInt( in.nextLine() ) - 1 ;
                    claseBase = clasesGeneradas.get( seleccion ) ;
                }
            }

            List<Variable> variablesPropias = new ArrayList<>() ;
            System.out.print( "\n" + "Ingrese la cantidad de variables: " ) ;
            int cantVariables = Integer.parseInt( in.nextLine() ) ;

            for ( int i = 0; i < cantVariables; i++) {
                System.out.println( "\n" + "Variable N°" + ( i + 1) + ":" ) ;

                System.out.print( Sangria.sangria( 1 ) + "Nombre: " ) ;
                String nombre = in.nextLine() ; // Lee el nombre de la variable

                System.out.println( Sangria.sangria( 1 ) + "Tipo:" ) ;
                System.out.println( Sangria.sangria( 2 ) + "1. int" ) ;
                System.out.println( Sangria.sangria( 2 ) + "2. double" ) ;
                System.out.println( Sangria.sangria( 2 ) + "3. boolean" ) ;
                System.out.println( Sangria.sangria( 2 ) + "4. char" ) ;
                System.out.println( Sangria.sangria( 2 ) + "5. String" ) ;
                System.out.println( Sangria.sangria( 2 ) + "6. void" ) ;
                System.out.println( Sangria.sangria( 2 ) + "7. otro" ) ;
                System.out.print( Sangria.sangria( 1 ) + "Ingrese el número correspondiente al tipo de variable: " ) ;
                int opcion = in.nextInt() ; // Lee el tipo de variable
                in.nextLine() ; // Consume el salto de línea

                String tipo = obtenerTipo( opcion ) ;

                variablesPropias.add(new Variable(tipo, nombre)) ; // Crea una instancia de Variable
            }

            List<MetodoAbstracto> metodosAbstractos = new ArrayList<>() ;

            // metodos abstractos
            if ( esAbstracta ) {
                System.out.print( "\n" + "¿Desea agregar métodos abstractos? ( s/n ): " ) ;
                boolean agregarMetodos = in.nextLine().equalsIgnoreCase( "s" ) ;

                int cantMetodos = 0 ;
                while ( agregarMetodos ) {
                    System.out.println( "\n" + "Método abstracto N°" + (cantMetodos + 1) + ":" ) ;

                    System.out.print( Sangria.sangria( 1 ) + "Nombre: " ) ;
                    String nombre = in.nextLine() ; // Lee el nombre del método

                    System.out.println( Sangria.sangria( 1 ) + "Tipo:" ) ;
                    System.out.println( Sangria.sangria( 2 ) + "1. int" ) ;
                    System.out.println( Sangria.sangria( 2 ) + "2. double" ) ;
                    System.out.println( Sangria.sangria( 2 ) + "3. boolean" ) ;
                    System.out.println( Sangria.sangria( 2 ) + "4. char" ) ;
                    System.out.println( Sangria.sangria( 2 ) + "5. String" ) ;
                    System.out.println( Sangria.sangria( 2 ) + "6. void" ) ;
                    System.out.println( Sangria.sangria( 2 ) + "7. otro" ) ;
                    System.out.print( Sangria.sangria( 1 ) + "Ingrese el número correspondiente al tipo: " ) ;
                    int opcion = in.nextInt() ; // Lee el tipo de retorno
                    in.nextLine() ; // Consume el salto de línea

                    String tipo = obtenerTipo( opcion ) ;

                    metodosAbstractos.add( new MetodoAbstracto( tipo , nombre ) ) ; // Crea una instancia de MetodoAbstracto

                    System.out.print( "\n" + "¿Desea agregar otro método abstracto? ( s/n ): " ) ;
                    agregarMetodos = in.nextLine().equalsIgnoreCase( "s" ) ;
                    cantMetodos++ ;
                }
            }

            Clase nuevaClase = new Clase(nombreClase, esAbstracta, claseBase, variablesPropias , metodosAbstractos ) ;
            clasesGeneradas.add(nuevaClase) ;

            System.out.println( "\nClase generada:\n" ) ;
            System.out.println(nuevaClase.generarCodigo()) ;

            System.out.print( "\n¿Desea crear otra clase? ( s/n ): " ) ;
            continuar = in.nextLine().equalsIgnoreCase( "s" ) ;
        }
    }

    private static String obtenerTipo( int opcion ) {
        while ( true ) { // Bucle para repetir en caso de opción inválida
            switch ( opcion ) {
                case 1:
                    return "int" ;
                case 2:
                    return "double" ;
                case 3:
                    return "boolean" ;
                case 4:
                    return "char" ;
                case 5:
                    return "String" ;
                case 6:
                    return "void" ;
                case 7: {
                    System.out.print( "Ingrese el tipo personalizado: " ) ;
                    String tipoPersonalizado = in.nextLine() ;
                    return Capitalize.capitalize( tipoPersonalizado ) ;
                }
                default:
                    System.out.print( "Opción inválida. Ingrese un número válido (1-7): " ) ;
                    opcion = in.nextInt() ;
                    in.nextLine(); // Consumir el salto de línea
            }
        }
    }

}
