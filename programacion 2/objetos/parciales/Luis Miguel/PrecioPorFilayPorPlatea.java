import java.util.HashMap;
import java.util.Map;

public class PrecioPorFilayPorPlatea {
    public PrecioPorFilayPorPlatea() {}

    public static double obtenerPrecioBaseEntrada( int fila , String platea ) {
        Map<String, double[]> map = new HashMap<>() ;

        double[] plateasAaD = new double[] { 75000.0 , 75000.0 , 75000.0 , 75000.0 , 75000.0 , 60000.0 , 60000.0 , 60000.0 , 60000.0 , 60000.0 } ;
        double[] plateasEaH = new double[] { 55000.0 , 55000.0 , 55000.0 , 55000.0 , 55000.0 , 40000.0 , 40000.0 , 40000.0 , 40000.0 , 40000.0 } ;
        double[] plateasIaK = new double[] { 35000.0 , 35000.0 , 35000.0 , 35000.0 , 35000.0 , 20000.0 , 20000.0 , 20000.0 , 20000.0 , 20000.0 } ;
        
        map.put( "A", plateasAaD ) ;
        map.put( "B", plateasAaD ) ;
        map.put( "C", plateasAaD ) ;
        map.put( "D", plateasAaD ) ;
        map.put( "E", plateasEaH ) ;
        map.put( "F", plateasEaH ) ;
        map.put( "G", plateasEaH ) ;
        map.put( "H", plateasEaH ) ;
        map.put( "I", plateasIaK ) ;
        map.put( "J", plateasIaK ) ;
        map.put( "K", plateasIaK ) ; 
        
        return( ( double[] )map.get( platea ) )[ (fila - 1) ] ;
    }
}