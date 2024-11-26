public abstract class Persona {
    private String nombre       ;
    private int    DNI          ;
    private int    edad         ;
    private double sueldoBasico ;
    
    // constructores
        public Persona() {}
        
        public Persona( String nombre , int DNI , int edad , double sueldoBasico ) {
            this.nombre = nombre ;
            this.DNI    = DNI    ;
            this.edad   = edad   ; 
        }
    //
    
    // getters
        public int    getDNI          () { return DNI          ; }
        public int    getEdad         () { return edad         ; }
        public String getNombre       () { return nombre       ; }
        public double getSueldoBasico () { return sueldoBasico ; }
    //
    
    // setters
        public void setDNI          ( int    DNI          ) { this.DNI          = DNI          ; }
        public void setEdad         ( int    edad         ) { this.edad         = edad         ; }
        public void setNombre       ( String nombre       ) { this.nombre       = nombre       ; }
        public void setSueldoBasico ( double sueldoBasico ) { this.sueldoBasico = sueldoBasico ; }

    //

    public abstract double calcularSueldoACobrar() ;
        
    public String toString() {
        return( "Nombre " + nombre + ", DNI " + DNI + " Edad " + edad + " SueldoBasico " + sueldoBasico ) ;
    }
}