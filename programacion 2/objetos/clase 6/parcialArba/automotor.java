public class automotor extends Vehiculo { 
    private String patente;
    private double importeAdicional;
    
    
    //setters
    
    public void setPatente(String patente){
        this.patente=patente;
    }
    public void set(double importeAdicional){
        this.importeAdicional=importeAdicional;
    }
    
    //getters
    
    public String getPatente(){
        return patente;
    }
    public double getImporteAdicional(){
        return importeAdicional;
    }
       
    //metodos
    
    public double DevolverAdicionado(){
        double nuevoMonto ;
            nuevoMonto = super.getImporte() + importeAdicional;
        return nuevoMonto ;
    }
    super.getPatetnte() ;
}