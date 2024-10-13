public class Triangulo{
    private double lado1        ;
    private double lado2        ;
    private double lado3        ;
    private String colorBorde   ;
    private String colorRelleno ;
    
    // constructores
        public Triangulo() {}
        
        public Triangulo( double lado1 , double lado2 , double lado3 , String colorBorde , String colorRelleno ) {
            this.lado1        = lado1        ;
            this.lado2        = lado2        ;
            this.lado3        = lado3        ;
            this.colorBorde   = colorBorde   ;
            this.colorRelleno = colorRelleno ;
        }
    //

    // getters
        public double getLado1        () { return lado1        ; }
        public double getLado2        () { return lado2        ; }
        public double getLado3        () { return lado3        ; }
        public String getColorBorde   () { return colorBorde   ; }
        public String getColorRelleno () { return colorRelleno ; }
    //
    
    //setters
        public void setLado1        ( double lado         ) { this.lado1        = lado         ; }
        public void setLado2        ( double lado         ) { this.lado2        = lado         ; }
        public void setLado3        ( double lado         ) { this.lado3        = lado         ; }
        public void setColorBorde   ( String colorBorde   ) { this.colorBorde   = colorBorde   ; }
        public void setColorRelleno ( String colorRelleno ) { this.colorRelleno = colorRelleno ; }
    //
    
    // metodos
        public double calcularPerimetro() {
            double p ;
            
            p = ( lado1 + lado2 + lado3 ) ;
            
            return p ;
        }
    
        public double calcularArea() {
            double s    ;
            double area ;
            
            s = ( calcularPerimetro() / 2 ) ;
            
            area = Math.sqrt( s*(s-lado1)*(s-lado2)*(s-lado3) ) ;
            
            return area ;
        }
    //
    
    @Override
    public String toString() { return( "" ) ; } 
}