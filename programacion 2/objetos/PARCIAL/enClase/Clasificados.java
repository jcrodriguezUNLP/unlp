package PARCIAL.enClase;

public class Clasificados extends piloto {
    private Tiempo tiempo ; 

    // Constructores
        public Clasificados() {}

        public Clasificados( Tiempo tiempo ) {
            this.tiempo = tiempo ; 
        }
    //

    // Getters
        public Tiempo getTiempo() { return( tiempo ) ; }
    //

    // Setters
        public void setTiempo( Tiempo tiempo ) { this.tiempo = tiempo ; }
    //

    @Override
    public String toString() {
        String texto = "" ;
        texto += ( "\n    tiempo: " + tiempo ) ;
        return( texto ) ;
    }
}