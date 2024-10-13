public class Libro {
    private String titulo          ;
    private int    paginas         ;
    private String editorial       ;
    private int    añoEdicion      ;
    private String idioma          ;
    private String primerAutor     ;
    private String ISBN            ;
    private double precio          ; /*en dolares*/
    private int    cantidadEnStock ;
    
    // getters
        public String getTitulo          () { return titulo          ; }
        public int    getPaginas         () { return paginas         ; }
        public String getEditorial       () { return editorial       ; }
        public int    getAñoEdicion      () { return añoEdicion      ; }
        public String getIdioma          () { return idioma          ; }
        public String getPrimerAutor     () { return primerAutor     ; } 
        public String getISBN            () { return ISBN            ; } 
        public double getPrecio          () { return precio          ; }
        public int    getCantidadEnStock () { return cantidadEnStock ; }
    //
    
    // setters
        public void setTitulo          ( String titulo      ) { this.titulo          = titulo      ; }
        public void setPaginas         ( int    cantidad    ) { this.paginas         = cantidad    ; }
        public void setEditorial       ( String editorial   ) { this.editorial       = editorial   ; }
        public void setAñoEdicion      ( int    añoEdicion  ) { this.añoEdicion      = añoEdicion  ; }
        public void setIdioma          ( String idioma      ) { this.idioma          = idioma      ; }
        public void setPrimerAutor     ( String primerAutor ) { this.primerAutor     = primerAutor ; } 
        public void setISBN            ( String ISBN        ) { this.ISBN            = ISBN        ; } 
        public void setPrecio          ( double precio      ) { this.precio          = precio      ; }
        public void setCantidadEnStock ( int    cantidad    ) { this.cantidadEnStock = cantidad    ; }
    //
    
    @Override
    public String toString() {
        return ( titulo + " por " + primerAutor + " - " + añoEdicion + " - ISBN: " + ISBN );
    }
}