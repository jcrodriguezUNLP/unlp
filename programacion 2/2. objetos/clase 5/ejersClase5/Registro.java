public class Registro {
    private String estacion ;
    private String latitud  ;
    private String longitud ;

    // Constructor
        public Registro() {}

        public Registro( String estacion , String latitud , String longitud ) {
            this.estacion = estacion ;
            this.latitud  = latitud  ;
            this.longitud = longitud ;
        }
    //

    // Getters
        public String getEstacion () { return estacion ; }
        public String getLatitud  () { return latitud  ; }
        public String getLongitud () { return longitud ; }
    //

    // Setters
        public void setEstacion ( String estacion ) { this.estacion = estacion ; }
        public void setLatitud  ( String latitud  ) { this.latitud  = latitud  ; }
        public void setLongitud ( String longitud ) { this.longitud = longitud ; }
    //

    // Metodos
        public void registrarEstacion( String estacion , String latitud , String longitud ) {
            this.estacion = estacion ;
            this.latitud  = latitud  ;
            this.longitud = longitud ;
        }
    //

    public String toString() {
        return "Estacion: " + estacion + " Latitud: " + latitud + " Longitud: " + longitud ;
    }
}