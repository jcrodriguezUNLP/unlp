package PARCIAL.enClase;

public class NoClasificados extends piloto {
    private int mejorPuesto ; 

    // Constructores
        public NoClasificados() {}

        public NoClasificados( int mejorPuesto ) {
            this.mejorPuesto = mejorPuesto ;
        }
    //

    // Getters
        public int getMejorPuesto() { return( mejorPuesto ) ; }
    //

    // Setters
        public void setMejorPuesto( int mejorPuesto ) { this.mejorPuesto = mejorPuesto ; }
    //

    @Override
    public String toString() {
        String texto = "" ;
        texto += ( "\n    mejorPuesto: " + mejorPuesto ) ;
        return( texto ) ;
    }
}