public abstract class Figura {
    private String colorRelleno ;
    private String colorLinea   ;
    private Punto  punto        ; 
    
    // constructores
        // vacio
        public Figura(){
        }

        // completo
        public Figura(String colorRelleno, String colorLado, Punto punto){
            this.setColorRelleno(colorRelleno);
            this.setColorLinea(colorLado);
            this.setPunto(punto);
        }
    //
   
    // getters
    public String getColorRelleno () { return colorRelleno ; }    
    public String getColorLinea   () { return colorLinea   ; }
    public Punto getPunto         () { return punto        ; }

    // setters
    public void setColorRelleno ( String colorRelleno ) { this.colorRelleno = colorRelleno ; }
    public void setColorLinea   ( String colorLinea   ) { this.colorLinea   = colorLinea   ; }
    public void setPunto        ( Punto punto         ) { this.punto        = punto        ; }
     
    // metodos
    public void dibujar(){
        System.out.println( "Color de Linea: "   + this.getColorLinea       () ) ;
        System.out.println( "Color de Relleno: " + this.getColorRelleno     () ) ;
        System.out.println( "Ubicación: "        + this.getPunto().toString () ) ;
    }

    // metodos abstractos
    abstract double calcularArea      () ;
    abstract double calcularPerimetro () ;
}
