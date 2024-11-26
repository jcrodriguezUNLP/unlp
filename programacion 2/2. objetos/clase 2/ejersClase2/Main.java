import java.util.Scanner;

public class Main {
    // Funcion para leer una persona
        public static Persona leerPersona() {
            Scanner in = new Scanner(System.in);
        
            System.out.println("Ingrese su edad: ");
            int edad = in.nextInt();
        
            System.out.println("Ingrese su DNI: ");
            int dni = in.nextInt();
        
            System.out.println("Ingrese solo su nombre: ");
            String nombre = in.next();
        
            Persona p = new Persona();
            p.setDNI(dni);
            p.setNombre(nombre);
            p.setEdad(edad);
        
            return p;
        }
    //
            
    // Funcion para leer un arreglo de personas
        public static Persona[] leerPersonas() {
            Persona[] personas = new Persona[15];
    
            /*
            for (int i = 0; i < personas.length; i++) {
                System.out.println("Leyendo datos para la persona " + (i + 1) + ":");
                personas[i] = leerPersona();
            }
            */
            for (int i = 0; i < personas.length; i++) {
                
                Persona persona = new Persona();
                
                persona.setNombre (""   + i ) ;
                persona.setDNI    ( 500 + i ) ;
                persona.setEdad   ( 60  + i ) ;
                
                personas[ i ] = persona ; 
            }
            
            personas[5].setDNI( 1 ) ;
           
            return personas;
        }
    //
            
    // Funcion para obener la cantidad de personas mayores de 65 años
        public static int edadMas65( Persona[] personas ) {
            int cant = 0 ;
            
            for (Persona persona : personas) {
                 
                if ( 65 < persona.getEdad() ) {
                    cant++ ;
                }
            }
            
            return cant ;
        }
    //
            
            
    // Funcion para obtener la persona con menor dni dentro del array de personas
        public static Persona menorDNI( Persona[] personas ) {
            Persona menor ;
            
            menor = personas[ 0 ] ; 
            
            for ( Persona persona : personas ) {
                
                if ( persona.getDNI() < menor.getDNI() ) {
                    menor = persona ;
                }
            }
            
            return menor ;
        }
    //
    
    public static void main(String[] args) {        
        // Llamar al método estático leerPersonas() de la clase Persona
        Persona[] personas = leerPersonas();

        // Iersona.mprimir los datos de todas las personas
        for (Persona persona : personas) {
            System.out.println( persona.toString( ));
        }
        
        // Calcular y mostrar la cantidad de personas mayores de 65 años
        int mayoresDe65 = edadMas65( personas) ;
        
        System.out.println( "Cantidad de personas mayores de 65 años: " + mayoresDe65 ) ;
        
        // Encontrar y mostrar la persona con el menor DNI
        Persona menorDNI = menorDNI( personas ) ;
      
        System.out.println( "Persona con el menor DNI: " + menorDNI.toString() ) ;
    
    
        // micros
        Micro micro = new Micro() ;

        boolean[] asientos = new boolean[ 20 ] ;

        micro.setAsientos( asientos ) ;
        
        
    }
}