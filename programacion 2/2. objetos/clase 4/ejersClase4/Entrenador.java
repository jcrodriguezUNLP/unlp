public class Entrenador extends Persona {
    private double sueldoBasico           ;
    private int    cantCampeonatosGanados ;
    
    // constructores
        public Entrenador() {}
        
        public Entrenador( String nombre , int dni , int edad , double sueldoBasico , int cantCampeonatosGanados ) {
            super( nombre , dni , edad ) ;
            
            this.sueldoBasico           = sueldoBasico           ;
            this.cantCampeonatosGanados = cantCampeonatosGanados ;
        }
    //
    
    // getters
        public double getSueldoBasico           () { return sueldoBasico           ; }
        public int    getCantCampeonatosGanados () { return cantCampeonatosGanados ; }
    //
    
    // setters
        public void setSueldoBasico           ( double sueldoBasico           ) { this.sueldoBasico           = sueldoBasico           ; }
        public void setCantCampeonatosGanados ( int    cantCampeonatosGanados ) { this.cantCampeonatosGanados = cantCampeonatosGanados ; }
    //
    
    // metodos
        public double sueldoACobrar() {
            int adicional = 0 ;
            
            if ( 10 < cantCampeonatosGanados ) {
                adicional = 50000 ;
            }else
            if ( (5 <= cantCampeonatosGanados) && (cantCampeonatosGanados <= 10) ) {
                adicional = 30000 ;
            }else
            if ( 1 <= cantCampeonatosGanados ) {
                adicional = 5000 ;
            }
        
            return ( sueldoBasico + adicional ) ;
        }
    //
       
    @Override
    public String toString () {
        return ( "Nombre: " + getNombre() + ", SueldoBasico " + sueldoBasico + " CantCampeonatosGanados " + cantCampeonatosGanados + " Sueldo " + sueldoACobrar() ) ;
    }
}