public class Fecha {
    private int dia ;
    private int mes ;
    private int año ;

    // constructores
        public Fecha() {}

        public Fecha( int dia, int mes , int año ) {
            this.dia = dia ;
            this.mes = mes ;
            this.año = año ;
        }
    //
    
    // getters
        public int getDia() { return dia ; }
        
        public int getMes() { return mes ; }
        
        public int getAño() { return año ; }
    //
    
    // setters
        public void setDia( int dia ) { this.dia = dia ; }
        
        public void setMes( int mes ) { this.mes = mes ; }
        
        public void setAño( int año ) { this.año = año ; }        
    //
    
    public String toString () {
        return ( "Dia: " + dia + " Mes: " + mes + " Año: " + año ) ;
    }
}