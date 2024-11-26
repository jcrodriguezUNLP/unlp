public class Persona {
    private String nombre ;
    private int    DNI    ;
    private int    edad   ;
    
    // constructores
        public Persona(){}
        
        public Persona ( String unNombre , int unDNI , int unaEdad ) {
            nombre = unNombre ;
            DNI    = unDNI    ;
            edad   = unaEdad  ; 
        }
    //
    
    // getters
        public int    getDNI    () { return DNI    ; }
        public int    getEdad   () { return edad   ; }
        public String getNombre () { return nombre ; }
    //
    
    // setters
        public void setDNI    ( int unDNI       ) { DNI    = unDNI    ; }
        public void setEdad   ( int unaEdad     ) { edad   = unaEdad  ; }
        public void setNombre ( String unNombre ) { nombre = unNombre ; }
    //
        
    @Override
    public String toString () {
        String aux ; 
        
        aux = ( "Nombre " + nombre + ", DNI " + DNI + " Edad " + edad ) ;
        
        return aux ;
    }
}
