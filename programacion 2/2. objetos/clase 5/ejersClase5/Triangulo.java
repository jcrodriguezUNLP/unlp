public class Triangulo extends Figura {
     private double lado1 ;
     private double lado2 ;
     private double lado3 ;

     // constructores
          // vacio
          public Triangulo(){} 

          // con colores fijos
          public Triangulo( double lado1 , double lado2 , double lado3 ) {
               super( "blanco" , "negro" , new Punto() ) ;

               this.lado1 = lado1 ;
               this.lado2 = lado2 ;
               this.lado3 = lado3 ;
          }

          // completo
          public Triangulo( double lado1 , double lado2 , double lado3 , String colorRelleno , String colorLinea , Punto punto ) {
               super( colorRelleno , colorLinea , punto ) ;
               
               this.lado1 = lado1 ;
               this.lado2 = lado2 ;
               this.lado3 = lado3 ;
          } 
     //

     // getters
     public double getLado1() { return lado1 ; }
     public double getLado2() { return lado2 ; }
     public double getLado3() { return lado3 ; }
     
     // setters
     public void setLado1( double nuevoLado ) { lado1 = nuevoLado ; }
     public void setLado2( double nuevoLado ) { lado2 = nuevoLado ; }
     public void setLado3( double nuevoLado ) { lado3 = nuevoLado ; }

     // metodos
     public double calcularPerimetro() {
          return( lado1 + lado2 + lado3 ) ;
     }

     public double calcularArea() {
          double s ;
          
          s = ( calcularPerimetro() / 2 ) ;
 
          return( Math.sqrt( s*(s - lado1)*(s - lado2)*(s - lado3) ) ) ;
     }

     

     public void dibujar(){
          System.out.println("Triangulo: " ) ;
          
          super.dibujar() ;
          
          System.out.println( "Lado1: " + lado1 ) ;
          System.out.println( "Lado2: " + lado2 ) ;
          System.out.println( "Lado3: " + lado3 ) ;
     }
}