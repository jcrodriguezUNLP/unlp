public class TablaPuntajesF1 {    
    // constructores
        public TablaPuntajesF1() {}
    //

    // metodos
        public static int obtenerPuntaje( int posicion ) { 
            int[] puntajes=new int[] {25,18,15,12,10,0,0,0,0,0};

            return puntajes[posicion-1];
        }
    //
}
