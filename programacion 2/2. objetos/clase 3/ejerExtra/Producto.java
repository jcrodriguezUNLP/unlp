public class Producto {
    private int    codigo      ;
    private String nombre      ;
    private String descripcion ;
    private String marca       ;
    private int    stock       ;
    
    
    // constructores
        public Producto() {}
        
        public Producto( int codigo , String nombre , String descripcion , String marca , int stock ) {
            this.codigo      = codigo      ;
            this.nombre      = nombre      ;
            this.descripcion = descripcion ; 
            this.marca       = marca       ; 
            this.stock       = stock       ; 
        }
    //
    
    // getters
        public int    getCodigo      () { return codigo      ; }
        public String getNombre      () { return nombre      ; }
        public String getDescripcion () { return descripcion ; }
        public String getMarca       () { return marca       ; }
        public int    getStock       () { return stock       ; }

    //
    
    // setters
        public void setcodigo    ( int    codigo    ) { this.codigo    = codigo    ; }
        public void setdescripcion   ( int    descripcion   ) { this.descripcion   = descripcion   ; }
        public void setNombre ( String nombre ) { this.nombre = nombre ; }
    //
        
    @Override
    public String toString() {
        return ( "Nombre " + nombre + ", codigo " + codigo + " descripcion " + descripcion ) ;
    }
}