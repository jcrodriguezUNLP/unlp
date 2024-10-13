public class Persona {
    private int DNI ;
    private String apellido ;
    private String nombre ;

    // constructores
        public Persona() {}
        
        public Persona( int DNI, String apellido , String nombre ) {
            this.DNI = DNI ;
            this.apellido = apellido ;
            this.nombre = nombre ;
        } 
    //
    
    // getters
        public int getDNI() { return DNI ; }
        
        public String getApellido() { return apellido ; }
        
        public String getNombre() { return nombre ; }
    //
    
    // setters
        public void setDNI( int DNI ) { this.DNI = DNI ; }
        
        public void setApellido( String apellido ) { this.apellido = apellido ; }
        
        public void setNombre( String nombre ) { this.nombre = nombre ; }
    //
    
    // metodos
    //
       
    @Override
    public String toString () {
        return ( "| DNI: " + DNI + " | Apellido: " + apellido + " | Nombre: " + nombre ) ;
    }
}