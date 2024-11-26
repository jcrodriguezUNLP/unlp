import java.util.Scanner ;
            
public class Main {    
    public static void main(String[] args) {
        
        Scanner in = new Scanner( System.in ) ;
        
        // Libro
            System.out.println( "LIBRO" ) ;
        
            Libro libro = new Libro() ;
            
            libro.setTitulo          ( "Java: A Beginner's Guide" ) ;
            libro.setEditorial       ( "Mcgraw-Hill"              ) ;
            libro.setAñoEdicion      ( 2014                       ) ;
            libro.setPrimerAutor     ( "Herbert Schildt"          ) ;
            libro.setISBN            ( "978-0071809252"           ) ;
            libro.setPrecio          ( 21.72                      ) ;
            libro.setIdioma          ( "Inglés"                   ) ;
            libro.setCantidadEnStock ( 100                        ) ;
            libro.setPaginas         ( 699                        ) ;
            
            System.out.println( "    " + libro.toString() ) ;
        //

        // Triangulo
            System.out.println(             ) ;
            System.out.println( "TRIANGULO" ) ;

            Triangulo triangulo = new Triangulo( 1 , 1 , Math.sqrt(2) ) ;
            
            System.out.println( "    " + triangulo.calcularArea() ) ;
        //
        
        // Balanza
            System.out.println(           ) ;
            System.out.println( "BALANZA" ) ;
            
            double pesoEnKG    ;
            double precioPorKG ;
            int    i           ;
        
            Balanza balanza = new Balanza() ;
            
            balanza.iniciarCompra() ;
            
            i = 1 ;
            
            System.out.println( "    Producto N°" + i        ) ;
            System.out.println( "        Ingrese PesoEnKG: " ) ;
            pesoEnKG = in.nextInt()                            ;
            
            while ( pesoEnKG != 0 ) {
                System.out.println("        Ingrese PrecioPorKG: ") ;
                precioPorKG = in.nextInt()                          ;
                
                balanza.registrarProducto ( pesoEnKG , precioPorKG ) ;
                
                i++ ;
            
                System.out.println( "    Producto N°" + i        ) ;
                System.out.println( "        Ingrese PesoEnKG: " ) ;
                pesoEnKG = in.nextInt()                            ;
            }
            
            System.out.println( balanza.devolverMontoAPagar     () ) ;
            System.out.println( balanza.devolverResumenDeCompra () ) ;    
        //
        
        // Entrenador
            String nombre                 ;
            double sueldoBasico           ;
            int    cantCampeonatosGanados ;
            
            System.out.println(              ) ;
            System.out.println( "ENTRENADOR" ) ;
        
            Entrenador entrenador = new Entrenador() ;
            
            in.nextLine() ;

            
            System.out.println("    Ingrese Nombre: ") ;
            nombre = in.nextLine()                     ;
            
            System.out.println("    Ingrese SueldoBasico: ") ;
            sueldoBasico = in.nextDouble()                   ;
            
            System.out.println("    Ingrese CantCampeonatosGanados: ") ;
            cantCampeonatosGanados = in.nextInt()                      ;
            
            entrenador.setNombre                 ( nombre                );
            entrenador.setSueldoBasico           ( sueldoBasico          ) ;
            entrenador.setCantCampeonatosGanados (cantCampeonatosGanados ) ;

            System.out.println( entrenador.toString() ) ;
        //

            
    }
}