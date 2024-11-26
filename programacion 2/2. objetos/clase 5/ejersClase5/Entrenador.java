public class Entrenador extends Persona {
    private int cantCampeonatosGanados ;
    
    // constructores
        public Entrenador() {}
        
        public Entrenador( String nombre , int dni , int edad , double sueldoBasico , int cantCampeonatosGanados ) {
            super( nombre , dni , edad , sueldoBasico ) ;
            
            this.cantCampeonatosGanados = cantCampeonatosGanados ;
        }
    //
    
    // getters
        public int    getCantCampeonatosGanados () { return cantCampeonatosGanados ; }
    //
    
    // setters
        public void setCantCampeonatosGanados ( int    cantCampeonatosGanados ) { this.cantCampeonatosGanados = cantCampeonatosGanados ; }
    //
    
    // metodos
        public double calcularSueldoACobrar() {
            double sueldo ;

            sueldo = super.getSueldoBasico() ;
            
            if ( 10 < cantCampeonatosGanados ) {
                sueldo += 50000 ;
            } else
            if ( 5 <= cantCampeonatosGanados ) {
                sueldo += 30000 ;
            } else
            if ( 1 <= cantCampeonatosGanados ) {
                sueldo += 5000 ;
            }
        
            return( sueldo ) ;
        }
    //
       
    public String toString () {
        return ( "Nombre: " + super.getNombre() + " Sueldo " + calcularSueldoACobrar() ) ;
    }
}