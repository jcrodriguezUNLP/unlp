import java.util.List;
import java.util.Scanner;

public class MostrarClase {
    private static Scanner in = new Scanner(System.in) ;

    public static void mostrarClase( List<Clase> clasesGeneradas ) {
        int i ;

        if (clasesGeneradas.isEmpty()) {
            System.out.println("\nNo hay clases creadas aún.") ;
            return ;
        }

        System.out.println("\nClases creadas:") ;
        // Mostrar la lista de clases con índices
        for ( i = 0 ; i < clasesGeneradas.size() ; i++ ) {
            System.out.println( (i + 1) + ". " + clasesGeneradas.get(i).getNombre()) ;
        }

        // Solicitar al usuario que elija una clase
        System.out.print("Seleccione el número de la clase que desea imprimir (0 para regresar): ") ;
        int seleccion = in.nextInt() ;
        in.nextLine() ; // Consumir el salto de línea

        // Verificar si la selección es válida
        if (seleccion > 0 && seleccion <= clasesGeneradas.size()) {
            Clase claseSeleccionada = clasesGeneradas.get(seleccion - 1) ;
            System.out.println("\nCódigo generado para la clase " + claseSeleccionada.getNombre() + ":") ;
            System.out.println(claseSeleccionada.generarCodigo()) ;
        } else if (seleccion != 0) {
            System.out.println("Selección inválida.") ;
        }
    }
}
