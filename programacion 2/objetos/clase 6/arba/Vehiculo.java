
public class Vehiculo
{
   private int año;
   private double importe;
   private Propietario propietario;
   
    public void setPropietario(Propietario propietario){
        this.propietario=propietario;
    }
    public void setAño(int año){
        this.año=año;
    }
    public void setImporte(double importe){
        this.importe=importe;
    }
    public int getAño(){
        return año;
    }
    public double getImporte(){
        return importe;
    }
    public Propietario getPropietario(){
        return propietario;
    }   
}
