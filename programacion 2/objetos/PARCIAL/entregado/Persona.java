public abstract class Persona {
    private String nombre ;
    private String apellido ;

    // constructores
        public Persona() {}

        public Persona( String nombre , String apellido ) {
            this.nombre = nombre ;
            this.apellido = apellido ;
        }
    //

    // Getters
        public String getNombre() { return nombre ; }

        public String getApellido() { return apellido ; }
    //

    // Setters
        public void setNombre( String nombre ) { this.nombre = nombre ; }

        public void setApellido( String apellido ) { this.apellido = apellido ; }
    //

    public String toString() {
        return( "nombre: " + nombre + "| apellido: " + apellido ) ;
    }
}