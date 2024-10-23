public abstract class Piloto {
    private String nombre ;
    private String apellido ;
    private int rankingMundial ;
    

    // constructores
        public Piloto() {}

        public Piloto( String nombre , String apellido , int rankingMundial ) {
            this.nombre = nombre ;
            this.apellido = apellido ;
            this.rankingMundial = rankingMundial ;
        }
    //

    // Metodos
        public abstract int calcularPuntos( int clasificacion ) ;
    //

    @Override
    public String toString() {
        String texto ;

        texto = ( "        PILOTO" + "\n                nombre: " + nombre + " \n                apellido: " + apellido + "\n                rankingMundial: " + rankingMundial ) ;
        
        return  texto ;
    }
}