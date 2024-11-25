package PARCIAL.enClase;

public abstract class Piloto {
    private String nombre ; 
    private String apellido ;
    private int rankingMundial ;

    // Constructores
        public Piloto() {}

        public Piloto( String nombre , String apellido , int rankingMundial ) {
            this.nombre = nombre ;
            this.apellido = apellido ;
            this.rankingMundial = rankingMundial ;
        }
    //

    // Getters
        public String getNombre() { return( nombre ) ; }

        public String getApellido() { return( apellido ) ; }

        public int getRankingMundial() { return( rankingMundial ) ; }
    //

    // Setters
        public void setNombre( String nombre ) { this.nombre = nombre ; }

        public void setApellido( String apellido ) { this.apellido = apellido ; }

        public void setRankingMundial( int rankingMundial ) { this.rankingMundial = rankingMundial ; }
    //

    @Override
    public String toString() {
        String texto = "" ;
        texto += ( "\n    nombre: " + nombre ) ;
        texto += ( "\n    apellido: " + apellido ) ;
        texto += ( "\n    rankingMundial: " + rankingMundial ) ;
        return( texto ) ;
    }
}