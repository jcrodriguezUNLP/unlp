package grupo11;

import java.util.Scanner ;

public class CrearClase {
    public static void main( String[] args ) {
        Scanner in = new Scanner( System.in ) ;

        String clase ; // Nombre de la clase
        int cantVariables ; // Cantidad de variables
        Variables[] variables ; // Array para almacenar las variables
        int i ;

        System.out.print( "\nIngrese el nombre de la clase: " ) ;
        clase = in.next() ; // Lee el nombre de la clase

        System.out.print( "\nIngrese la cantidad de variables: " ) ;
        cantVariables = in.nextInt() ; // Lee la cantidad de variables
        in.nextLine() ; // Consume el salto de línea

        variables = new Variables[ cantVariables ] ; // Inicializa el array de variables

        for ( i = 0 ; i < cantVariables ; i++ ) {
            System.out.println( "\nvariable N°" + ( i + 1 ) + ":" ) ;

            System.out.print( "    Nombre: " ) ;
            String nombre = in.nextLine() ; // Lee el nombre de la variable

            System.out.print( "    Tipo: " ) ;
            String tipo = in.nextLine() ; // Lee el tipo de variable

            variables[ i ] = new Variables( tipo , nombre ) ; // Crea una instancia de Variables
        }

        // Generación de la clase
        System.out.println( "\npublic class " + capitalize( clase ) + " {" ) ;

        // Declaración de las variables de instancia
        for ( i = 0 ; i < cantVariables ; i++ ) {
            System.out.println( "    private " + variables[ i ].getTipo() + " " + variables[ i ].getNombre() + " ;" ) ;
        }

        // Generación del constructor por defecto
        System.out.println( "\n    // constructores" ) ;
        System.out.println( "        public " + capitalize( clase ) + "() {}" ) ;

        // Generación del constructor parametrizado
        System.out.print( "\n        public " + capitalize( clase ) + "( " ) ;
        for ( i = 0 ; i < cantVariables ; i++ ) {
            System.out.print( variables[ i ].getTipo() + " " + variables[ i ].getNombre() ) ;
            if ( i < cantVariables - 1 ) {
                System.out.print( " , " ) ;
            }
        }
        System.out.println( " ) {" ) ;

        // Asignación de variables en el constructor
        for ( i = 0 ; i < cantVariables ; i++ ) {
            System.out.println( "            this." + variables[ i ].getNombre() + " = " + variables[ i ].getNombre() + " ;" ) ;
        }
        System.out.println( "        }" ) ;
        System.out.println( "    //" ) ;

        // Generación de getters
        System.out.print( "\n    // Getters" ) ;
        for ( i = 0 ; i < cantVariables ; i++ ) {
            System.out.println( "\n        public " + variables[ i ].getTipo() + " get" + capitalize( variables[ i ].getNombre() ) + "() { return " + variables[ i ].getNombre() + " ; }" ) ;
        }
        System.out.println( "    //" ) ;

        // Generación de setters
        System.out.print( "\n    // Setters" ) ;
        for ( i = 0 ; i < cantVariables ; i++ ) {
            System.out.println( "\n        public void set" + capitalize( variables[ i ].getNombre() ) + "( " + variables[ i ].getTipo() + " " + variables[ i ].getNombre() + " ) { this." + variables[ i ].getNombre() + " = " + variables[ i ].getNombre() + " ; }" ) ;
        }
        System.out.println( "    //" ) ;

        // Cerrar el Scanner
        in.close() ;

        // Generación del método toString()
        System.out.println( "\n    @Override" ) ;
        System.out.println( "    public String toString() {" ) ;
        System.out.print( "        return( \"" + variables[ 0 ].getNombre() + ": \" + " + variables[ 0 ].getNombre() + " + \" " ) ;

        for ( i = 1 ; i < cantVariables ; i++ ) {
            System.out.print( "| " + variables[ i ].getNombre() + ": \" + " + variables[ i ].getNombre() ) ;
        }
        System.out.println( " ) ;" ) ;
        System.out.println( "    }" ) ;

        System.out.println( "}" ) ; // Cerrar la clase
    }

    // Método auxiliar para capitalizar la primera letra
    private static String capitalize( String str ) {
        return str.substring( 0 , 1 ).toUpperCase() + str.substring( 1 ) ;
    }

    // Clase Variables
    static class Variables {
        private String tipo ;
        private String nombre ;

        // constructores
        public Variables() {}

        public Variables( String tipo , String nombre ) {
            this.tipo = tipo ;
            this.nombre = nombre ;
        }

        // getters
        public String getTipo() { return tipo ; }

        public String getNombre() { return nombre ; }

        // setters
        public void setTipo( String tipo ) { this.tipo = tipo ; }

        public void setNombre( String nombre ) { this.nombre = nombre ; }
    }
}
