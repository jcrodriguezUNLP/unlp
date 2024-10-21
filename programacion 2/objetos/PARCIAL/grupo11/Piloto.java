public abstract class Piloto {
    private String nombre ;
    private String apellido ;
    private int rankingMundial ;
    private int clasificacion ;

    // constructores
        public Piloto() {}

        public Piloto( String nombre , String apellido , int rankingMundial , int clasificacion ) {
            this.nombre = nombre ;
            this.apellido = apellido ;
            this.rankingMundial = rankingMundial ;
            this.clasificacion = clasificacion ;
        }
    //

    // Getters
        public String getNombre() { return nombre ; }

        public String getApellido() { return apellido ; }

        public int getRankingMundial() { return rankingMundial ; }

        public int getClasificacion() { return clasificacion ; }
    //

    // Setters
        public void setNombre( String nombre ) { this.nombre = nombre ; }

        public void setApellido( String apellido ) { this.apellido = apellido ; }

        public void setRankingMundial( int rankingMundial ) { this.rankingMundial = rankingMundial ; }

        public void setClasificacion( int clasificacion ) { this.clasificacion = clasificacion ; }
    //

    @Override
    public String toString() {
        return( "nombre: " + nombre + " | apellido: " + apellido + "| rankingMundial: " + rankingMundial + " | clasificacion: " + clasificacion ) ;
    }
}