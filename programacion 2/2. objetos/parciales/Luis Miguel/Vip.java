public class Vip extends Localidad {
    private boolean experienciaEspecial ;
    private double costo ;

    // constructores
        public Vip() {}
        
        public Vip( int numButaca , int numFila , String platea , String metodoPago , Persona comprador , boolean experienciaEspecial , double costo ) {
            super( "vip" , numButaca , numFila , platea , metodoPago , comprador ) ;
            
            this.experienciaEspecial = experienciaEspecial ;
            this.costo = costo ;
        }
    //
    
    // getters
        public boolean getExperienciaEspecial() { return experienciaEspecial ; }
        
        public double getCosto() { return costo ; }
    //
    
    // setters
        public void setExperienciaEspecial( boolean experienciaEspecial ) { this.experienciaEspecial = experienciaEspecial ; }
        
        public void setCosto( double costo ) { this.costo = costo ; }
    //
    
    // metodos
    //
       
    @Override
    public String toString () {
        return ( super.toString() + " || VIP: " + "ExperienciaEspecial: " + experienciaEspecial + " | Costo: " + costo ) ;
    }
}