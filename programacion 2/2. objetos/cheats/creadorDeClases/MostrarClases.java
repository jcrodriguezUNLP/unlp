import java.util.List;

public class MostrarClases {
    public static void mostrarClases( List<Clase> clasesGeneradas ) {
        if (clasesGeneradas.isEmpty()) {
            System.out.println("\nNo hay clases creadas aún.") ;
            return ;
        }

        System.out.println("\nLista de clases creadas:\n") ;
        // Mostrar la lista de clases con índices
        for( Clase clase : clasesGeneradas ) {
            System.out.println( clase.generarCodigo() ) ;
        }
    }
}