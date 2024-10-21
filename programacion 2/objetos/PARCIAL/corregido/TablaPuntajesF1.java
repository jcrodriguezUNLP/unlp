/**
 * Write a description of class TablaPuntajesF1 here.
 * 
 * @author (Leandro Romanut) 
 * @version (1.0)
 */
public class TablaPuntajesF1
{
     
    public TablaPuntajesF1()
    {

    }

    /**
     * Método para saber el puntaje que obtuvo un piloto en la carrera de F1
     * 
     * @params posicion
     * @return int
     */
    public static int obtenerPuntaje(int posicion)
    {
        
        int[] puntajes=new int[] {25,18,15,12,10,0,0,0,0,0};
        
        return puntajes[posicion-1];
    }
 
}
